import QtQuick
import Felgo
import Qt5Compat.GraphicalEffects
import "../../BasicImage/v3"
import "../../BasicImageSource/v4"
import "../../BasicItem/v3"
import "../../BasicDebug/v1"

BasicItem {

    id: mTHIS_BASIC_IMAGE_HOVER_V1

    /**
      Example:

            BasicImageHover {

                sourceSimple: "Angel_002.jpg"
                mSourceHover: "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"

                heightPercent: 0.50

                onClicked: {
                    console.log("CLicked")
                }
                onEntered: {
                    console.log("Entered")
                }
                onExited: {
                    console.log("Exited")
                }
            }
      **/

    /*
      Signal
      */
    signal clicked
    signal entered    //  if the mouse is already on the image when visible is true, then the signal is sent at start
    signal exited
    /*
      Controls
      */
    property string mSourceMain
    property string sourceSimpleMain
    property string mSourceHover
    property string sourceSimpleHover
    property real mBumpEffect: 0.10     //   in % of width and height
    property bool mIsBumpIfHover
    property bool mIsBumpIfClick
    /*
      Controls borders
      */
    property real borderWidthPctMain: 0 // in % of min(width, height)
    property real borderWidthPctHover: 0 // in % of min(width, height)
    property real radiusPct: 0
    property color borderColorMain: Qt.color("lightgrey")
    property color borderColorHover: Qt.color("#8D0C73")
    property color borderColorHoverGlow: borderColorHover
    property real radiusPctHoverGlow: 0.08
    property real spreadHoverGlow: 0.35 //  extend the solid part of the border into the glow (case of hover glow)

    /*
      Variables
      */
    property bool mIsImageHoverExists: mSourceHover || sourceSimpleHover

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        if (mIsImageHoverExists) {
            return [mThisBasicImage_Main, mThisBasicImage_Hover]
        } else {
            return [mThisBasicImage_Main]
        }
    }

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mThisBasicImage_Main.checkForReady() && heightPercent != 0) {
            heightPercent
                    * parent.height / parent.width
                    * mThisBasicImage_Main.sourceSize.width / mThisBasicImage_Main.sourceSize.height
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (mThisBasicImage_Main.checkForReady() && widthPercent != 0) {
            widthPercent
                    * parent.width / parent.height
                    * mThisBasicImage_Main.sourceSize.height / mThisBasicImage_Main.sourceSize.width
        } else {
            0
        }
    }

    /*
      */
    onVisibleChanged: {
        mThisImage.showMain();
    }

    /*
      Glow if hover - glow of the border
      */
    RectangularGlow {
        id: mThisBorderHoverGlow

        anchors.fill: mThisImage

        glowRadius: mTHIS_BASIC_IMAGE_HOVER_V1.radiusPctHoverGlow * Math.min(mTHIS_BASIC_IMAGE_HOVER_V1.width, mTHIS_BASIC_IMAGE_HOVER_V1.height)
        spread: mTHIS_BASIC_IMAGE_HOVER_V1.spreadHoverGlow
        color: mTHIS_BASIC_IMAGE_HOVER_V1.borderColorHoverGlow
        cornerRadius: mThisBorderHover.radius + glowRadius
    }


    /**
      Image container: Will show the image main or the image hover
      */
    Item {
        id: mThisImage

        property real widthPercent: 1
        property real heightPercent: 1

        width: parent.width * widthPercent
        height: parent.height * heightPercent
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        BasicImageSource {
            id: mThisBasicImage_Main

            anchors.fill: parent
            mSource: mTHIS_BASIC_IMAGE_HOVER_V1.mSourceMain
            sourceSimple: mTHIS_BASIC_IMAGE_HOVER_V1.sourceSimpleMain
        }

        /*
          We will set this image visible when the main image is hovered
          */
        BasicImageSource {
            id: mThisBasicImage_Hover

            anchors.fill: parent
            visible: false
            mSource: mTHIS_BASIC_IMAGE_HOVER_V1.mSourceHover
            sourceSimple: mTHIS_BASIC_IMAGE_HOVER_V1.sourceSimpleHover
        }

        /*
          Border Main
          */
        Rectangle {
            id: mThisBorderMain

            visible: mTHIS_BASIC_IMAGE_HOVER_V1.borderWidthPctMain > 0
            anchors.fill: parent
            color: "transparent"
            radius: mTHIS_BASIC_IMAGE_HOVER_V1.radiusPct * Math.min(mTHIS_BASIC_IMAGE_HOVER_V1.width, mTHIS_BASIC_IMAGE_HOVER_V1.height)
            border.color: Qt.color(mTHIS_BASIC_IMAGE_HOVER_V1.borderColorMain)
            border.width: mTHIS_BASIC_IMAGE_HOVER_V1.borderWidthPctMain * Math.min(mTHIS_BASIC_IMAGE_HOVER_V1.width, mTHIS_BASIC_IMAGE_HOVER_V1.height)
        }

        /*
          Border Hover
          */
        Rectangle {
            id: mThisBorderHover

            visible: false
            anchors.fill: parent
            color: "transparent"
            radius: mTHIS_BASIC_IMAGE_HOVER_V1.radiusPct * Math.min(mTHIS_BASIC_IMAGE_HOVER_V1.width, mTHIS_BASIC_IMAGE_HOVER_V1.height)
            border.color: Qt.color(mTHIS_BASIC_IMAGE_HOVER_V1.borderColorHover)
            border.width: mTHIS_BASIC_IMAGE_HOVER_V1.borderWidthPctHover * Math.min(mTHIS_BASIC_IMAGE_HOVER_V1.width, mTHIS_BASIC_IMAGE_HOVER_V1.height)
        }

        /*
          in case the mouse is outside
          */
        function showMain() {
            /*
              Image
              */
            mThisBasicImage_Main.visible = true;
            mThisBasicImage_Hover.visible = false;
            /*
              Border
              */
            mThisBorderMain.visible = true;
            mThisBorderHover.visible = false;
            mThisBorderHoverGlow.visible = false
        }

        /**
          in case we hover the mouse - or we start in the image
          */
        function showHover() {
            /*
              Image
              */
            if (mTHIS_BASIC_IMAGE_HOVER_V1.mIsImageHoverExists) {
                mThisBasicImage_Main.visible = false;
                mThisBasicImage_Hover.visible = true;
            } else {
                mThisBasicImage_Main.visible = true;
                mThisBasicImage_Hover.visible = false;
            }
            /*
              Border
              */
            mThisBorderMain.visible = false;
            mThisBorderHover.visible = true;
            mThisBorderHoverGlow.visible = true
        }

        /*
          Mask to round the image
          */
        Rectangle {
            id: mBasicImage_Mask

            visible: false

            anchors.fill: parent
            radius: mThisBorderMain.radius
            color: "yellow"

        }

        /*
          Mask
          */
        layer.enabled: mTHIS_BASIC_IMAGE_HOVER_V1.radiusPct > 0
        layer.effect: OpacityMask {
            maskSource: mBasicImage_Mask
        }

    }

    /*
      Area which triggers the hover and the click
      */
    MouseArea {
        id: mThisMouseArea_Hover

        anchors.fill: parent

        hoverEnabled: true

        onEntered: {    //  if the mouse is already on the image when visible is true, then the signal is sent at start
            checkIfInside();
            if (mIsBumpIfHover) {
                mThisAnimationBump.start();
            } else {
                mTHIS_BASIC_IMAGE_HOVER_V1.entered()
            }
            console.log("Entered")
        }
        onExited: {
            checkIfInside();
            mTHIS_BASIC_IMAGE_HOVER_V1.exited()
        }
        onClicked: {
            if (mIsBumpIfClick) {
                mThisAnimationBump.start();
            }
            mTHIS_BASIC_IMAGE_HOVER_V1.clicked()
        }
        onMouseXChanged: {  //  needed in case we start directly on the image
            checkIfInside();
        }
        onMouseYChanged: {  //  needed in case we start directly on the image
            checkIfInside();
        }

        function checkIfInside() {
            if (containsMouse) {
                mThisImage.showHover()
            } else {
                mThisImage.showMain();
            }
        }
    }

    /*
      Animation in case we enter or click
      */
    ParallelAnimation {
        id: mThisAnimationBump

        NumberAnimation {
            id: mThisNumberAnimationWidth

            target: mThisImage
            property: "widthPercent"
            duration: 250
            easing.type: Easing.InOutQuad
            from: 1
            to: 1 - mTHIS_BASIC_IMAGE_HOVER_V1.mBumpEffect
        }

        NumberAnimation {
            id: mThisNumberAnimationHeight

            target: mThisImage
            property: "heightPercent"
            duration: 250
            easing.type: Easing.InOutQuad
            from: 1
            to: 1 - mTHIS_BASIC_IMAGE_HOVER_V1.mBumpEffect
        }

        onRunningChanged: {
            if (!running) {
                mThisImage.widthPercent = 1;
                mThisImage.heightPercent = 1;
                mTHIS_BASIC_IMAGE_HOVER_V1.entered()
            }
        }

    }



}
















