import QtQuick
import Felgo

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


    AppImage {
        id: mTHIS_APP_IMAGE

        visible: !mTHIS_APP_IMAGE_GLOW.visible
        anchors.fill: parent
    }

    AppImage {
        id: mTHIS_APP_IMAGE_GLOW

        visible: false
        anchors.fill: parent
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


    onSourceChanged: {
        mTHIS_APP_IMAGE.source = source
    }
    onSourceSimpleChanged: {
        mTHIS_APP_IMAGE.source = "../../../../assets/Images/" + sourceSimple
    }
    onSourceGlowChanged: {
        mTHIS_APP_IMAGE_GLOW.source = sourceGlow
    }
    onSourceGlowSimpleChanged: {
        mTHIS_APP_IMAGE_GLOW.source = "../../../../assets/Images/" + sourceGlowSimple
    }





}
