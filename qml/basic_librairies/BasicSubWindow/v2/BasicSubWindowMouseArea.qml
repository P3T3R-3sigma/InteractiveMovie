import QtQuick
import Felgo

BasicSubWindow {

    id: mTHIS_BASICSUBWINDOW_MOUSEAREA_V1

    signal clicked

    MouseArea {
        anchors.fill: parent
        z: 1
        onClicked: {
            parent.clicked()
        }
    }

}
