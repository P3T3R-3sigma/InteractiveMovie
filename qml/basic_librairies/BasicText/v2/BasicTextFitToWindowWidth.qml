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
          Adapt the size of the text
          */
        shadow_getmAppText().width = width * (1 - 2 * paddingPercentWidth - 2 * borderWidthPercent);
        /*
          Adapt the height of the window (border+padding)
          */
        let lRatioWidthToHeight = parent.width / parent.height;
        heightPercent = getmBoundingRectHeight() / (1 - 2 * paddingPercentHeight - 2 * borderWidthPercent * lRatioWidthToHeight);
    }


}
