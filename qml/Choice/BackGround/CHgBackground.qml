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

    function getmListItemToCheckIfLoaded() {
        return [...iMainVideo.getmListItemToCheckIfLoaded(),
                ...iSecondaryVideo.getmListItemToCheckIfLoaded(),
                ...iSecondaryImage.getmListItemToCheckIfLoaded()];
    }

}
