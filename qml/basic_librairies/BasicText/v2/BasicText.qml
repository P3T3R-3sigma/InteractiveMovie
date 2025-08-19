import QtQuick
import Felgo
import "../../BasicItem/v3"

BasicItem {

    id: mTHIS_BASICTEXT_V2

    /*
      Constant
      */
    property int mDURATION_BUMP: 1000
    /*
      Background
      */
    property color backgroundColor: Qt.color("transparent")
    property real backgroundOpacity: 1
    property real radiusPctHeight: 0.1
    property color borderColor: Qt.color("transparent")
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
    property real textFontPixelSizePercent: 0.015 // in % or the height of the parent of the text window
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
    property int parentWidth: parent.width
    property int parentHeight: parent.height

    onParentWidthChanged: {
        compute();
    }
    onParentHeightChanged: {
        compute();
    }
    onVisibleChanged: {
        compute();
    }

    /*
      Override
      */
    function adjustWindow() {
        mBasicDisplay.errorOverride(mTHIS_BASICTEXT_V2, "adjustWindow");
    }

    Rectangle {
        id: mBorder

        /*
          Default values
          */
        color: borderColor
        radius: height * radiusPctHeight
        opacity: backgroundOpacity
        width: parent.width
        height: parent.height

        Rectangle {
            id: mBackGround

            /*
          Default values
          */
            color: mTHIS_BASICTEXT_V2.backgroundColor
            radius: height * mTHIS_BASICTEXT_V2.radiusPctHeight
            width: mBorder.width - 2 * Math.ceil(mTHIS_BASICTEXT_V2.borderWidthPercent * mBorder.width)
            height: mBorder.height - 2 * Math.ceil(mTHIS_BASICTEXT_V2.borderWidthPercent * mBorder.width)
            opacity: backgroundOpacity
            anchors.centerIn: parent

        }
    }

    AppText {
        id: mAppText

        parent: mTHIS_BASICTEXT_V2.parent

        /*
          Position and dimensions
          */
        x: mTHIS_BASICTEXT_V2.x + (mTHIS_BASICTEXT_V2.width - width) / 2
        y: mTHIS_BASICTEXT_V2.y + (mTHIS_BASICTEXT_V2.height - height) / 2
        // width: contentWidth
        // height: contentHeight
        z: mTHIS_BASICTEXT_V2.z

        visible: mTHIS_BASICTEXT_V2.visible

        /*
          Text
          */
        text: mTHIS_BASICTEXT_V2.text
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
                Math.ceil(textFontPixelSizePercent * mTHIS_BASICTEXT_V2.parentHeight)
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
        if (visible) {
            if (!shadow_is_computing) {
                shadow_is_computing = true;
                signalWindowOrTextChanged = true;
                shadow_is_computing = false;
            }
        }
    }

    onSignalWindowOrTextChangedChanged: {
        if (signalWindowOrTextChanged) {
            if (!mThisNumberAnimationTextBumpWindow.running
                    && !mThisNumberAnimationTextBump.running) {
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
        duration: mDURATION_BUMP
        easing.type: Easing.OutElastic
        from: 1
        onFinished: {
            signalWindowOrTextChanged = true;
        }
    }

    function startBumpText() {
        mThisNumberAnimationTextBump.to = Math.ceil(textFontPixelSizePercent * mTHIS_BASICTEXT_V2.parentHeight)
        mThisNumberAnimationTextBump.start();
    }

    ParallelAnimation {
        id: mThisNumberAnimationTextBumpWindow

        NumberAnimation {
            id: mThisSubAnimeWidth
            target: mBorder
            property: "width"
            duration: mDURATION_BUMP
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeHeight
            target: mBorder
            property: "height"
            duration: mDURATION_BUMP
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeX
            target: mBorder
            property: "x"
            duration: mDURATION_BUMP
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeY
            target: mBorder
            property: "y"
            duration: mDURATION_BUMP
            easing.type: Easing.OutElastic
        }
        NumberAnimation {
            id: mThisSubAnimeText
            target: mAppText
            property: "font.pixelSize"
            duration: mDURATION_BUMP
            easing.type: Easing.OutElastic
        }
        onFinished: {
            signalWindowOrTextChanged = true;
        }
    }

    function startBumpFullWindow() {
        mThisSubAnimeWidth.from = mBorder.width * 0.1
        mThisSubAnimeWidth.to = mBorder.width
        mThisSubAnimeHeight.from = mBorder.height * 0.1
        mThisSubAnimeHeight.to = mBorder.height
        mThisSubAnimeX.from = mBorder.x + (mBorder.width - mThisSubAnimeWidth.from) / 2
        mThisSubAnimeX.to = mBorder.x
        mThisSubAnimeY.from = mBorder.y + (mBorder.height - mThisSubAnimeHeight.from) / 2
        mThisSubAnimeY.to = mBorder.y
        mThisSubAnimeText.from = Math.ceil(textFontPixelSizePercent * 0.1 * mTHIS_BASICTEXT_V2.parentHeight);
        mThisSubAnimeText.to = Math.ceil(textFontPixelSizePercent * mTHIS_BASICTEXT_V2.parentHeight);
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
    function shadow_getmTHIS_BASICTEXT_V2WindowText_width() {
        return mTHIS_BASICTEXT_V2WindowText.width;
    }
    function shadow_getmTHIS_BASICTEXT_V2WindowText_height() {
        return mTHIS_BASICTEXT_V2WindowText.height;
    }
    function shadow_getmTHIS_BASICTEXT_V2WindowText() {
        return mTHIS_BASICTEXT_V2WindowText
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
