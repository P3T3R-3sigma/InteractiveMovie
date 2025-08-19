import QtQuick
import Felgo

BasicText {

    id: mThisBasicTextFitToWindowWidth

    /**
      Should be used if we want the text to stay within a given width (the window width)
      like a column

      the widthPercent and the textFontPixelSizePercent must be given,
      but the heightPercent will be computed
      */

    function adjustWindow() {
        /*
          Error if we have not a wrap mode --> we should set teh fontSize and use FitToWindow
          */
        if (!textIsWrapped) {
            mBasicDisplay.error(mThisBasicTextFitToWindowWidth, "To use BasicTextFitToWindowWidth, you should set textIsWrapped to true"
                                + "\nOtherwise, you must set the size of the font and use BasicTextFitToWindow");
        }
        /*
          Get the graphic objects
          */
        let lInterior = shadow_getmInterior();
        let lAppText = shadow_getmAppText();
        /*
          Exit if empty
          */
        if (lAppText.contenWidth === 0 || lAppText.contentHeight === 0) {
            return;
        }
        /*
          Set the Interior width inside the borders (= Item - border)
          */
        let lBorderWidth = borderWidthPercent * parentWidth;
        lInterior.width = width - 2 * lBorderWidth
        /*
          Set the size of the AppText (= Interior - padding)
          The height is deduced from the content
          */
        lAppText.width = lInterior.width - 2 * paddingPercentWidth * parentWidth
        lAppText.height = lAppText.contentHeight
        /*
          Deduce the interior height from the computed height
          */
        lInterior.height = lAppText.height + 2 * paddingPercentHeight * parentHeight;
        if (lInterior.width <= 0 || lInterior.height <= 0) {
            mBasicDisplay.error(mThisBasicTextFitToWindowWidth, "border or padding too big; lInterior.width= " + lInterior.width + "; lInterior.height= " + lInterior.height);
        }
        /*
          Adapt the height of the window (border+padding)
          */
        heightPercent = (lInterior.height + 2 * lBorderWidth) / parentHeight;
        /*
          Position all of the items
          */
        lInterior.x = (width - lInterior.width) / 2
        lInterior.y = (height - lInterior.height) / 2
        lAppText.x = (lInterior.width - lAppText.width) / 2
        lAppText.y = (lInterior.height - lAppText.height) / 2
    }


}
