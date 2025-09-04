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
    }


    CHgSecondaryVideo {
        id: iSecondaryVideo
    }

    CHgSecondaryImage {
        id: iSecondaryImage
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

    function setSource() {
        if (mDisplayEnum.ONE_VIDEO === mDisplay) {
            iMainVideo.setSource()
        }
    }
    function getSource() {
        if (mDisplayEnum.ONE_VIDEO === mDisplay) {
            return iMainVideo.getSource()
        }
        return null
    }

    function getmListItemToCheckIfLoaded() {
        return [iSecondaryImage.getmListItemToCheckIfLoaded()];
    }

}
