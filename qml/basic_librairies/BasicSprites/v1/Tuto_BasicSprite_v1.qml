import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v1"
import "../../BasicDebug/v1"
import "../../../../assets"

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




    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////

    onWStartChanged: {

    }


    BasicSpriteManager {
        id: mBasicSpriteManager

        mSubFolder: "Sprites"
        mIS_DEBUG: true
    }

    BasicSprite {

        sourceSimple: "20250424_JomereTickers_XYWH_1181_507_1169_105_SpriteSheet_FrameCount_36_Frequency_25.png"

        widthPercent: 0.40
        xPercent: 0.05
        yPercent: 0.10

        mIS_DEBUG: true
    }

    BasicSprite {

        sourceSimple: "20250424_JomereTickers_XYWH_1181_507_1169_105_SpriteSheet_FrameCount_36_Frequency_25.png"

        heightPercent: 0.10
        xPercent: 0.05
        yPercent: 0.20

        mIS_DEBUG: true
    }

    BasicSprite {

        sourceSimple: "20250424_JomereTickers_XYWH_1181_507_1169_105_SpriteSheet_FrameCount_36_Frequency_25.png"

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
