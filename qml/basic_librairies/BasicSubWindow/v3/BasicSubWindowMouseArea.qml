import QtQuick
import Felgo

BasicSubWindow {

    id: mTHIS_BASICSUBWINDOW_MOUSEAREA_V3

    signal clicked(real sMouseX, real sMouseY)
    property bool hoverEnabled
    property bool isHovered

    MouseArea {
        id: mThisMouseArea

        anchors.fill: parent
        z: 1

        hoverEnabled: parent.hoverEnabled;

        onMouseXChanged: {
            parent.isHovered = containsMouse
        }
        onMouseYChanged: {
            parent.isHovered = containsMouse
        }
        onEntered: {
            parent.isHovered = true
        }
        onExited: {
            parent.isHovered = false
        }

        onClicked: {
            parent.clicked(mThisMouseArea.mouseX, mThisMouseArea.mouseY)
        }
    }

    onHoverEnabledChanged: {
        if (!hoverEnabled) {
            isHovered = false;
        }
    }


}
