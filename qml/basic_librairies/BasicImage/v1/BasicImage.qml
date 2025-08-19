import QtQuick
import Felgo
import Qt5Compat.GraphicalEffects
import "../../BasicItem/v3"


BasicItem {

    id: mTHIS_BASICIMAGE_V1

    /**


      We can set only widthPercent (or heihgtPercent). The missing heightPercent (resp. widthPercent) will be deduced from the original size of the image


    */

    /*
      Constants
      */
    property bool mIS_COMMUNICATION: false
    /*
      !!! without the root assets/Images/.
             We take it from "assets/Images/"
      */
    property string source
    /*
      FillMode:
            PreserveAspectFit = Does not occupy all space: the image will have the same ratio and will adapt to either hieght or width, whichether allows the image to be the bigger
            PreserveAspectCrop = Occupy all space + preserve the image aspect: the image will be increased and cropped to the item
            Stretch= Occupy all space but the image will be distorted
      */
    property int fillMode: Image.PreserveAspectCrop
    property real radiusPct
    property real borderWidthPct
    property color borderColor: Qt.color("magenta")
    property color backgroundColor: Qt.color("transparent")
    property real backgroundOpacity: 1
    /*
      property repeated from the image
      */
    property int status
    property var sourceSize


    Component.onCompleted: {
        mBasicImageManager.declareImage(mTHIS_BASICIMAGE_V1);
        /**
          Communication
          */
        if (mIS_COMMUNICATION) {
            console.log("Image created; source= " + source);
        }
    }

    widthPercent: {
        if (mBasicImage_AppImage.progress == 1 && heightPercent != 0) {
            heightPercent
                * parent.height / parent.width
                * mBasicImage_AppImage.sourceSize.width / mBasicImage_AppImage.sourceSize.height
        } else {
            0
        }
    }

    heightPercent: {
        if (mBasicImage_AppImage.progress == 1 && widthPercent != 0) {
            widthPercent
                * parent.width / parent.height
                * mBasicImage_AppImage.sourceSize.height / mBasicImage_AppImage.sourceSize.width
        } else {
            0
        }
    }

    Rectangle {
        id: mBasicImage_Background

        radius: parent.radiusPct * Math.min(parent.width, parent.height)
        anchors.fill: parent
        color: backgroundColor
        opacity: backgroundOpacity
    }

    AppImage {
        id: mBasicImage_AppImage

        source: {
            if (parent.source === "") {
                ""
            } else if (parent.source.startsWith("https")) {
                parent.source
            } else {
                Qt.resolvedUrl("../../" + "../../assets/Images/" + parent.source)
            }
        }
        anchors.fill: parent
        fillMode: parent.fillMode
        onStatusChanged: {
            parent.status = status;
        }
        onSourceSizeChanged: {
            parent.sourceSize = sourceSize;
        }
    }

    Rectangle {
        id: mBasicImage_Border

        radius: mBasicImage_Background.radius
        anchors.fill: parent
        color: "transparent"

        border.width: Math.min(parent.width, parent.height) * parent.borderWidthPct
        border.color: parent.borderColor

    }

    Rectangle {
        id: mBasicImage_Mask

        visible: false

        anchors.fill: parent
        radius: mBasicImage_Background.radius
        color: "yellow"

    }

    layer.enabled: radiusPct > 0
    layer.effect: OpacityMask {
        maskSource: mBasicImage_Mask
    }

    function vString() {
        return "source= " + source
        + "; radiusPct= " + radiusPct
    }

    /*
      Getters & Setters
      */
    function progress() {
        return mBasicImage_AppImage.progress
    }
    function status() {
        return mBasicImage_AppImage.status
    }
    function sourceSizeWidth() {
        return  mBasicImage_AppImage.sourceSize.width
    }
    function sourceSizeHeight() {
        return  mBasicImage_AppImage.sourceSize.height
    }






















}
