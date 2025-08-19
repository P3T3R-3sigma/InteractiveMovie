import QtQuick
import Felgo

Item {

    id: mTHIS_BASIC_IMAGE_MANAGER_V1

    /*
      Constants
      */
    property bool mIS_COMMUNICATION: false
    /*
      Variables
      */
    property var mListBasicImage:[] // can be any image - but need the function


    function initiateBasicAppImageV2Manager() {

    }

    function declareImage(sBasicImage) {
        /*
          Check if IMage is already in the list
          */
        for (let lIdx = 0; lIdx < mListBasicImage.length; lIdx++) {
            let lImage = mListBasicImage[lIdx];
            if (lImage === sBasicImage) {
                return;
            }
        }
        /**
          Add new image to the list
          */
        mListBasicImage.push(sBasicImage);
        /**
          Communication
          */
        if (mIS_COMMUNICATION) {
            mBasicDisplay.com(mTHIS_BASIC_IMAGE_MANAGER_V1, "Image added to the watch list= " + sBasicImage, true);
        }
    }


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
        for (let lIdx = 0; lIdx < mListBasicImage.length; lIdx++) {
            let lImage = mListBasicImage[lIdx];
            /*
              Load data of the image
              */
            let lSourceSize = lImage.sourceSize;
            let lStatus = lImage.status
            let lSize;
            if (mBasicNum.isNull(lSourceSize)) {
                lStatus = -1;
                lSize = 0;


                //////////////////////////////////////////////
                // console.log(lImage.source + " -> null");
                /////////////////////////////////////////////

            } else {
                lSize = lImage.sourceSize.width * lImage.sourceSize.height

                //////////////////////////////////////////////
                // console.log("lImage.source= " + lImage.source
                //             + "lImage.sourceSize= " + lImage.sourceSize);
                /////////////////////////////////////////////

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
            + "Total= " + mListBasicImage.length
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
      Create and return BasicImage
      */
    function createImage(sParent, sSource) {
        let lComponent = Qt.createComponent("BasicImage.qml");
        let lBasicImage = lComponent.createObject(sParent);
        lBasicImage.source = sSource
        return lBasicImage;
    }

}
