import QtQuick
import Felgo
import "../../BasicItem/v3"

BasicItem {

    id: mTHIS_BASICTEXT_V1

    /*
      Background
      */
    property color backgroundColor: Qt.color("transparent")
    property real backgroundOpacity: 1
    property real radiusPctHeight: 0.1
    property color borderColor: Qt.color("white")
    property real borderWidthPercent: 0
    property real paddingPercentWidth: 0 //0.05
    property real paddingPercentHeight: 0 //0.15

    /*
      Text itself
      */
    property string text
    property color textColor: Qt.color("white")
    property real textOpacity: 1
    property font textFont
    property real textFontPixelSizePercent: 0.015
    property real textFontForceSizePixel: -1
    /*
      Options
      */
    property bool textIsAlignToCenter       // centers the text horizontally and vertically
    property bool textIsAlignToLeft         // left Text = left Background
    property bool textIsAlignToRight        // right Text = right Background
    property bool textIsAlignToCenterH      // centers the text horizontally
    property bool textIsAlignToTop          // top Text = top Background
    property bool textIsAlignToBottom       // bottom text = bottom Background
    property bool textIsAlignToCenterV      // centers the text vertically
    property bool textIsAlignJustify
    /*
      Super Options
      */
    property real textWordSpacingPixelsPercent        // increment/decrement the words spacing by this amount of pixels
    property real textLetterSpacingPixelsPercent        // increment/decrement the letters spacing by this amount of pixels
    property bool textIsWrapped: false
    property real textLineHeightPercent: 1      //  the percent of the line in terms of the height of the text. 1 means the line will fit the text. 2 will mean there will be one empty line between each line of text
    property int textWrapMode: Text.Wrap// Text.WrapAnywhere // Text.WordWrap // Text.Wrap
    /*
      property signals to recompute
      */
    property bool signalWindowOrTextChanged: false
    property bool shadow_is_computing: false

    onWidthChanged: {
        compute();
    }
    onHeightChanged: {
        compute();
    }

    /*
      Override
      */
    function adjustWindow() {
        mBasicDisplay.errorOverride(mTHIS_BASICTEXT_V1, "adjustWindow");
    }

    Rectangle {
        id: mBackGround

        /*
          Default values
          */
        color: backgroundColor
        radius: height * radiusPctHeight
        border.color: borderColor
        border.width: Math.ceil(borderWidthPercent * parent.width)
        opacity: backgroundOpacity
        anchors.fill: parent
    }

    /*
      Rectangle which will contain the AppText and delimit its size
      */


    AppText {
        id: mAppText

        parent: mTHIS_BASICTEXT_V1.parent

        /*
              Position and dimensions
              */
        x: mTHIS_BASICTEXT_V1.x + (mTHIS_BASICTEXT_V1.width - width) / 2
        y: mTHIS_BASICTEXT_V1.y + (mTHIS_BASICTEXT_V1.height - height) / 2
        width: contentWidth - 2 * mTHIS_BASICTEXT_V1.width * mTHIS_BASICTEXT_V1.paddingPercentWidth // mTHIS_BASICTEXT_V1.width * (1 - 2 * paddingPercentWidth)
        height: contentHeight - 2 * mTHIS_BASICTEXT_V1.height * mTHIS_BASICTEXT_V1.paddingPercentHeight // mTHIS_BASICTEXT_V1.height * (1 - 2 * paddingPercentHeight)
        z: mTHIS_BASICTEXT_V1.z

        visible: mTHIS_BASICTEXT_V1.visible

        /*
              Text
              */
        text: mTHIS_BASICTEXT_V1.text
        color: textColor
        opacity: textOpacity
        lineHeight: textLineHeightPercent
        /*
              Font
              */
        font.family: textFont.family
        font.weight: textFont.weight
        font.italic: textFont.italic
        font.styleName: textFont.styleName
        font.bold: textFont.bold
        font.pixelSize: {
            if (textFontForceSizePixel > 0) {
                textFontForceSizePixel
            } else {
                Math.ceil(textFontPixelSizePercent * mTHIS_BASICTEXT_V1.parent.height)
            }
        }

        font.letterSpacing: textLetterSpacingPixelsPercent * parent.height
        font.wordSpacing: textWordSpacingPixelsPercent * parent.height

        /*
              Position the text
              */
        wrapMode: {
            if (textIsWrapped) {
                textWrapMode
            } else {
                Text.NoWrap
            }
        }
        horizontalAlignment: {
            if (textIsAlignJustify) {
                Text.AlignJustify
            } else if (textIsAlignToRight) {
                Text.AlignRight
            } else if (textIsAlignToCenter || textIsAlignToCenterH) {
                Text.AlignHCenter
            } else {
                Text.AlignLeft
            }
        }
        verticalAlignment: {
            if (textIsAlignToBottom) {
                Text.AlignBottom
            } else if (textIsAlignToCenter || textIsAlignToCenterV) {
                Text.AlignVCenter
            } else {
                Text.AlignTop
            }
        }

        /*
              Signal if change
              */
        onContentHeightChanged: {
            compute();
        }
        onContentWidthChanged: {
            compute();
        }
        onTextChanged: {
            compute();
        }

    }

    function compute() {
        if (!shadow_is_computing) {
            shadow_is_computing = true;
            signalWindowOrTextChanged = true;
            shadow_is_computing = false;
        }
    }

    onSignalWindowOrTextChangedChanged: {
        if (signalWindowOrTextChanged) {
            if (!mThisNumberAnimationTextBumpWindow.running && !mThisNumberAnimationTextBump.running) {
                adjustWindow();
            }
            signalWindowOrTextChanged = false;
        }
    }

    /**
      */

    NumberAnimation {
        id: mThisNumberAnimationTextBump

        target: mAppText
        property: "font.pixelSize"
        duration: 1000
        easing.type: Easing.OutElastic
        from: 1
        onFinished: {
            signalWindowOrTextChanged = true;
        }
    }

    function startBumpText() {
        mThisNumberAnimationTextBump.to = Math.ceil(textFontPixelSizePercent * mTHIS_BASICTEXT_V1.parent.height)
        mThisNumberAnimationTextBump.start();
    }

    ParallelAnimation {
        id: mThisNumberAnimationTextBumpWindow

        NumberAnimation {
            id: mThisSubAnimeWidth
            target: mBackGround
            property: "width"
            duration: 1000
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeHeight
            target: mBackGround
            property: "height"
            duration: 1000
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeX
            target: mBackGround
            property: "x"
            duration: 1000
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeY
            target: mBackGround
            property: "y"
            duration: 1000
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeText
            target: mAppText
            property: "font.pixelSize"
            duration: 1000
            easing.type: Easing.OutElastic
        }
        onFinished: {
            signalWindowOrTextChanged = true;
        }
    }

    function startBumpFullWindow() {
        mThisSubAnimeWidth.from = mBackGround.width * 0.1
        mThisSubAnimeWidth.to = mBackGround.width
        mThisSubAnimeHeight.from = mBackGround.height * 0.1
        mThisSubAnimeHeight.to = mBackGround.height
        mThisSubAnimeX.from = mBackGround.x + (mBackGround.width - mThisSubAnimeWidth.from) / 2
        mThisSubAnimeX.to = mBackGround.x
        mThisSubAnimeY.from = mBackGround.y + (mBackGround.height - mThisSubAnimeHeight.from) / 2
        mThisSubAnimeY.to = mBackGround.y
        mThisSubAnimeText.from = Math.ceil(textFontPixelSizePercent * 0.1 * mTHIS_BASICTEXT_V1.parent.height);
        mThisSubAnimeText.to = Math.ceil(textFontPixelSizePercent * mTHIS_BASICTEXT_V1.parent.height);
        mThisNumberAnimationTextBumpWindow.start();
    }

    /*
      Getters & Setters
      */
    function getmBoundingRectHeight() {
        if (mBasicNum.isNull(parent) || parent.height == 0) {
            return 0
        }
        return mAppText.contentHeight / parent.height;
    }
    function getmBoundingRectWidth() {
        if (mBasicNum.isNull(parent) || parent.width == 0) {
            return 0
        }
        return mAppText.contentWidth / parent.width;
    }
    function getmPaddingLeft() {
        return width * paddingPercentWidth;
    }
    function getmPaddingTop() {
        return height * paddingPercentHeight
    }
    function shadow_getmTHIS_BASICTEXT_V1WindowText_width() {
        return mTHIS_BASICTEXT_V1WindowText.width;
    }
    function shadow_getmTHIS_BASICTEXT_V1WindowText_height() {
        return mTHIS_BASICTEXT_V1WindowText.height;
    }
    function shadow_getmTHIS_BASICTEXT_V1WindowText() {
        return mTHIS_BASICTEXT_V1WindowText
    }
    function shadow_getmAppText() {
        return mAppText;
    }
    function getTextFontPixelSize() {
        return mAppText.font.pixelSize;
    }
    function getVerticalAlignment() {
        return mAppText.verticalAlignment
    }

}
