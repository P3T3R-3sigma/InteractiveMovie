import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicItem/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImage/v3"
import "../../BasicImageSource/v4"
import "../../BasicImageHover/v1"
import "../../BasicImageMulti/v1"
import "../../BasicLoader/v1"
import "../../BasicVideo/v1"
import "../../BasicText/v4"
import "../../BasicSprites/v3"
import "../../BasicReflection/v3"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_LOADER_V1

    /////////////////////////////////////////////////////////////
    //      OTHER LIBRAIRIES NEEDED
    /////////////////////////////////////////////////////////////

    BasicConst {
        id: mBasicConst
    }

    BasicList {
        id: mBasicList
    }
    BasicNum {
        id: mBasicNum
    }
    BasicDisplay {
        id: mBasicDisplay
    }
    BasicSource {
        id: mBasicSource
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicLoaderManager {
        id: mBasicLoaderManager
    }
    BasicVideoConstants {
        id: cBasicVideo
    }
    BasicSpriteManager {
        id: mBasicSpriteManager
    }
    BasicReflection {
        id: mBasicReflection
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    mDURATION: 0


    BasicImageSource {
        id: p00

        visible: false
        property int mIdx: 00
        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1

        sourceSimple: "BasicSubWindow/IViewSimpleCupboardRightNoDrill.jpg"
    }

    BasicImage {
        id: p01

        visible: false
        property int mIdx: 01
        widthPercent: 0.15
        heightPercent: 0.20
        xPercent: mIdx * widthPercent * 1.1

        sourceSimple: "BasicSubWindow/IViewSimpleCupboardRight.jpg"
    }

    BasicImageHover {
        id: p02

        visible: false
        property int mIdx: 02
        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1

        sourceSimpleMain: "Angel/Angel_001.jpg"
        sourceSimpleHover: "Angel/Angel_002.jpg"
    }

    BasicImageMulti {
        id: p03

        visible: false
        property int mIdx: 03
        widthPercent: 0.15
        heightPercent: 0.20
        xPercent: mIdx * widthPercent * 1.1

        mArraySourcesSimple: ["Angel/Angel_001.jpg", "Angel/Angel_002.jpg", "Angel/Angel_003.jpg"]
    }

    BasicAnimatedSprite {
        id: pThisBasicAnimatedSprite

        visible: false

        subFolder: "TV_Mugur"
        fileSprite: "20250510_View_main_Doors_TV_XYWH_0_0_256_256_Frequency_1_FrameCount_64_Idx_2.png"

        property int mIdx: 04
        widthPercent: 0.15
        heightPercent: 0.20
        xPercent: mIdx * widthPercent * 1.1
        yPercent: (1 - heightPercent) / 2

        frameWidth: 147
        frameHeight: 145

        frameRate: 10
        frameCount: 90

        mIS_DEBUG: true

        mIsReverseWhenFinished: true

        interpolate: true

        property string mNAMESPRITE: "NAME SPRITE"

    }

    BasicSprite {
        id: pThisBasicSprite

        visible: false

        subFolder: "JomereFan"
        fileSpriteFirst: "20250425_JomereFan_XYWH_50_714_585_606_Frequency_1_FrameCount_9_Idx_1.png"
        fileSpriteLast: "20250425_JomereFan_XYWH_50_714_585_606_Frequency_1_FrameCount_2_Idx_12.png"

        mIS_DEBUG: true

        width: 256
        height: 256

         property int mIdx: 05
        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1
        yPercent: (1 - heightPercent) / 2

    }

    /*
      Display button
      */
    AppButton {
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: parent.width * 0.45
        y: parent.height - height * 1.5
        text: "Console"
        onClicked: {
            console.log("------ To console ----------")
            mBasicLoaderManager.toConsole();
            console.log("----------------------------")
        }
    }

    /*
      Download button
      */
    AppButton {
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: width * 0.70
        y: parent.height - height * 1.5
        text: "Download sources"
        onClicked: {
            console.log("------- launch loader -----------")
            /*
              Set sources
              */

            /*
              Start loaded
              */
            mBasicLoaderManager.startCheck(mTHIS_TUTO_BASIC_LOADER_V1, "loadedSuccess");

            // mBasicLoader.startCheck(p03, mTHIS_TUTO_BASIC_LOADER_V1, "loadedSuccessP03");
            // p04.sourceSimple = "Videos_photos/sex_Blacky/0N0A1636.JPG"
            // mBasicLoader.startCheck(p04, mTHIS_TUTO_BASIC_LOADER_V1, "loadedSuccessP04");
        }
    }


    function loadedSuccess() {
        console.log("Loaded successfully all images")
        p00.visible = true
        p01.visible = true
        p02.visible = true
        p03.visible = true
        pThisBasicAnimatedSprite.visible = true
        pThisBasicSprite.visible = true
        /*
          Communication
          */
        mBasicLoaderManager.toConsole();
    }


    function getmListItemToCheckIfLoaded() {
        return [p00, p01, p02, p03, pThisBasicAnimatedSprite, pThisBasicSprite];
    }























}
