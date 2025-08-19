import QtQuick
import Felgo
import "../../BasicItem/v3"


AppImage {

    /**
      Utile pour gerer le chargmenet des images d'apres le BasicImageSourceManager
      */

    id: mTHIS_BASICIMAGE_SOURCE_V1

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

    property string sourceSimple
    property string name


    /**
      Source simple alows not to put the all  path everytime
      */
    onSourceSimpleChanged: {
        if (mBasicNum.isNull(sourceSimple) || sourceSimple === "") {
            source = "";
        } else if (sourceSimple.startsWith("..") || sourceSimple.startsWith("https")){
            source = sourceSimple;
        } else {
            source = "../../" + "../../assets/Images/" + sourceSimple;
        }
    }

    onSourceChanged: {
        if (mBasicNum.isNotNull(source) && source !== "") {
            let lArrayWords = ("" + source).split("/");
            if (lArrayWords.length > 0) {
                name = lArrayWords[lArrayWords.length - 1];
            }
        }
    }

    Component.onCompleted: {
        mBasicImageSourceManager.declareImage(mTHIS_BASICIMAGE_SOURCE_V1);
        /**
          Communication
          */
        if (mIS_COMMUNICATION) {
            console.log("Image created; source= " + source);
        }
    }


    function vStringStatus() {
        return "source= " + name
            + "; status= " + getStatusString()
            + "; downloaded= " + Math.round(progress * 100) + " %";

    }

    function getStatusString() {
        switch(status) {
        case Image.Null: return "Null";
        case Image.Ready: return "Ready";
        case Image.Loading: return "Loading";
        case Image.Error: return "Error";
        default: return "?"
        }
    }


    /**
      Getters & Setters
      */
    function getmIsReady() {
        return status === Image.Ready
    }

















}
