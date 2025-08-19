import QtQuick
import Felgo

BasicText {

    /**
      We cannot use wrapMode for this

      should be used if we want to have several windows with the same text characteristics
      */

    function adjustWindow() {
        /**
          We cannot use wrap
          */
        if (textIsWrapped) {
            mBasicDisplay.error(this, "We cannot use wrapMode for a BasicTextFitToText since the text is deciding the size")
        }
        /*
          Adjust the size of the window so that it inlcudes the padding and the border
          */
        widthPercent = getmBoundingRectWidth() / (1 - 2 * paddingPercentWidth - 2 * borderWidthPercent);
        let lRatioWidthToHeight = parent.width / parent.height;
        heightPercent = getmBoundingRectHeight() / (1 - 2 * paddingPercentHeight - 2 * borderWidthPercent * lRatioWidthToHeight);
    }



}
