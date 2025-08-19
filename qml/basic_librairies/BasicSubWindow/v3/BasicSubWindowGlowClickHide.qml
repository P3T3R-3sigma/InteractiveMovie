import QtQuick
import Felgo
import "../../BasicImageSource/v4"

Item {

    id: mTHIS_BASICSUBWINDOW_GLOW_CLICK_HIDE_V3

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      */

    property string folder_Glow: "InteractViewSimpleGlow/"
    property string folder_Item: "InteractViewSimpleGlow/"
    signal clicked(real sMouseX, real sMouseY)
    property string sourceSimple_Item
    property string sourceSimple_Glow
    property var mX0Y0W0H0_MouseArea
    property bool isForceGlow: false
    property bool isForceHide: false

    /*
      The image of the item to pick up once we click on the mouseArea
      */
    BasicSubWindowImage {
        id: mThisBasicSubWindowItem

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_HIDE_V3.parent
        visible: !isForceHide
        sourceSimple: parent.folder_Item + parent.sourceSimple_Item
    }

    /*
      The image glow when we mouse hover
      */
    BasicSubWindowImage {
        id: mThisBasicSubWindowGlow

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_HIDE_V3.parent
        visible: mThisBasicSubWindowItem.visible && (isForceGlow || mThisBasicSubWindowMouseArea.isHovered)
        sourceSimple: parent.folder_Glow + parent.sourceSimple_Glow
    }

    /*
      The area of hover and click // set to the same as the Item if undefined
      */
    BasicSubWindowMouseArea {
        id: mThisBasicSubWindowMouseArea

        parentImage: mTHIS_BASICSUBWINDOW_GLOW_CLICK_HIDE_V3.parent

        mX0Y0W0H0: parent.mX0Y0W0H0_MouseArea
        hoverEnabled: true

        onClicked: (sMouseX, sMouseY) => {
            isForceHide = true
            hoverEnabled = false;
            mTHIS_BASICSUBWINDOW_GLOW_CLICK_HIDE_V3.clicked(sMouseX, sMouseY);
        }
    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mThisBasicSubWindowItem, mThisBasicSubWindowGlow]
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
