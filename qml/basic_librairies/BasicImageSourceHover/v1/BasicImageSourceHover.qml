import QtQuick
import Felgo
import "../../BasicImageSource/v4"
import "../../BasicItem/v3"

BasicImageSource {

    id: mTHIS_BASIC_IMAGE_SOURCE_HOVER

    /*
      Signal
      */
    signal clicked
    signal entered
    signal exited
    /*
      Controls
      */
    property string mSourceHover
    property string sourceSimpleHover

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mThisBasicImageSource_Hover]
    }

    /*
      We will set this image visible when the main image is hovered
      */
    BasicImageSource {
        id: mThisBasicImageSource_Hover

        anchors.fill: parent
        visible: false
        mSource: mTHIS_BASIC_IMAGE_SOURCE_HOVER.mSourceHover
        sourceSimple: mTHIS_BASIC_IMAGE_SOURCE_HOVER.sourceSimpleHover
        z: 1
    }

    /*
      Area which triggers the hover and the click
      */
    MouseArea {
        id: mThisMouseArea_Hover

        anchors.fill: parent

        hoverEnabled: true

        onEntered: {
            mThisBasicImageSource_Hover.visible = true
            mTHIS_BASIC_IMAGE_SOURCE_HOVER.entered()
        }
        onExited: {
            mThisBasicImageSource_Hover.visible = false
            mTHIS_BASIC_IMAGE_SOURCE_HOVER.exited()
        }
        onClicked: {
            mTHIS_BASIC_IMAGE_SOURCE_HOVER.clicked()
        }
    }



}
