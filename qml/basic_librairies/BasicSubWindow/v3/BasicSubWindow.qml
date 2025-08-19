import QtQuick
import Felgo
import "../../BasicImageSource/v4"

Item {

    /**
      Display a sub window of the original image with the coordinates [X, Y0, W0, H0]
      */

    id: mTHIS_SUBWINDOW_V3

    /**
      Coordinates in the original image (as shown in paint)
      */
    property var mX0Y0W0H0; // in the form of [X0, Y0, W0, H0]
    property bool mIS_SHOW_BORDER: false

    property real mXTheo
    property real mYTheo
    property real mWidthTheo
    property real mHeightTheo

    property BasicImageSource parentImage: parent

    property real mX0Percent: {mX0Y0W0H0 === undefined ? 0 : mX0Y0W0H0[0] / parentImage.getSourceSizeWidth()}
    property real mY0Percent: {mX0Y0W0H0 === undefined ? 0 : mX0Y0W0H0[1] / parentImage.getmSourceSizeHeight()}
    property real mW0Percent: {mX0Y0W0H0 === undefined ? 1 : mX0Y0W0H0[2] / parentImage.getSourceSizeWidth()}
    property real mH0Percent: {mX0Y0W0H0 === undefined ? 1 : mX0Y0W0H0[3] / parentImage.getmSourceSizeHeight()}

    onParentImageChanged: {
        if (parentImage && !parentImage instanceof BasicImageSource) {
            mBasicDisplay.error(mTHIS_SUBWINDOW_V3, "The parent must be a BasicImageSource")
        }
    }


    mXTheo: (parentImage.width - parentImage.paintedWidth) / 2 + parentImage.paintedWidth * mX0Percent
    mYTheo: (parentImage.height - parentImage.paintedHeight) / 2 + parentImage.paintedHeight * mY0Percent
    mWidthTheo: parentImage.paintedWidth * mW0Percent
    mHeightTheo: parentImage.paintedHeight * mH0Percent

    x: utils.clamp(mXTheo, 0, parentImage.width)
    y: utils.clamp(mYTheo, 0, parentImage.height)
    width: {
        let lWidth = mWidthTheo
        if (mXTheo < x) {
            lWidth += -(x - mXTheo)
        }
        if (mXTheo + mWidthTheo > parentImage.width) {
            lWidth += -(mXTheo + mWidthTheo - parentImage.width)
        }
        return lWidth
    }
    height: {
        let lHeight = mHeightTheo
        if (mYTheo < y) {
            lHeight += -(y - mYTheo)
        }
        if (mYTheo + mHeightTheo > parentImage.height) {
            lHeight += -(mYTheo + mHeightTheo - parentImage.height)
        }
        return lHeight
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: "cyan"
        border.width: 3
        visible: mIS_SHOW_BORDER
        z: 1000
    }

    function vString() {
        return "x= " + x + "; y= " + y + "; width= " + width + "; height= " + height
    }
}
