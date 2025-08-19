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
          Get the graphic objects
          */
        let lInterior = shadow_getmInterior();
        let lAppText = shadow_getmAppText();
        /*
          Set the size of the AppText (= Content)
          */
        lAppText.width = lAppText.contentWidth
        lAppText.height = lAppText.contentHeight
        /*
          Set the interior (= AppText + Padding)
          */
        lInterior.width = lAppText.width + 2 * paddingPercentWidth * parentWidth
        lInterior.height = lAppText.height + 2 * paddingPercentHeight * parentHeight
        /*
          Set the window (= Interior + Border)
          */
        let lBorderWidth = borderWidthPercent * parentWidth;
        widthPercent = (lInterior.width + 2 * lBorderWidth) / parentWidth
        heightPercent = (lInterior.height + 2 * lBorderWidth) / parentHeight
        /*
          Position all of the items
          */
        lInterior.x = (width - lInterior.width) / 2
        lInterior.y = (height - lInterior.height) / 2
        lAppText.x = (lInterior.width - lAppText.width) / 2
        lAppText.y = (lInterior.height - lAppText.height) / 2
    }



}
