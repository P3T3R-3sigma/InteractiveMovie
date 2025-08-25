import QtQuick
import Felgo

Item {

    id: iBackground

    anchors.fill: parent


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

    function getmListItemToCheckIfLoaded() {
        return [...iMainVideo.getmListItemToCheckIfLoaded(),
                ...iSecondaryVideo.getmListItemToCheckIfLoaded(),
                ...iSecondaryImage.getmListItemToCheckIfLoaded()];
    }

}
