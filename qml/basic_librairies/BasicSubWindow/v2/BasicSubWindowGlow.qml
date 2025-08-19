import QtQuick
import Felgo
import "../../BasicImageSource/v1"

BasicSubWindow {

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      */

    id: mTHIS_BASICSUBWINDOW_GLOW_V1

    signal clicked(real sMousX, real sMouseY)
    property string source
    property string sourceSimple
    property string sourceGlow
    property string sourceGlowSimple


    BasicImageSource {
        id: mTHIS_APP_IMAGE

        visible: !mTHIS_APP_IMAGE_GLOW.visible
        anchors.fill: parent
        source: parent.source
        sourceSimple: parent.sourceSimple
    }

    BasicImageSource {
        id: mTHIS_APP_IMAGE_GLOW

        visible: false
        anchors.fill: parent
        source: parent.sourceGlow
        sourceSimple: parent.sourceGlowSimple
    }

    MouseArea {
        id: mTHIS_MOUSE_AREA_GLOW

        anchors.fill: parent
        z: 1
        hoverEnabled: true;
        onEntered: {
            mTHIS_APP_IMAGE_GLOW.visible = true;
        }
        onExited: {
            mTHIS_APP_IMAGE_GLOW.visible = false;
        }
        onClicked: {
            mTHIS_APP_IMAGE_GLOW.visible = false;
            parent.clicked(mTHIS_MOUSE_AREA_GLOW.mouseX, mTHIS_MOUSE_AREA_GLOW.mouseY)
        }
        onMouseXChanged: {
            if (containsMouse) {
                mTHIS_APP_IMAGE_GLOW.visible = true;
            } else {
                mTHIS_APP_IMAGE_GLOW.visible = false
            }
        }
        onMouseYChanged: {
            if (containsMouse) {
                mTHIS_APP_IMAGE_GLOW.visible = true;
            } else {
                mTHIS_APP_IMAGE_GLOW.visible = false
            }
        }
    }



}
