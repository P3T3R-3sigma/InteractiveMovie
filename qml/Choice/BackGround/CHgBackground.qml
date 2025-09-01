import QtQuick
import Felgo

Item {

    id: iBackground

    anchors.fill: parent


    CHgPlaceholder {
        id: iPlaceholder
    }

    CHgMainVideo {
        id: iMainVideo

        pVideoNext: iSecondaryVideo
        pImageNext: iSecondaryImage
        z: 2

    }


    CHgSecondaryVideo {
        id: iSecondaryVideo

    }

    CHgSecondaryImage {
        id: iSecondaryImage
        z: 1

    }


    onVisibleChanged: {
        if  (visible) {
            if (mIsDebug) {
                iPlaceholder.visible = true
            } else {
                switch (mDisplay) {
                case mDisplayEnum.ONE_VIDEO: iMainVideo.visible = true; break
                case mDisplayEnum.TWO_VIDEO: iMainVideo.visible = true; break
                case mDisplayEnum.IMAGE: iSecondaryImage.visible = true
                }
            }
        }
    }

    function restartVideo() {
        iMainVideo.startVideo()
    }

    function getmListItemToCheckIfLoaded() {
        return [iSecondaryImage.getmListItemToCheckIfLoaded()];
    }

}
