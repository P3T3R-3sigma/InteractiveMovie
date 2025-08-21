import QtQuick
import Felgo
import QtMultimedia

import "../basic_librairies/BasicLoader/v1"
import "../basic_librairies/BasicVideoSource/v1"
Item {
    id: iVideoWhileChoice

    visible: false
    z:1

    anchors.fill: parent

    BasicVideoSource {
        id: iBasicVideoSourceWhileChoice
        mSource: pVideoWhileChoiceSource
        mVolume: pVideoVolume
    }

    Component.onCompleted: {
        iBasicVideoSourceWhileChoice.sVideoEnd.connect(onVideoEnd)
    }

    function onVideoEnd(mediaPlayer) {
        mediaPlayer.play()
    }
    function getmListItemToCheckIfLoaded() {
        if (pVideoWhileChoiceSource) {
            return [iBasicVideoSourceWhileChoice];
        }
        return []
    }
}
