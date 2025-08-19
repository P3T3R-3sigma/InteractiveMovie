import QtQuick
import Felgo
import "../../BasicText/v3"

BasicTextFitToWindowWidth {

    id: mTHIS_BASIC_CHAT_LINE_V2

    property bool mIsLeftOrRight
    property color mBackgroundColor
    property real mRadius



    /*
      Put the color of the chatline backgroung (green or white for example)
      */
    Rectangle {
        id: mTHIS_BACKGROUND

        color: mBackgroundColor
        width: mTHIS_BASIC_CHAT_LINE_V2.shadow_getmAppText().contentWidth
        + parent.paddingPercentWidth * parent.parentWidth * 2
        x: {
            if (mIsLeftOrRight) {
                0
            } else {
                parent.width - width
            }
        }
        radius: parent.mRadius
        y: parent.height / 2 - height / 2
        z: -1
    }

    /*
      Getters & Setters
      */
    function getmTHIS_BACKGROUND() {
        return mTHIS_BACKGROUND;
    }



}
