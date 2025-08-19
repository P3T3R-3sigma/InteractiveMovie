import QtQuick
import Felgo
import "../../BasicItem/v3"


Item {

    /**
      Utile pour gerer le chargmenet des images d'apres le BasicImageSourceManager
      */

    id: mTHIS_BASICIMAGE_SOURCE_V3

    /*
      Constants
      */
    property bool mIS_DEBUG: true
    /*

      SourceSimple: We take it from "assets/Images/"

      FillMode:
            PreserveAspectFit = Does not occupy all space: the image will have the same ratio and will adapt to either hieght or width, whichether allows the image to be the bigger
            PreserveAspectCrop = Occupy all space + preserve the image aspect: the image will be increased and cropped to the item
            Stretch= Occupy all space but the image will be distorted
      */

    /*
      Controls
      */
    property string mSource             // should be set at start
    property string sourceSimple        // should be set at start
    property real widthPercent
    property real heightPercent
    property real xPercent
    property real yPercent
    property int mPriorityToDownload: -1     // -1 --> at the end // the lower the number, the quicker the image will be in the list of download. By default, it will be changed to max priority
    property int fillMode
    property var mListItemToCheckIfLoaded: []
    /*
      Variables
      */
    property size sourceSize: mTHIS_APPIMAGE.sourceSize
    property int status: mTHIS_APPIMAGE.status
    property real paintedWidth: mTHIS_APPIMAGE.paintedWidth
    property real paintedHeight: mTHIS_APPIMAGE.paintedHeight
    property int mTimeElapsedDownload: -1
    property string mName
    /*
      Variables shadow
      */
    property real mShadow_width: width
    property real mShadow_height: height
    property string shadow_mSource
    property string shadow_sourceSimple
    property var shadow_timerStartTime
    property var shadow_timerTimeOut

    /*
      We need to add it to the manager
      */
    Component.onCompleted: {
        mBasicImageSourceManager.declareImage(mTHIS_BASICIMAGE_SOURCE_V3);
        /**
          Communication
          */
        if (mIS_DEBUG) {
            console.log("Image created; mSource= " + mSource + "; sourceSimple= " + sourceSimple);
        }
    }

    /**
      The actual visual item
      */
    AppImage {
        id: mTHIS_APPIMAGE

        anchors.fill: parent

        fillMode: parent.fillMode

        onStatusChanged: {
            mTHIS_BASICIMAGE_SOURCE_V3.checkForReadySelf()
        }

        onSourceChanged: {
            mTHIS_BASICIMAGE_SOURCE_V3.checkForReadySelf()
        }

    }

    /*
      We need to force the download if we make the image visible, but we forgot to force the download before
      */
    onVisibleChanged: {
        if (visible) {
            forceDownload()
        }
    }

    onMShadow_widthChanged: {
        checkForReadySelf()
    }

    onMShadow_heightChanged: {
        checkForReadySelf()
    }

    /*
      The item is ready when the image is fully loaded, when the source is defined, and when it has dimensions
      */
    function checkForReadySelf() {
        if (mShadow_width === 0) {
            return
        }
        if (mShadow_height === 0) {
            return
        }
        if (!mTHIS_APPIMAGE.source) {
            return
        }
        if (mTHIS_APPIMAGE.status !== Image.Ready) {
            return
        }
        /*
          Store the time it took to download
          */
        if (mTimeElapsedDownload < 0) {
            if (!shadow_timerStartTime) {
                mTimeElapsedDownload = 0
            } else {
                mTimeElapsedDownload = new Date().getTime() - shadow_timerStartTime
            }
            mBasicImageSourceManager.storeTimeDownload(mTHIS_BASICIMAGE_SOURCE_V3)
        }
    }

    /**
      Force the download of the image (unless it has already been enforced)
      */
    function forceDownload() {
        /*
          Com
          */
        if (mIS_DEBUG) {
            console.log("Force download  for " + mName)
        }
        /*
          We force the source of the image, which will trigger a download
          */
        let lWishSource
        if (sourceSimple && sourceSimple !== "") {
            lWishSource = mBasicSource.getSource(sourceSimple, "Images")
        } else if (mSource && mSource !== ""){
            lWishSource = mBasicSource.getSource(mSource)
        }
        /*
          set the source and Start timer
          */
        if (lWishSource && lWishSource != mTHIS_APPIMAGE.source) {
            /*
              Set source
              */
            mTHIS_APPIMAGE.source = lWishSource
            /*
              Start timer
              */
            shadow_timerStartTime = new Date().getTime();
            shadow_timerTimeOut = shadow_timerStartTime + mBasicImageSourceManager.getmTIME_OUT()
            /*
              Com
              */
            if (mIS_DEBUG) {
                console.log("Forcce download > mTHIS_APPIMAGE" + getStatusString())
            }
        }
    }

    /**
      */
    function cancelDownload() {
        /*
          Debug
          */
        if (mIS_DEBUG) {
            console.log("Cancel download for " + mName)
        }
        /*
          Cancel by setting the source at null
          */
        mTHIS_APPIMAGE.source = ""
        sourceSimple = ""
        mSource = ""
        /*
          Reset timer
          */
        shadow_timerStartTime = -1
        shadow_timerTimeOut = -1
        mTimeElapsedDownload = -1
    }

    /*
      sDelayBeforeRetry in milliseconds
      */
    function cancelAndRetry(sDelayBeforeRetry) {
        /*
          Memory
          */
        let lSourceSimple = sourceSimple
        let lMSource = mSource
        /*
          Cancel
          */
        cancelDownload()
        /*
          Schedule retry
          */
        scheduleRestart(sDelayBeforeRetry, lSourceSimple, lMSource)
    }

    /*
      */
    function scheduleRestart(sInterval, sSourceSimple, sMSource) {
        mTimer_ScheduleRestartDownload.interval = sInterval
        mTimer_ScheduleRestartDownload.sourceSimple = sSourceSimple
        mTimer_ScheduleRestartDownload.mSource = sMSource
        mTimer_ScheduleRestartDownload.start();
    }

    /*
      Timet to wait in case of time out, so we can retry the download
      */
    Timer {
        id: mTimer_ScheduleRestartDownload

        property string sourceSimple
        property string mSource

        onTriggered: {
            mTHIS_BASICIMAGE_SOURCE_V3.mSource = mSource
            mTHIS_BASICIMAGE_SOURCE_V3.sourceSimple = sourceSimple
        }
    }

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mTHIS_BASICIMAGE_SOURCE_V3.getmIsImageLoaded() && heightPercent != 0) {
            heightPercent
                    * parent.height / parent.width
                    * mTHIS_APPIMAGE.sourceSize.width / mTHIS_APPIMAGE.sourceSize.height
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (mTHIS_BASICIMAGE_SOURCE_V3.getmIsImageLoaded() && widthPercent != 0) {
            widthPercent
                    * parent.width / parent.height
                    * mTHIS_APPIMAGE.sourceSize.height / mTHIS_APPIMAGE.sourceSize.width
        } else {
            0
        }
    }

    /*
      Can be overriden - % no longer works if overriden
      */
    width: parent.width * widthPercent
    height: parent.height * heightPercent
    x: parent.width * xPercent
    y: parent.height * yPercent

    /*
      By default the image is centered
      */
    xPercent: (1 - widthPercent) / 2
    yPercent: (1 - heightPercent) / 2

    onMSourceChanged: {
        if (mSource) {
            /*
          check that we have not changed the source already
          */
            if (shadow_mSource && shadow_mSource !== mSource) {
                mBasicDisplay.error(mTHIS_BASICIMAGE_SOURCE_V3, "You cannot change the source twice, because it is not handled smoothly by QML. Use BasicImageSourceHover instead"
                                    + "\nold mSource= " + shadow_mSource
                                    + "\nnew mSource= " + mSource)
            } else if (mSource) {
                shadow_mSource = mSource
            }
            /*
          */
            setNameFromSource(mSource)
            checkPriorityVersusPath(mSource)
            /*
          Case that we change the source while the image is visible --> we should force the download on the spot
          */
            if (visible) {
                forceDownload();
            }
            /*
          Restart the auto-load of the BasicImageSourceManager
          */
            mBasicImageSourceManager.startTimerIfAutoLoad()
        }
    }

    onSourceSimpleChanged: {
        if (sourceSimple) {
            /*
          check that we have not changed the source already
          */
            if (shadow_sourceSimple && shadow_sourceSimple !== sourceSimple) {
                mBasicDisplay.error(mTHIS_BASICIMAGE_SOURCE_V3, "You cannot change the source twice, because it is not handled smoothly by QML. Use BasicImageSourceHover instead"
                                    + "\nold sourceSimple= " + shadow_sourceSimple
                                    + "\nnew sourceSimple= " + sourceSimple)
            } else if (sourceSimple) {
                shadow_sourceSimple = sourceSimple
            }
            /*
          */
            setNameFromSource(sourceSimple)
            checkPriorityVersusPath("Images/" + sourceSimple)
            /*
          Case that we change the source while the image is visible --> we should force the download on the spot
          */
            if (visible) {
                forceDownload();
            }
            /*
          Restart the auto-load of the BasicImageSourceManager
          */
            mBasicImageSourceManager.startTimerIfAutoLoad()
        }
    }

    function setNameFromSource(sSource) {
        if (mBasicNum.isNotNull(sSource) && sSource !== "") {
            let lArrayWords = ("" + sSource).split("/");
            if (lArrayWords.length > 0) {
                mName = lArrayWords[lArrayWords.length - 1];
            }
        }
    }

    /*
      Check the priority versus the map of folders // the manual priority prevails
      */
    function checkPriorityVersusPath(sSource) {
        if (mPriorityToDownload == -1) {
            for (let lEntries of cBIS.mMAP_PATH_TO_PRIORITY.entries()) {
                let lSubFolder = lEntries[0]
                let lPriority = lEntries[1]
                if (sSource.startsWith(lSubFolder)) {
                    mPriorityToDownload = lPriority;
                }
            }
        }
    }

    function vStringStatus() {
        return "source= " + mName
                + "; status= " + getStatusString();
    }

    function vStringDebug() {
        let lText = "\n" + mName
            + "\n" + "status= " + getStatusString()
            + "\n" + "getmIsSourceDefined()= " + getmIsSourceDefined()
            + "\n" + "getmIsInStartingBlocks()= " + getmIsInStartingBlocks()
            + "\n" + "getmIsLoading()= " + getmIsLoading()
            + "\n" + "getmIsImageLoaded()= " + getmIsImageLoaded()
            + "\n" + "getmIsTimerOut()= " + getmIsTimerOut()
            + (sourceSimple ? ("\n" + "sourceSimple= '" + sourceSimple) : "'")
            + (mSource ? ("\n" + "mSource= '" + mSource) : "'")
            + ((!sourceSimple && !mSource) ? ("\n" + "mSource = sourceSimple = ''") : "")
        return lText
    }

    function getStatusString() {
        switch(mTHIS_APPIMAGE.status) {
        case Image.Null: return "Null (no image has been set)";
        case Image.Ready: return "Ready (the image has been loaded)";
        case Image.Loading: return "Loading (the image is currently being loaded)";
        case Image.Error: return "Error (an error occurred while loading the image)";
        default: return "?"
        }
    }

    /*
      Definng the source will trigger a download of the Image
      */
    function getmIsSourceDefined() {
        return mBasicNum.isNotNull(mTHIS_APPIMAGE.source) && mTHIS_APPIMAGE.source != ""
    }

    /*
      The image is loading if the source has been defined and the status is something else than 'Ready' = the image has been loaded
      */
    function getmIsLoading() {
        return getmIsSourceDefined() && mTHIS_APPIMAGE.status !== Image.Ready
    }

    /*
      To know if the BasicImageSource is ready to be forced to download
      */
    function getmIsInStartingBlocks() {
        return (mBasicNum.isNotNull(mSource) && mSource != "")
                || (mBasicNum.isNotNull(sourceSimple) && sourceSimple != "")
    }

    /**
      */
    function getmIsImageLoaded() {
        return mTHIS_APPIMAGE.source && mTHIS_APPIMAGE.status === Image.Ready
    }

    /**
      */
    function getmIsTimerOut() {
        return new Date().getTime() > shadow_timerTimeOut
    }

    /*
      */
    function getmTimeSinceStartDownlad() {
        if (shadow_timerStartTime < 0) {
            return 0
        }
        return new Date().getTime() - shadow_timerStartTime
    }

    /*
      */
    function getmIsReady() {
        return getmIsImageLoaded();
    }

    /**
      Getters & Setters
      */
    function getmStatus() {
        return mTHIS_APPIMAGE.status
    }
    function getmPriorityToDownload() {
        return mPriorityToDownload
    }
    function getSourceSizeWidth() {
        return  mTHIS_APPIMAGE.sourceSize.width
    }
    function getmSourceSizeHeight() {
        return  mTHIS_APPIMAGE.sourceSize.height
    }
    function getmTHIS_APPIMAGE() {
        return mTHIS_APPIMAGE;
    }
    function getmTimeElapsedDownload() {
        return mTimeElapsedDownload;
    }
    function getmSource() {
        return mTHIS_APPIMAGE.source
    }
    function getmListItemToCheckIfLoaded() {
        return mListItemToCheckIfLoaded;
    }
    function getmName() {
        return mName;
    }












}
