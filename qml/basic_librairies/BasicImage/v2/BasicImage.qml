import QtQuick
import Felgo
import Qt5Compat.GraphicalEffects
import "../../BasicItem/v3"
import "../../BasicImageSource/v4"


BasicItem {

    id: mTHIS_BASICIMAGE_V2

    /**

      Allie BasicItem at BasicImageSource/AppImage en un seul objet + Possibilite de bordure et d'arrondis

      We can set only widthPercent (or heihgtPercent). The missing heightPercent (resp. widthPercent) will be deduced from the original size of the image

    */

    /*
      Constants
      */
    property bool mIS_COMMUNICATION: true
    /**
      Commands
      */
    property string source
    property string sourceSimple    // We take it from "assets/Images/"
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
      property repeated from the image source
      */
    property int status
    property var sourceSize
    property string name
    property double sourceSizeWidth
    property double sourceSizeHeight

    status: mTHIS_BASIC_IMAGE_SOURCE.status
    name: mTHIS_BASIC_IMAGE_SOURCE.mName
    sourceSize: mTHIS_BASIC_IMAGE_SOURCE.sourceSize
    sourceSizeWidth: mTHIS_BASIC_IMAGE_SOURCE.sourceSize.width
    sourceSizeHeight: mTHIS_BASIC_IMAGE_SOURCE.sourceSize.height

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mTHIS_BASIC_IMAGE_SOURCE.getmIsImageLoaded() && heightPercent != 0) {
            heightPercent
                * parent.height / parent.width
                * mTHIS_BASIC_IMAGE_SOURCE.sourceSize.width / mTHIS_BASIC_IMAGE_SOURCE.sourceSize.height
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (mTHIS_BASIC_IMAGE_SOURCE.getmIsImageLoaded() && widthPercent != 0) {
            widthPercent
                * parent.width / parent.height
                * mTHIS_BASIC_IMAGE_SOURCE.sourceSize.height / mTHIS_BASIC_IMAGE_SOURCE.sourceSize.width
        } else {
            0
        }
    }

    /*
      Background: when the image is not loaded
      */
    Rectangle {
        id: mBasicImage_Background

        radius: parent.radiusPct * Math.min(parent.width, parent.height)
        anchors.fill: parent
        color: backgroundColor
        opacity: backgroundOpacity
    }

    /*
      Actual Image
      */
    BasicImageSource {
        id: mTHIS_BASIC_IMAGE_SOURCE

        anchors.fill: parent

        mSource: parent.source
        sourceSimple: parent.sourceSimple
        fillMode: parent.fillMode
    }

    /*
      Border, defined by border width
      */
    Rectangle {
        id: mBasicImage_Border

        radius: mBasicImage_Background.radius
        anchors.fill: parent
        color: "transparent"

        border.width: Math.min(parent.width, parent.height) * parent.borderWidthPct
        border.color: parent.borderColor
    }

    /*
      Mask to round the image
      */
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

    /**
      Communication
      */
    function vString() {
        return "source= " + name
        + "; radiusPct= " + radiusPct
    }
    function vStringStatus() {
        return mTHIS_BASIC_IMAGE_SOURCE.vStringStatus()
    }
    function getStatusString() {
        return mTHIS_BASIC_IMAGE_SOURCE.getStatusString();
    }

    /*
      Getters & Setters
      */
    function getmStatus() {
        return mTHIS_BASIC_IMAGE_SOURCE.status
    }
    function getSourceSizeWidth() {
        return  mTHIS_BASIC_IMAGE_SOURCE.sourceSize.width
    }
    function getmSourceSizeHeight() {
        return  mTHIS_BASIC_IMAGE_SOURCE.sourceSize.height
    }
    function getmName() {
        return mTHIS_BASIC_IMAGE_SOURCE.getmName()
    }
    function getmIsReady() {
        return mTHIS_BASIC_IMAGE_SOURCE.getmIsReady();
    }
    function getmListItemToCheckIfLoaded() {
        return [mTHIS_BASIC_IMAGE_SOURCE]
    }
    function getmTHIS_BASIC_IMAGE_SOURCE() {
        return mTHIS_BASIC_IMAGE_SOURCE
    }




















}
