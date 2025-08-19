import QtQuick
import Felgo

BasicSubWindow {

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      */


    id: mBASIC_SUBWINDOW_IMAGE_V1

    property string source
    property string sourceSimple


    AppImage {
        id: mTHIS_APP_IMAGE

        anchors.fill: parent
    }

    onSourceChanged: {
        mTHIS_APP_IMAGE.source = source
    }
    onSourceSimpleChanged: {
        mTHIS_APP_IMAGE.source = "../../../../assets/Images/" + sourceSimple
    }

}
