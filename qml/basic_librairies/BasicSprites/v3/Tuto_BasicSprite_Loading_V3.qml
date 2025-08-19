import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v4"
import "../../BasicDebug/v1"
import "../../BasicLoader/v1"

SceneAbstract {

    id: mThisSampleScene

    /////////////////////////////////////////////////////////////
    //      OTHER LIBRAIRIES NEEDED
    /////////////////////////////////////////////////////////////
    BasicDisplay {
        id: mBasicDisplay
    }
    BasicNum {
        id: mBasicNum
    }
    BasicConst {
        id: mBasicConst
    }
    BasicReflection {
        id: mBasicReflection
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicSpriteManager {
        id: mBasicSpriteManager

        mIS_DEBUG: true
    }
    BasicSource {
        id: mBasicSource

        mMODE_SOURCE: "WebAssembly"
    }
    BasicLoaderManager {
        id: mBasicLoaderManager

        mIS_DEBUG: true
    }



    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////

    /**
      The sprites are not meant to have change of size - we should black them out if we change the size
      */
    mDURATION: 0


    BasicAnimatedSprite {
        id: pThisBasicAnimatedSprite

        visible: false

        subFolder: "2025_04_30_View_main_Doors_TV"
        fileSprite: "20250510_View_main_Doors_TV_XYWH_0_0_256_256_Frequency_1_FrameCount_64_Idx_1.png"

        frameWidth: 256
        frameHeight: 256

        frameRate: 15
        frameCount: 64

        mIsReverseWhenFinished: true

        interpolate: true

        xPercent: 0

        opacity: 0.80
    }

    BasicSprite {
        id: pThisBasicSprite

        visible: false

        subFolder: "2025_04_24_View_main_SideBullBear_Fontain"
        fileSpriteFirst: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_20_Idx_1.png"
        fileSpriteLast: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_1_Idx_6.png"

        mIS_DEBUG: true

        xPercent: 0.50
        heightPercent: 0.40
    }

    /*
      Display button
      */
    AppButton {
        id: pButtonConsole

        width: parent.width * 0.15
        height: parent.height * 0.10
        x: parent.width * 0.45
        y: parent.height - height * 1.5
        text: "Console"
        onClicked: {
            displayCom()
        }
        function displayCom() {
            console.log("------ To console ----------")
            mBasicLoaderManager.toConsole();
            console.log()
            console.log(mBasicDisplay.getmDimensions(pThisBasicSprite))
            console.log(mBasicDisplay.getmDimensions(pThisBasicSprite.getmSpriteSequence()))
            console.log("----------------------------")
        }
    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [pThisBasicAnimatedSprite, pThisBasicSprite]
    }

    /*
      Download button
      */
    AppButton {
        id: pButtonLoad

        width: parent.width * 0.15
        height: parent.height * 0.10
        x: width * 0.70
        y: parent.height - height * 1.5
        text: "Download sources"
        onClicked: {
            console.log("------- launch loader -----------")
            /*
              Start loaded
              */
            mBasicLoaderManager.startCheck(mThisSampleScene, "loadedSuccess", pButtonLoad);
        }

        /*
          Notify if success
          */
        function loadedSuccess() {
            console.log("All sources loaded with success")

            pThisBasicAnimatedSprite.visible = true
            pThisBasicSprite.visible = true
            /*
              Com
              */
            pButtonConsole.displayCom();
        }
    }

    /*
      Cancel Button
      */
    AppButton {
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: parent.width - width * 1.5
        y: parent.height - height * 1.5
        text: "cancel sources"
        onClicked: {
            console.log("------- all sources canceled -----------")
            pThisBasicAnimatedSprite.cancelDownload()
            pThisBasicSprite.cancelDownload()
            /*
              Com
              */
            pButtonConsole.displayCom();
        }
    }

}
