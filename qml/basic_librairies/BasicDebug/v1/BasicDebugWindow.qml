import QtQuick
import Felgo
import "../../BasicText/v4"

BasicTextFitToWindow {

    id: mTHIS_BASIC_DEBUG_WINDOW_V1

    signal clicked

    MouseArea {
        anchors.fill: parent
        onClicked: {
            mTHIS_BASIC_DEBUG_WINDOW_V1.clicked();
        }
    }

    borderColor: "#4D4D4D"
    borderWidthPercent: 0.015

    backgroundColor: "lightgrey"
    textColor: "#4D4D4D"

    textIsWrapped: true
    textIsAlignToCenter: true

    paddingPercentHeight: heightPercent * (heightPercent < 0.20 ? 0 : 0.20)
    paddingPercentWidth: widthPercent * 0.10

    widthPercent: 0.50
    heightPercent: 0.50
    xPercent: (1 - widthPercent) / 2
    yPercent: (1 - heightPercent) / 2

}
