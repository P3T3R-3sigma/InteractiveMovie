import QtQuick
import Felgo

BasicText {

    /**
      We cannot use wrapMode for this

      should be used if we want to have several windows with the same text characteristics
      */


    heightPercent: getmBoundingRectHeight() / (1 - 2 * this.paddingPercentHeight)

    function adjustWindow() {
        shadow_getmAppText().width = width * (1 - 2 * paddingPercentWidth)
        shadow_getmAppText().height = height
    }


}
