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
                case mCHc.mDisplayEnum.ONE_VIDEO: iMainVideo.visible = true; break
                case mCHc.mDisplayEnum.TWO_VIDEO: console.log("HERE1"); iSecondaryVideo.visible = true; break
                case mCHc.mDisplayEnum.IMAGE: iSecondaryImage.visible = true
                }
            }
        }
    }

    function setSource() {
        if (mCHc.mDisplayEnum.ONE_VIDEO === mDisplay) {
            iMainVideo.setSource()
        } else if (mCHc.mDisplayEnum.TWO_VIDEO === mDisplay) {
            iSecondaryVideo.setSource()
        }
    }
    function getSource() {
        if (mCHc.mDisplayEnum.ONE_VIDEO === mDisplay) {
            return iMainVideo.getSource()
        } else if (mCHc.mDisplayEnum.TWO_VIDEO === mDisplay) {
            iSecondaryVideo.getSource()
        }
        return null
    }

    function getmListItemToCheckIfLoaded() {
        return [iSecondaryImage.getmListItemToCheckIfLoaded()];
    }

    function getSecImage() {
        return iSecondaryImage
    }

}
