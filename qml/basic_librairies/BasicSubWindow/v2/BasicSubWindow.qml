import QtQuick
import Felgo

Item {

    /**
      Display a sub window of the original image with the coordinates [X, Y0, W0, H0]
      */

    id: mTHIS_SUBWINDOW_V1

    /**
      Coordinates in the original image (as shown in paint)
      */
    property var mX0Y0W0H0; // in the form of [X0, Y0, W0, H0]
    property bool mIS_SHOW_BORDER: true

    property real mXTheo
    property real mYTheo
    property real mWidthTheo
    property real mHeightTheo


    mXTheo: (parent.width - parent.paintedWidth) / 2 + parent.paintedWidth * mX0Y0W0H0[0] / parent.sourceSize.width
    mYTheo: (parent.height - parent.paintedHeight) / 2 + parent.paintedHeight * mX0Y0W0H0[1] / parent.sourceSize.height
    mWidthTheo: parent.paintedWidth * mX0Y0W0H0[2] / parent.sourceSize.width
    mHeightTheo: parent.paintedHeight * mX0Y0W0H0[3] / parent.sourceSize.height

    x: utils.clamp(mXTheo, 0, parent.width)
    y: utils.clamp(mYTheo, 0, parent.height)
    width: {
        let lWidth = mWidthTheo
        if (mXTheo < x) {
            lWidth += -(x - mXTheo)
        }
        if (mXTheo + mWidthTheo > parent.width) {
            lWidth += -(mXTheo + mWidthTheo - parent.width)
        }
        return lWidth
    }
    height: {
        let lHeight = mHeightTheo
        if (mYTheo < y) {
            lHeight += -(y - mYTheo)
        }
        if (mYTheo + mHeightTheo > parent.height) {
            lHeight += -(mYTheo + mHeightTheo - parent.height)
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
