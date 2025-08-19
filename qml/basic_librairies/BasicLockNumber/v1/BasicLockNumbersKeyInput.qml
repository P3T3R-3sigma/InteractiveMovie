import QtQuick
import Felgo
import "../../BasicText/v4"

BasicTextFitToWindow {

    id: mThis

    backgroundColor: parent.mColorBackground
    borderColor: parent.mColorBorder
    borderWidthPercent: parent.mBorderWidthPercent

    radiusPctHeight: parent.mRadiusPercentHeight
    radiusInteriorPctHeight: radiusPctHeight

    textIsAlignToCenter: true
}
