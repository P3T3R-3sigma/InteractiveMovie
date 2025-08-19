import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v1"
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
    BasicImageSourceManager {
        id: mBasicImageSourceManager
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


    onWStartChanged: {

    }


    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [pSprite1, pSprite2, pSprite3]
    }



    BasicSprite {
        id: pSprite1

        subFolder: "2025_04_24_View_main_SideBullBear_Fontain"
        fileSpriteFirst: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_20_Idx_1.png"
        fileSpriteLast: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_1_Idx_6.png"

        widthPercent: 0.20
        xPercent: 0.05
        yPercent: 0.10

        mIS_DEBUG: true
    }

    BasicSprite {
        id: pSprite2

        subFolder: "2025_04_24_View_main_SideBullBear_Fontain"
        fileSpriteFirst: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_20_Idx_1.png"
        fileSpriteLast: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_1_Idx_6.png"

        heightPercent: 0.10
        xPercent: 0.05
        yPercent: 0.20

        mIS_DEBUG: true
    }

    BasicSprite {
        id: pSprite3

        subFolder: "2025_04_24_View_main_SideBullBear_Fontain"
        fileSpriteFirst: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_20_Idx_1.png"
        fileSpriteLast: "20250425_Jomere_Fontain_XYWH_2548_759_197_765_Frequency_1_FrameCount_1_Idx_6.png"

        width: 250
        height: 75
        x: 250
        y: 300

        mIS_DEBUG: true
    }

    BasicDebugWindow {
        text: "Click to pause"
        widthPercent: 0.200
        heightPercent: 0.10
        yPercent: 0.60
        xPercent: 0.05
        onClicked: {
            mBasicSpriteManager.pause();
        }
    }

    BasicDebugWindow {
        text: "Click to resume"
        widthPercent: 0.200
        heightPercent: 0.10
        yPercent: 0.60
        xPercent: 0.30
        onClicked: {
            mBasicSpriteManager.resume();
        }
    }

    BasicDebugWindow {
        text: "Click to hide"
        widthPercent: 0.200
        heightPercent: 0.10
        yPercent: 0.60
        xPercent: 0.55
        onClicked: {
            mBasicSpriteManager.hide();
        }
    }

    BasicDebugWindow {
        text: "Click to show"
        widthPercent: 0.200
        heightPercent: 0.10
        yPercent: 0.60
        xPercent: 0.80
        onClicked: {
            mBasicSpriteManager.show();
        }
    }



















}
