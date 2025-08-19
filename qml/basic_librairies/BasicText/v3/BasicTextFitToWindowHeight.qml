import QtQuick
import Felgo

BasicText {

    id: mThisBasicTextFitToWindowHeight

    /**
      should be used if we want the text to stay within a window height
      but the width is flexible (like a row)

      the heightPercent and the textFontPixelSizePercent must be given,
      but the widthPercent will be computed
      */

    function adjustWindow() {
        /*
          Error if we have not a wrap mode --> we should set teh fontSize and use FitToWindow
          */
        if (textIsWrapped) {
            mBasicDisplay.error(mThisBasicTextFitToWindowHeight, "To use BasicTextFitToWindowHeight, you should set textIsWrapped to false"
                                + "\nand you must set the size of the font");
        }
        /*
          We exit if there is no dimension
          */
        if (width === 0 && height === 0) {
            return;
        }
        /*
          Get the graphic objects
          */
        let lInterior = shadow_getmInterior();
        let lAppText = shadow_getmAppText();
        /*
          Exit if there is no text
          */
        if (lAppText.contenWidth === 0 || lAppText.contentHeight === 0) {
            return;
        }
        /*
          Set the Interior height inside the borders (= Item - border)
          */
        let lBorderWidth = borderWidthPercent * parentWidth;
        lInterior.height = height - 2 * lBorderWidth
        /*
          Set the size of the AppText (= Interior - padding)
          The height is deduced from the content
          */
        lAppText.height = lInterior.height - 2 * paddingPercentHeight * parentHeight
        lAppText.width = lAppText.contentWidth
        /*
          Deduce the interior width from the computed width
          */
        lInterior.width = lAppText.width + 2 * paddingPercentWidth * parentWidth;
        if (lInterior.width <= 0 || lInterior.height <= 0) {
            mBasicDisplay.error(mThisBasicTextFitToWindowHeight, "border or padding too big; lInterior.width= " + lInterior.width + "; lInterior.height= " + lInterior.height);
        }
        /*
          Adapt the height of the window (border+padding)
          */
        widthPercent = (lInterior.width + 2 * lBorderWidth) / parentWidth;
        /*
          Position all of the items
          */
        lInterior.x = (width - lInterior.width) / 2
        lInterior.y = (height - lInterior.height) / 2
        lAppText.x = (lInterior.width - lAppText.width) / 2
        lAppText.y = (lInterior.height - lAppText.height) / 2
    }


}
