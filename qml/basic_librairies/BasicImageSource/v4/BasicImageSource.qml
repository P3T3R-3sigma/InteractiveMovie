import QtQuick
import Felgo
import "../../BasicLoader/v1"


BasicLoaderContainerGraphic {

    /**
      Utile pour gerer le chargmenet des images d'apres le BasicImageSourceManager
      */

    id: mTHIS_BASICIMAGE_SOURCE_V4

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
    property int fillMode
    /*
      Variables
      */
    property size sourceSize: mTHIS_APPIMAGE.sourceSize
    property int status: mTHIS_APPIMAGE.status
    property real paintedWidth: mTHIS_APPIMAGE.paintedWidth
    property real paintedHeight: mTHIS_APPIMAGE.paintedHeight

    /*
      Link to the loader
      */
    mItemWithSource: mTHIS_APPIMAGE
    mFolderRoot: "Images/"


    /**
      The actual visual item
      */
    AppImage {
        id: mTHIS_APPIMAGE

        anchors.fill: parent

        fillMode: parent.fillMode

        onStatusChanged: {
            mTHIS_BASICIMAGE_SOURCE_V4.checkForReady()
        }

        onSourceChanged: {
            mTHIS_BASICIMAGE_SOURCE_V4.checkForReady()
        }

    }

    /*
      The item is ready when the image is fully loaded, when the source is defined, and when it has dimensions
      */
    function checkForReady() {
        if (!mTHIS_APPIMAGE.source) {
            return false
        }
        if (mTHIS_APPIMAGE.status !== Image.Ready) {
            return false
        }
        /*
          Store the time it took to download
          */
        mIsReady = true
        return true
    }

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mTHIS_BASICIMAGE_SOURCE_V4.getmIsImageLoaded() && heightPercent != 0) {
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
        if (mTHIS_BASICIMAGE_SOURCE_V4.getmIsImageLoaded() && widthPercent != 0) {
            widthPercent
                    * parent.width / parent.height
                    * mTHIS_APPIMAGE.sourceSize.height / mTHIS_APPIMAGE.sourceSize.width
        } else {
            0
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
        @DEPRECATED
        The image is loading if the source has been defined and the status is something else than 'Ready' = the image has been loaded
      */
    function getmIsLoading() {
        return getmIsSourceDefined() && mTHIS_APPIMAGE.status !== Image.Ready
    }

    /*
      @DEPRECATED
      To know if the BasicImageSource is ready to be forced to download
      */
    function getmIsInStartingBlocks() {
        return (mBasicNum.isNotNull(mSource) && mSource != "")
                || (mBasicNum.isNotNull(sourceSimple) && sourceSimple != "")
    }

    /**
      @DEPRECATED
      */
    function getmIsImageLoaded() {
        return mTHIS_APPIMAGE.source && mTHIS_APPIMAGE.status === Image.Ready
    }

    /**
        @DEPRECATED
      */
    function getmIsTimerOut() {
        return new Date().getTime() > shadow_timerTimeOut
    }

    /*
      @DEPRECATED
      */
    function getmTimeSinceStartDownlad() {
        if (shadow_timerStartTime < 0) {
            return 0
        }
        return new Date().getTime() - shadow_timerStartTime
    }

    /**
      used in the BasicLoaderContainer to display an error message in case of no download
      */
    function vStringErrorDownload() {
        return "mSource= " + mSource + "; Status= " + getStatusString()
    }

    /**
      Getters & Setters
      */
    function getmStatus() {
        return mTHIS_APPIMAGE.status
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
    /**
      @ DEPRECATED
      */
    function getmSource() {
        return mTHIS_APPIMAGE.source
    }
    function getSource() {
        return mTHIS_APPIMAGE.source
    }











}
