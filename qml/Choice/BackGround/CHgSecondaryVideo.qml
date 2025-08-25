import QtQuick
import Felgo
import QtMultimedia

import "../../basic_librairies/BasicLoader/v1"
import "../../basic_librairies/BasicVideoSource/v1"
Item {
    id: iSecondaryVideo

    visible: false
    z:1

    anchors.fill: parent

    BasicVideoSource {
        id: iBasicVideoSourceWhileChoice
        mVolume: mVideoVolume
    }

    Component.onCompleted: {
        iBasicVideoSourceWhileChoice.sVideoEnd.connect(onVideoEnd)
        if (mDisplay === mDisplayEnum.TWO_VIDEOS) {
            iBasicVideoSourceWhileChoice.mSource = mSecondaryVideoSource
        }
    }

    onVisibleChanged: {
        if (visible) {
            iBasicVideoSourceWhileChoice.visible = true
        }
    }

    function onVideoEnd(mediaPlayer) {
        mediaPlayer.play()
    }
    function getmListItemToCheckIfLoaded() {
        if (mDisplay === mDisplayEnum.TWO_VIDEO) {
            return [iBasicVideoSourceWhileChoice];
        }
        return []
    }
}
