import QtQuick
import Felgo
import QtQuick.Controls

BasicText {

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
        shadow_getmAppText().width = width * (1 - 2 * paddingPercentWidth);
        shadow_getmAppText.height = height * (1 - 2 * paddingPercentHeight);
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
            if (getmBoundingRectWidth() > shadow_getmAppText().width / parent.width
                    || getmBoundingRectHeight() > shadow_getmAppText.height / parent.height) {
                lFontSizeUp = textFontPixelSizePercent;
            } else {
                lFontSizeDown = textFontPixelSizePercent;
            }
        } while (lFontSizeUp - lFontSizeDown > fontSizeError);
    }


}
