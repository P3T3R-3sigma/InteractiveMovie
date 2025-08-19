import QtQuick
import Felgo
import "../../BasicImageSource/v4"

Item {

    id: mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      */

    property string folder_Glow: "InteractViewSimpleGlow/"
    property string folder_Change
    signal clicked(real sMouseX, real sMouseY)
    property string sourceSimple_Change
    property var mX0Y0W0H0_Change
    property string sourceSimple_Glow
    property var mX0Y0W0H0_Glow
    property var mX0Y0W0H0_MouseArea
    property bool isForceGlow: false
    property bool isForceChange: false

    /*
      The image glow when we mouse hover
      */
    BasicSubWindowImage {
        id: mThisBasicSubWindowGlow

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3.parent
        visible: (isForceGlow || mThisBasicSubWindowMouseArea.isHovered) && !mThisBasicSubWindowChange.visible
        sourceSimple: parent.folder_Glow + parent.sourceSimple_Glow
        mX0Y0W0H0: parent.mX0Y0W0H0_Glow
    }

    /*
      The area of hover and click // set to the same as the change if undefined
      */
    BasicSubWindowMouseArea {
        id: mThisBasicSubWindowMouseArea

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3.parent

        mX0Y0W0H0: { parent.mX0Y0W0H0_MouseArea === undefined ? mThisBasicSubWindowChange.mX0Y0W0H0 : parent.mX0Y0W0H0_MouseArea }
        hoverEnabled: true

        onClicked: (sMouseX, sMouseY) => {
            isForceChange = true
            hoverEnabled = false;
            mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3.clicked(sMouseX, sMouseY);
        }
    }

    /*
      The image that we will put on top of the main image once the glow is clicked
      */
    BasicSubWindowImage {
        id: mThisBasicSubWindowChange

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_CHANGE_V3.parent
        visible: isForceChange
        mX0Y0W0H0: { parent.mX0Y0W0H0_Change === undefined ? parent.mX0Y0W0H0_Glow : parent.mX0Y0W0H0_Change}
        sourceSimple: parent.folder_Change + parent.sourceSimple_Change

    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mThisBasicSubWindowChange, mThisBasicSubWindowGlow]
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
