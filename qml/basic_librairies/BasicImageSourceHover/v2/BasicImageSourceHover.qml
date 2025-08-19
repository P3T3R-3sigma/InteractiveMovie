import QtQuick
import Felgo
import "../../BasicImageSource/v4"
import "../../BasicItem/v3"
import "../../BasicDebug/v1"

BasicItem {

    id: mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2

    /**
      Example:

            BasicImageSourceHover {

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
    signal clicked      // mouse click
    signal entered    //  if the mouse is already on the image when visible is true, then the signal is sent at start
    signal exited       // hover
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
    property var mX0Y0    // position of the image Main inside the image Hover (useful in case of image hover with a glow which is bigger than the image main)
    /*
      Variables
      */
    property size sourceSize: mThisBasicImageSource_Main.sourceSize
    property bool mIsImageHoverExists: mSourceHover || sourceSimpleHover

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        if (mIsImageHoverExists) {
            return [mThisBasicImageSource_Main, mThisBasicImageSource_Hover]
        } else {
            return [mThisBasicImageSource_Main]
        }
    }

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mThisBasicImageSource_Main.checkForReady() && heightPercent != 0) {
            heightPercent
                    * parent.height / parent.width
                    * mThisBasicImageSource_Main.sourceSize.width / mThisBasicImageSource_Main.sourceSize.height
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (mThisBasicImageSource_Main.checkForReady() && widthPercent != 0) {
            widthPercent
                    * parent.width / parent.height
                    * mThisBasicImageSource_Main.sourceSize.height / mThisBasicImageSource_Main.sourceSize.width
        } else {
            0
        }
    }

    /*
      */
    onVisibleChanged: {
        mThisImage.showMain();
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
            id: mThisBasicImageSource_Main

            anchors.fill: parent
            mSource: mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.mSourceMain
            sourceSimple: mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.sourceSimpleMain
        }

        /*
          We will set this image visible when the main image is hovered
          */
        BasicImageSource {
            id: mThisBasicImageSource_Hover

            visible: false
            mSource: mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.mSourceHover
            sourceSimple: mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.sourceSimpleHover

            widthPercent: !mX0Y0 ? 1 : sourceSize.width / mThisBasicImageSource_Main.sourceSize.width
            heightPercent: !mX0Y0 ? 1 : sourceSize.height / mThisBasicImageSource_Main.sourceSize.height
            xPercent: !mX0Y0 ? 0 : -mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.mX0Y0[0] / sourceSize.width * widthPercent
            yPercent: !mX0Y0 ? 0 : -mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.mX0Y0[1] / sourceSize.height * heightPercent
        }

        function showMain() {
            mThisBasicImageSource_Main.visible = true;
            mThisBasicImageSource_Hover.visible = false;
        }

        function showHover() {
            if (mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.mIsImageHoverExists) {
                mThisBasicImageSource_Main.visible = false;
                mThisBasicImageSource_Hover.visible = true;
            } else {
                showMain();
            }
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
            }
            mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.entered()
        }
        onExited: {
            checkIfInside();
            mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.exited()
        }
        onClicked: {
            if (mIsBumpIfClick) {
                mThisAnimationBump.start();
            } else {
                mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.clicked()
            }
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
            to: 1 - mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.mBumpEffect
        }

        NumberAnimation {
            id: mThisNumberAnimationHeight

            target: mThisImage
            property: "heightPercent"
            duration: 250
            easing.type: Easing.InOutQuad
            from: 1
            to: 1 - mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.mBumpEffect
        }

        onRunningChanged: {
            if (!running) {
                mThisImage.widthPercent = 1;
                mThisImage.heightPercent = 1;
                mTHIS_BASIC_IMAGE_SOURCE_HOVER_V2.clicked()
            }
        }

    }




}
















