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
    BasicImageSourceManager {
        id: mBasicImageSourceManager
    }
    BasicSpriteManager {
        id: mBasicSpriteManager

        mSubFolder: "Sprites"
        mIS_DEBUG: true
    }
    BasicSource {
        id: mBasicSource
    }



    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////

    onWStartChanged: {

    }

    BasicAnimatedSprite {
        id: pThisBasicAnimatedSprite

        subFolder: "TV_Mugur"
        fileSprite: "20250510_View_main_Doors_TV_Frequency_1_FrameCount_64_Idx_1.png"

        xPercent: 0.50
        yPercent: 0.50

        frameWidth: 256
        frameHeight: 256

        mFrameRate: 15
        frameCount: 64

        mIS_DEBUG: true

        mIsReverseWhenFinished: true

        interpolate: true

    }


    BasicSprite {
      subFolder: "TV_Mugur"
      fileSpriteFirst: "20250510_View_main_Doors_TV_XYWH_0_0_256_256_Frequency_1_FrameCount_64_Idx_1.png"
      fileSpriteLast: "20250510_View_main_Doors_TV_XYWH_0_0_256_256_Frequency_1_FrameCount_64_Idx_2.png"
      mIS_DEBUG: true
      mFrameRate: 18
      width: 256
      height: 256
    }

}
