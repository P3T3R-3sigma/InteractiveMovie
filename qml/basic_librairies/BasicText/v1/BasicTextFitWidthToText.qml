import QtQuick
import Felgo

BasicText {



    /**
      We cannot use wrapMode for this

      Should be used if we want to have several windows with the same text characteristics
      */


    widthPercent: {
        getmBoundingRectWidth() / (1 - 2 * paddingPercentWidth);
    }

    function adjustWindow() {
        shadow_getmAppText.height = height * (1 - 2 * paddingPercentHeight)
        shadow_getmAppText().width = width
    }


}
