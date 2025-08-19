import QtQuick
import Felgo
import "../../BasicText/v4"
import "../../BasicItem/v3"

BasicItem {

    id: mTHIS_BASIC_CHAT_V3

    /**
      Guide:
          use '\n' to break createLines
          use '__' to switch chatter
          We begin with the right chatter. To begin with the left chatter start with '__'
          a '__' with nothing will switch chatter with no line:
                doing 'bonjour____Hello' will put the words 'bonjour' and 'Hello' on the same right chatter

      */

    property string text
    property color textColor: "black"
    property color backgroundColorChatterRight: Qt.rgba(174/255, 255/255, 184/255)
    property color backgroundColorChatterLeft: "white"
    property real textFontPixelSizePercent    //   in % of the height
    property real heightInterLinesInPercentOfFontSizePixel: 0.80
    property real widthOneChatMaxPercent: 0.72   //  We limit the chats (left and right) to a percentage of the window width
    property var mListBasicChatLine;
    property int mChatter0: 0
    property real paddingPercentWidth: 0.025    // in % of the widty of this BasicChat * widthOneChatMaxPercent
    property real paddingPercentHeight: 0.50    // in % of the font height

    onTextChanged: {
        createLines();
        positionAndSizeLines();
    }

    onWidthChanged: {
        positionAndSizeLines();
    }

    onHeightChanged: {
        positionAndSizeLines();
    }

    Component.onCompleted: {
        positionAndSizeLines();
    }

    /**
      */
    function createLines() {
        /**
          Initiate
          */
        mListBasicChatLine = []
        let lArrayLines = text.split("__");
        let lPath = "../../BasicText/v4/";
        // let lComponentBasicChatLine = Qt.createComponent(lPath + "BasicChatLine.qml");
        let lComponentBasicChatLine = Qt.createComponent("BasicChatLine.qml");
        /*
          Loop over each chatter's line
          */
        for (let lIdx = 0; lIdx < lArrayLines.length; lIdx++) {
            let lLine = lArrayLines[lIdx];
            if (lLine !== "") {
                let lBasicChatLine = lComponentBasicChatLine.createObject(mTHIS_BASIC_CHAT_V3);
                /*
                  Initiate the line with text
                  */
                lBasicChatLine.text = lLine
                lBasicChatLine.textIsWrapped = true;
                /**
                  Add to list
                  */
                mListBasicChatLine.push(lBasicChatLine);
            }
        }
        /*
          Should we start with the left or right chat?
          */
        mChatter0 = text.startsWith("__") ? 1 : 0
    }

    /**
      */
    function positionAndSizeLines() {
        if (width == 0 || height == 0) {
            return;
        }
        /**
          Initiate
          */
        let lChatter = mChatter0;
        let lInterLinePercent = heightInterLinesInPercentOfFontSizePixel * textFontPixelSizePercent
        let lPaddingPercent = paddingPercentHeight * textFontPixelSizePercent
        let lYPercent = lPaddingPercent;
        /*
          Loop over each chatter's line
          */
        for (let lIdx = 0; lIdx < mListBasicChatLine.length; lIdx++) {
            let lBasicChatLine = mListBasicChatLine[lIdx];
            /*
              Initiate the common parameters
              */
            lBasicChatLine.textColor = textColor
            lBasicChatLine.y = lYPercent * height
            lBasicChatLine.textFontPixelSizePercent = textFontPixelSizePercent;
            lBasicChatLine.width = widthOneChatMaxPercent * width
            lBasicChatLine.paddingPercentWidth = paddingPercentWidth
            lBasicChatLine.mRadius = height * textFontPixelSizePercent * 0.5
            /*
              Adjust the rectangle background
              */
            lBasicChatLine.getmTHIS_BACKGROUND().height = lBasicChatLine.shadow_getmAppText().contentHeight
                + height * paddingPercentHeight * 2 * textFontPixelSizePercent
            /**
              Right line
              */
            if (lChatter == 0) {
                lBasicChatLine.mBackgroundColor = backgroundColorChatterRight;
                lBasicChatLine.textIsAlignToRight = true
                lBasicChatLine.mIsLeftOrRight = false;
                lBasicChatLine.x = width - lBasicChatLine.width
            }
            /*
              Left line
              */
            else {
                lBasicChatLine.x = 0
                lBasicChatLine.mBackgroundColor = backgroundColorChatterLeft;
                lBasicChatLine.textIsAlignToLeft = true
                lBasicChatLine.mIsLeftOrRight = true;                
            }
            /*
              Place the line
              */
            lBasicChatLine.visible = true;
            /*
             Shift to the down
             */
            lYPercent += lBasicChatLine.getmTHIS_BACKGROUND().height / height
                    + lInterLinePercent;
            lChatter = 1 - lChatter
        }
    }





}
