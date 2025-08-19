import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImage/v3"
import "../../BasicImageSource/v4"
import "../../BasicLoader/v1"

SceneAbstract {

    id: mTHIS_TUTO_BASICIMAGEMULTI_V1

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
    BasicSource {
        id: mBasicSource
        mMODE_SOURCE: "WebAssembly"
    }
    BasicLoaderManager {
        id: mBasicLoaderManager
    }



    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    onWStartChanged: {
        mBasicLoaderManager.startCheck(pImageMulti, "whenLoaded", mTHIS_TUTO_BASICIMAGEMULTI_V1)
    }

    // BasicImageMulti {
    //     xPercent: 0
    //     widthPercent: 0.3
    //     heightPercent: 0.5
    //     mSubFolderSimple: "librairies_basic/Angel"
    //     mArraySourcesSimple: ["Angel_001.jpg", "Angel_002.jpg", "Angel_003.jpg"]
    // }

    BasicImageMulti {
        id: pImageMulti
        visible: false
        xPercent: 0.5
        widthPercent: 0.3
        heightPercent: 0.5
        mSubFolderSimple: "Videos_photos/sex_Ada"
        mArraySourcesSimple: ["0N0A1836.JPG", "0N0A1859.JPG", "0N0A1891.JPG", "0N0A1911.JPG", "0N0A1915.JPG"]
    }

    function whenLoaded() {
        pImageMulti.visible = true
    }

}
