import QtQuick
import Felgo

BasicText {

    /**
      We cannot use wrapMode for this

      should be used if we want to have several windows with the same text characteristics
      */

    heightPercent: getmBoundingRectHeight() / (1 - 2 * this.paddingPercentHeight)
    widthPercent: getmBoundingRectWidth() / (1 - 2 * paddingPercentWidth)

    function adjustWindow() {
        // widthPercent = getmBoundingRectWidth() / (1 - 2 * paddingPercentWidth);
        // heightPercent = getmBoundingRectHeight() / (1 - 2 * paddingPercentHeight);
    }



}
