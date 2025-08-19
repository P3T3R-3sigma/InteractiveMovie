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
        if (!textIsWrapped) {
            mBasicDisplay.error(mThisBasicTextFitToWindowHeight, "To use BasicTextFitToWindowHeight, you should set textIsWrapped to true"
                                + "\nOtherwise, you must set the size of the font and use BasicTextFitToWindow");
        }
        /*
          Adapt the size of the text
          */
        shadow_getmAppText().height = height * (1 - 2 * paddingPercentWidth - 2 * borderWidthPercent);
        /*
          Adapt the width of the window (border + padding)
          */
        widthPercent = getmBoundingRectWidth() / (1 - 2 * paddingPercentWidth - 2 * borderWidthPercent);
    }


}
