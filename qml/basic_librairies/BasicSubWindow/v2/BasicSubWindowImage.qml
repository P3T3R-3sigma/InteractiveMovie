import QtQuick
import Felgo
import "../../BasicImageSource/v1"

BasicSubWindow {

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      */


    id: mBASIC_SUBWINDOW_IMAGE_V2

    property string source
    property string sourceSimple


    BasicImageSource {
        id: mTHIS_APP_IMAGE

        anchors.fill: mBASIC_SUBWINDOW_IMAGE_V2
        source: mBASIC_SUBWINDOW_IMAGE_V2.source
        sourceSimple: mBASIC_SUBWINDOW_IMAGE_V2.sourceSimple
    }


}
