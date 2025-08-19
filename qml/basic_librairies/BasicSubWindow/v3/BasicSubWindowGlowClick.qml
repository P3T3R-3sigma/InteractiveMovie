import QtQuick
import Felgo
import "../../BasicImageSource/v4"

Item {

    id: mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      If we dont define mX0Y0W0H0_Glow, then the full image will be taken

      */


    signal clicked(real sMouseX, real sMouseY)
    property string folder_Glow: "InteractViewSimpleGlow/"
    property string sourceSimple_Glow
    property var mX0Y0W0H0_Glow // If we dont define mX0Y0W0H0_Glow, then the full image will be taken
    property var mX0Y0W0H0_MouseArea
    property bool hoverEnabled: true
    property bool isForceGlow: false

    /*
      The image glow when we mouse hover
      */
    BasicSubWindowImage {
        id: mThisBasicSubWindowGlow

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3.parent
        visible: isForceGlow || (parent.hoverEnabled && mThisBasicSubWindowMouseArea.isHovered)
        sourceSimple: parent.folder_Glow + parent.sourceSimple_Glow
        mX0Y0W0H0: parent.mX0Y0W0H0_Glow

    }

    /*
      The area of hover and click // set to the same as the change if undefined
      */
    BasicSubWindowMouseArea {
        id: mThisBasicSubWindowMouseArea
        mIS_SHOW_BORDER: true

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3.parent

        mX0Y0W0H0: { parent.mX0Y0W0H0_MouseArea === undefined ? parent.mX0Y0W0H0_Glow : parent.mX0Y0W0H0_MouseArea }
        enabled: parent.hoverEnabled
        hoverEnabled: parent.hoverEnabled

        onClicked: (sMouseX, sMouseY) => {
            parent.clicked(sMouseX, sMouseY);
        }
    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mThisBasicSubWindowGlow]
    }


    /*
      Getters & Setters
      */
    function setIsForceGlow(sIsForceGlow) {
        isForceGlow = sIsForceGlow;
    }
    function getIsForceGlow() {
        return isForceGlow;
    }















}
