import QtQuick
import Felgo

Item {

    id: mTHIS_BASICIMAGE_SOURCE_MANAGER_V1

    /*
      Constants
      */
    property bool mIS_COMMUNICATION: false
    /*
      Variables
      */
    property var mListBasicImageSource:[] // can be any image - but need the function


    Timer {
        id: mTIMER_DISPLAY

        interval: 1000
        onTriggered: {
            console.log();
            checkProgress(true);
            for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
                let lBasicImageSource = mListBasicImageSource[lIdx];
                console.log(lBasicImageSource.vStringStatus());
            }
        }

        repeat: true
    }

    function displayBasicImageSourceManager() {
        mTIMER_DISPLAY.start();
    }

    function declareImage(sBasicImageSource) {
        /*
          Check if IMage is already in the list
          */
        for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
            let lBasicImageSource = mListBasicImageSource[lIdx];
            if (lBasicImageSource === sBasicImageSource) {
                return;
            }
        }
        /**
          Add new image to the list
          */
        mListBasicImageSource.push(sBasicImageSource);
        /**
          Communication
          */
        if (mIS_COMMUNICATION) {
            mBasicDisplay.com(mTHIS_BASICIMAGE_SOURCE_MANAGER_V1, "Image added to the watch list= " + sBasicImageSource, true);
        }
    }

    /**
      Compute the % of images downloaded according to the sourceSize
      */
    function checkProgress(sIsDisplay) {
        let lProgress = 0;
        let lTotalSize = 0;
        let lMapStatusToQty = new Map();
        lMapStatusToQty.set(-1, 0);
        lMapStatusToQty.set(Image.Null, 0);
        lMapStatusToQty.set(Image.Ready, 0);
        lMapStatusToQty.set(Image.Loading, 0);
        lMapStatusToQty.set(Image.Error, 0);
        /*
          Compute total size and progress
          */
        for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
            let lBasicImageSource = mListBasicImageSource[lIdx];
            /*
              Load data of the image
              */
            let lSourceSize = lBasicImageSource.sourceSize;
            let lStatus = lBasicImageSource.status
            let lSize;
            if (mBasicNum.isNull(lSourceSize)) {
                lStatus = -1;
                lSize = 0;
            } else {
                lSize = lBasicImageSource.sourceSize.width * lBasicImageSource.sourceSize.height
            }
            /*
              Compute
              */
            lTotalSize += lSize;
            if (lStatus === Image.Ready) {
                lProgress += lSize;
            }
            /*
              Map update
              */
            let lQty = lMapStatusToQty.get(lStatus) + 1
            lMapStatusToQty.set(lStatus, lQty);
        }
        /*
          Communication
          */
        let lText = "Progress= " + Math.round(lProgress / lTotalSize * 100) + "%"
            + "; Status= "
            + "Total= " + mListBasicImageSource.length
            + "; Undefined= " + lMapStatusToQty.get(-1)
            + "; Null= " + lMapStatusToQty.get(0)
            + "; Loading= " + lMapStatusToQty.get(2)
            + "; Error= " + lMapStatusToQty.get(3)
            + "; Ready= " + lMapStatusToQty.get(1);
        if (mIS_COMMUNICATION || (mBasicNum.isNotNull(sIsDisplay) && sIsDisplay)) {
            console.log(lText);
        }
        /*
          Give back the % progress
          */
        return lProgress;
    }

    /**
      Create and return BasicImageSource
      */
    function createImage(sParent, sSource) {
        let lComponent = Qt.createComponent("BasicImageSource.qml");
        let lBasicImageSource = lComponent.createObject(sParent);
        lBasicImageSource.source = sSource
        return lBasicImageSource;
    }



}
