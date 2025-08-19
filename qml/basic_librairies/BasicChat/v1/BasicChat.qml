import QtQuick
import Felgo
import "../../BasicText/v4"
import "../../BasicItem/v3"

BasicItem {

    id: mTHIS_BASIC_CHAT_V1

    /**
      Guide:

      */

    property string text
    property color textColor: "black"
    property color backgroundColorChatterRight: Qt.rgba(174/255, 255/255, 184/255)
    property color backgroundColorChatterLeft: "white"
    property real textFontForceSizePixel    //   in pixels (allow to have the same size accross BasicChats)
    property real heightInterLinesInPercentOfFontSizePixel: 0.80
    property real widthOneChatMaxPercent: 0.80   //  We limit the chats (left and right) to a percentage of the window width
    property list<BasicText> mListBasicTextLine;
    /**
      use '\n' to break createLines
      use '__' to switch chatter
      We begin with the right chatter. To begin with the left chatter start with '__'
      a '__' with nothing will switch chatter with no line:
            doing 'bonjour____Hello' will put the words 'bonjour' and 'Hello' on the same right chatter
      */
    function createLines() {
        /*
          Initiate
          */
        let lArrayLines = text.split("__");
        let lChatter = 0;
        let lPath = "../../BasicText/v4/";
        let lComponentBasicTextFitToText = Qt.createComponent(lPath + "BasicTextFitToText.qml");
        let lComponentBasicTextFitToWindowWidth = Qt.createComponent(lPath + "BasicTextFitToWindowWidth.qml");
        let lInterLinePercent = heightInterLinesInPercentOfFontSizePixel * textFontForceSizePixel / height;
        let lYPercent = lInterLinePercent;
        /*
          Loop over each chatter's line
          */
        for (let lIdx = 0; lIdx < lArrayLines.length; lIdx++) {
            let lLine = lArrayLines[lIdx];
            if (lLine !== "") {
                let lBasicText;
                /**
                  Create the Text, supposing it will be one line
                  */
                let lBasicTextFitToText = lComponentBasicTextFitToText.createObject(mTHIS_BASIC_CHAT_V1);
                lBasicTextFitToText.text = lLine
                lBasicTextFitToText.textFontForceSizePixel = textFontForceSizePixel;
                lBasicTextFitToText.textIsWrapped = true
                let lTextWidthPercent = lBasicTextFitToText.widthPercent // getmBoundingRectWidth()
                if (lTextWidthPercent <= widthOneChatMaxPercent) {
                    lBasicText = lBasicTextFitToText;
                }
                /**
                  If the text is too big, then we need to bound it to the sub window
                  */
                else {
                    let lBasicTextFitToWindowWidth = lComponentBasicTextFitToWindowWidth.createObject(mTHIS_BASIC_CHAT_V1);
                    lBasicTextFitToText.destroy();
                    lBasicTextFitToWindowWidth.text = lLine
                    lBasicTextFitToWindowWidth.textIsWrapped = true
                    lBasicTextFitToWindowWidth.textFontForceSizePixel = textFontForceSizePixel;
                    lBasicTextFitToWindowWidth.widthPercent = widthOneChatMaxPercent
                    lBasicText = lBasicTextFitToWindowWidth;
                }
                /*
                  According to the left or right, Format the line, and place it
                  */
                if (lChatter == 0) {
                    lBasicText.backgroundColor = backgroundColorChatterRight;
                    lBasicText.textIsAlignToRight = true
                    lBasicText.xPercent = 1 - lBasicText.widthPercent
                } else {
                    lBasicText.backgroundColor = backgroundColorChatterLeft;
                    lBasicText.textIsAlignToLeft = true
                    lBasicText.xPercent = 0;
                }
                /*
                  Place the line
                  */
                lBasicText.textColor = textColor
                lBasicText.yPercent = lYPercent
                lBasicText.visible = true;
                /*
                 Shift to the down
                 */
                lYPercent += lBasicText.heightPercent //getmBoundingRectHeight()
                        + lInterLinePercent;
            }
            /*
              Move on: switch chatter and add to Y
              */
            lChatter = 1 - lChatter
        }
    }






}
