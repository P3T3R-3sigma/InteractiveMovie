import QtQuick
import Felgo
import "../../BasicItem/v3"


AppImage {

    /**
      Utile pour gerer le chargmenet des images d'apres le BasicImageSourceManager
      */

    id: mTHIS_BASICIMAGE_SOURCE_V2

    /*
      Constants
      */
    property bool mIS_COMMUNICATION: false
    /*

      SourceSimple: We take it from "assets/Images/"

      FillMode:
            PreserveAspectFit = Does not occupy all space: the image will have the same ratio and will adapt to either hieght or width, whichether allows the image to be the bigger
            PreserveAspectCrop = Occupy all space + preserve the image aspect: the image will be increased and cropped to the item
            Stretch= Occupy all space but the image will be distorted
      */

    /*
      Signals
      */
    signal loaded       // triggered when the image is fully loaded and ready for use
    /*
      Controls
      */
    property string mSource             // should be set at start
    property string sourceSimple        // should be set at start
    property string name
    property real widthPercent
    property real heightPercent
    property real xPercent
    property real yPercent
    property bool mIsForceDownload
    property int mPriorityToDownload: -1     // -1 --> at the end // the lower the number, the quicker the image will be in the list of download. By default, it will be changed to max priority
    /*
      Variables
      */
    property bool mShadow_Is_change_source_allowed

    /*
      We need to add it to the manager
      */
    Component.onCompleted: {
        mBasicImageSourceManager.declareImage(mTHIS_BASICIMAGE_SOURCE_V2);
        /**
          Communication
          */
        if (mIS_COMMUNICATION) {
            console.log("Image created; source= " + source);
        }
    }

    /*
      We need to force the download if we make the image visible, but we forgot to force the download before
      */
    onVisibleChanged: {
        if (visible) {
            mIsForceDownload = true
        }
    }

    /**
      Force the download of the image
      */
    onMIsForceDownloadChanged: {
        mShadow_Is_change_source_allowed = true
        if (mBasicNum.isNotNull(sourceSimple) && sourceSimple != "") {
            source = mBasicSource.getSource(sourceSimple, "Images")
        } else {
            source = mBasicSource.getSource(mSource)
        }
        mShadow_Is_change_source_allowed = false
    }

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mTHIS_BASICIMAGE_SOURCE_V2.progress == 1 && heightPercent != 0) {
            heightPercent
                * parent.height / parent.width
                * mTHIS_BASICIMAGE_SOURCE_V2.sourceSize.width / mTHIS_BASICIMAGE_SOURCE_V2.sourceSize.height
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (mTHIS_BASICIMAGE_SOURCE_V2.progress == 1 && widthPercent != 0) {
            widthPercent
                * parent.width / parent.height
                * mTHIS_BASICIMAGE_SOURCE_V2.sourceSize.height / mTHIS_BASICIMAGE_SOURCE_V2.sourceSize.width
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


    onSourceChanged: {
        /*
          Parse to get the name of the file
          */
        setNameFromSource(source)
        /*
          Warning --> the source cannot be set directly because it triggers a download
          */
        if (mBasicNum.isNotNull(source) && source !== "" && !mShadow_Is_change_source_allowed) {
            mBasicDisplay.error(mTHIS_BASICIMAGE_SOURCE_V2, "You cannot set the source directly because it will download the image at start.
            \nYou should use mSource instead
            \nBasicImageSource= " + vStringStatus()
                                + "\nsource= " + source
                                + "\nparent= " + parent)
        }
    }

    onMSourceChanged: {
        setNameFromSource(mSource)
        checkPriorityVersusPath(mSource)
    }

    onSourceSimpleChanged: {
        setNameFromSource(sourceSimple)
        checkPriorityVersusPath("Images/" + sourceSimple)
    }

    /*
      Triger the signal if the image is loaded
      */
    onStatusChanged: {
        if (status === Image.Ready) {
            mTHIS_BASICIMAGE_SOURCE_V2.loaded()
        }
    }

    function setNameFromSource(sSource) {
        if (mBasicNum.isNotNull(sSource) && sSource !== "") {
            let lArrayWords = ("" + sSource).split("/");
            if (lArrayWords.length > 0) {
                name = lArrayWords[lArrayWords.length - 1];
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
        return "source= " + name
            + "; status= " + getStatusString()
            + "; downloaded= " + Math.round(progress * 100) + " %";

    }

    function getStatusString() {
        switch(status) {
        case Image.Null: return "Null (no image has been set)";
        case Image.Ready: return "Ready (the image has been loaded)";
        case Image.Loading: return "Loading (the image is currently being loaded)";
        case Image.Error: return "Error (an error occurred while loading the image)";
        default: return "?"
        }
    }

    /**
      */
    function forceDownload() {
        mIsForceDownload = true
    }

    /*
      Definng the source will trigger a download of the Image
      */
    function getmIsSourceDefined() {
        return mBasicNum.isNotNull(source) && source != ""
    }

    /*
      The image is loading if the source has been defined and the status is something else than 'Ready' = the image has been loaded
      */
    function getmIsLoading() {
        return getmIsSourceDefined() && status !== Image.Ready
    }

    /*
      Case the source has been defined and the image is fully loaded
      */
    function getmIsReady() {
        return getmIsSourceDefined() && status === Image.Ready
    }

    /*
      To know if the BasicImageSource is ready to be forced to download
      */
    function getmIsInStartingBlocks() {
        return (mBasicNum.isNotNull(mSource) && mSource != "")
        || (mBasicNum.isNotNull(sourceSimple) && sourceSimple != "")
    }

    /**
      Getters & Setters
      */
    function getName() {
        return name;
    }
    function getmStatus() {
        return status
    }
    function getmPriorityToDownload() {
        return mPriorityToDownload
    }
    function getSourceSizeWidth() {
        return  mTHIS_BASICIMAGE_SOURCE_V2.sourceSize.width
    }
    function getmSourceSizeHeight() {
        return  mTHIS_BASICIMAGE_SOURCE_V2.sourceSize.height
    }













}
