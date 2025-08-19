import QtQuick
import Felgo

BasicLoaderContainer {

    id: item


    /*
      Controls graphic
      */
    property real widthPercent
    property real heightPercent
    property real xPercent
    property real yPercent

    /*
      Can be overriden - % no longer works if overriden
      */
    width: parent.width * widthPercent
    height: parent.height * heightPercent
    x: parent.width * xPercent
    y: parent.height * yPercent
    /*
      By default the image is centered
      */
    xPercent: (1 - widthPercent) / 2
    yPercent: (1 - heightPercent) / 2

    /*
      We need to force the download if we make the image visible, but we forgot to force the download before
      can be overriden
      */
    onVisibleChanged: {
        if (visible) {
            forceDownload()
        }
    }
}
