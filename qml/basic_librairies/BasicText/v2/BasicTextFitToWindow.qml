import QtQuick
import Felgo
import QtQuick.Controls

BasicText {

    id: mTHIS_BASICTEXT_FIT_TO_WINDOW

    /*
      We need to do the line break ourselves since the text will fit to the window as given

      Should be used if we have one window and we want the text to be well put in it
      */

    property real fontSizeMax: 0.2
    property real fontSizeMin: 0.001
    property real fontSizeError: 0.001 // 0.001

    function adjustWindow() {
        if (getmBoundingRectWidth() == 0 || getmBoundingRectHeight() == 0) {
            return;
        }
        shadow_getmAppText().width = width * (1 - 2 * paddingPercentWidth - 2 * borderWidthPercent);
        shadow_getmAppText().height = height * (1 - 2 * paddingPercentHeight) - 2 * width * borderWidthPercent;
        /*
            Find the optimal font
          */
        let lFontSizeUp = fontSizeMax;
        let lFontSizeDown = fontSizeMin;
        do {
            /*
              Change the size of the font
              */
            textFontPixelSizePercent = (lFontSizeUp + lFontSizeDown) / 2;
            /*
              Move the dichotomy
              */
            if (shadow_getmAppText().contentWidth > shadow_getmAppText().width
                    || shadow_getmAppText().contentHeight > shadow_getmAppText().height) {
                lFontSizeUp = textFontPixelSizePercent;
            } else {
                lFontSizeDown = textFontPixelSizePercent;
            }
        } while (lFontSizeUp - lFontSizeDown > fontSizeError);
        textFontPixelSizePercent = lFontSizeDown;
    }


}
