import QtQuick
import Felgo
import "../../BasicDebug/v1"

Item {

    id: mThisTimeBar

    x: parent.width * cBasicVideo.time_X
    y: (parent.height - height) / 2
    width: parent.width * cBasicVideo.time_W
    height: parent.height * cBasicVideo.time_H

    //////////////////////////////////////
    // BasicDebugRectangle{visible: true; opacity: 0.10}
    //////////////////////////////////////

    Rectangle {
        id: mTimeBar

        x: mThisTimeBar.width * cBasicVideo.time_MARGIN
        y: mThisTimeBar.getmY_Mid_SoundBar() - height / 2
        width: mThisTimeBar.width * cBasicVideo.time_BAR_W
        height: mThisTimeBar.height * cBasicVideo.time_BAR_H
        radius: height / 2

        color: cBasicVideo.time_COLOR_BAR
        opacity: 0.50

        /*
          The bar what was watched already
          */
        Rectangle {
            id: mThisSoundBarActive

            height: parent.height
            radius: height / 2
            color: cBasicVideo.time_COLOR_READ_BAR
        }

        MouseArea {
            width: parent.width
            height: parent.height * 2
            y: (parent.height - height) / 2

            onClicked: {
                let lPct = mouseX / width
                mThisTimeBar.setmPositionPct(lPct)
            }

            hoverEnabled: true
            onEntered: {
                cursorShape = Qt.UpArrowCursor
            }
            onExited: {
                cursorShape = Qt.ArrowCursor
            }
        }
    }

    /**
      Real time update of the time bar
      */
    function updateTimeBar(sPositionPct) {
        mThisSoundBarActive.width = sPositionPct * mTimeBar.width
    }

    /*
      Getters & Setters
      */
    function getmPosition() {
        parent.getmPosition();
    }
    function setmPosition(sPosition) {
        parent.setmPosition(sPosition)
    }
    function getmY_Mid_SoundBar() {
        return parent.getmThisBasicVideoStartPauseStop().getmY_Mid_SoundBar()
    }
    function setmPositionPct(sPositionPct) {
        parent.setmPositionPct(sPositionPct)
    }

}
