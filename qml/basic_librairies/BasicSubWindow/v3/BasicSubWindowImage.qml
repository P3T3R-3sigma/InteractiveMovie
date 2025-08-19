import QtQuick
import Felgo
import "../../BasicImageSource/v4"

BasicSubWindow {

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      */


    id: mBASIC_SUBWINDOW_IMAGE_V3

    property string folderSimple
    property string mSource
    property string sourceSimple


    BasicImageSource {
        id: mTHIS_APP_IMAGE

        anchors.fill: mBASIC_SUBWINDOW_IMAGE_V3
        mSource: mBASIC_SUBWINDOW_IMAGE_V3.mSource
        sourceSimple: mBASIC_SUBWINDOW_IMAGE_V3.folderSimple + mBASIC_SUBWINDOW_IMAGE_V3.sourceSimple
    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mTHIS_APP_IMAGE]
    }
}
