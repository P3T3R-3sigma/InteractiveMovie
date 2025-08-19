import QtQuick
import Felgo
import QtQuick.Controls

BasicText {

    id: mTHIS_BASICTEXT_FIT_TO_WINDOW

    /*
      We need to do the line break ourselves since the text will fit to the window as given

      Should be used if we have one window and we want the text to be well put in it
      */

    property real fontSizeMax: 1
    property real fontSizeMin: 0.001
    property real fontSizeError: 0.001 // 0.001

    ////////////////////////////////////////////
    property bool mIsDebug
    ////////////////////////////////////////////


    function adjustWindow() {
        ////////////////////////////////////////////
        if (mIsDebug) {
            console.log()
            console.log("width= " + width + "; heigh " + height)
        }
        ////////////////////////////////////////////

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
          Set the background inside the borders (= Item - border)
          */
        let lBorderWidth = borderWidthPercent * parentWidth;
        lInterior.width = mTHIS_BASICTEXT_FIT_TO_WINDOW.width - 2 * lBorderWidth
        lInterior.height = mTHIS_BASICTEXT_FIT_TO_WINDOW.height - 2 * lBorderWidth;
        lInterior.x = (mTHIS_BASICTEXT_FIT_TO_WINDOW.width - lInterior.width) / 2
        lInterior.y = (mTHIS_BASICTEXT_FIT_TO_WINDOW.height - lInterior.height) / 2
        if (lInterior.width <= 0 || lInterior.height <= 0) {
            mBasicDisplay.error(mTHIS_BASICTEXT_FIT_TO_WINDOW, "border is too big"
                + "\nlInterior.width= " + lInterior.width + "; lInterior.height= " + lInterior.height
                + "\nlBorderWidth= " + lBorderWidth
                + "\nwidth= " + mTHIS_BASICTEXT_FIT_TO_WINDOW.width + "; height= " + mTHIS_BASICTEXT_FIT_TO_WINDOW.height
                + "\ntext= " + lAppText.text
            );
        }
        /*
          We exit if there is no text
          */
        if (getmBoundingRectWidth() == 0 || getmBoundingRectHeight() == 0) {
            return;
        }
        /*
          Set the size of the AppText (= Interior - padding)
          */
        lAppText.width = lInterior.width - 2 * paddingPercentWidth * parentWidth
        lAppText.height = lInterior.height - 2 * paddingPercentHeight * parentHeight
        lAppText.x = (lInterior.width - lAppText.width) / 2
        lAppText.y = (lInterior.height - lAppText.height) / 2
        /*
            Find the optimal font
          */
        let lFontSizeUp = fontSizeMax;
        let lFontSizeDown = fontSizeMin;
        if (textFontPixelSizePercentMax > 0) {
            lFontSizeUp = Math.min(textFontPixelSizePercentMax, lFontSizeUp)
            lFontSizeDown = Math.min(textFontPixelSizePercentMax, lFontSizeDown);
        }

        ////////////////////////////////////////////
        if (mIsDebug) {
            console.log("visible= " + visible)
            console.log("textFontPixelSizePercentMax= " + textFontPixelSizePercentMax)
            console.log("lFontSizeUp= " + lFontSizeUp)
            console.log("lFontSizeDown= " + lFontSizeDown)
        }
        ////////////////////////////////////////////

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

            ////////////////////////////////////////////
            if (mIsDebug) {
                console.log("textFontPixelSizePercent= " + textFontPixelSizePercent)
                console.log("shadow_getmAppText().width= " + shadow_getmAppText().width)
                console.log("shadow_getmAppText().height= " + shadow_getmAppText().height)
                console.log("shadow_getmAppText().contentWidth= " + shadow_getmAppText().contentWidth)
                console.log("shadow_getmAppText().contentHeight= " + shadow_getmAppText().contentHeight)
            }
            ////////////////////////////////////////////


        } while (lFontSizeUp - lFontSizeDown > fontSizeError);
        textFontPixelSizePercent = lFontSizeDown;

        ////////////////////////////////////////////
        if (mIsDebug) {
            console.log("textFontPixelSizePercent= " + textFontPixelSizePercent)
        }
        ////////////////////////////////////////////

    }


}
