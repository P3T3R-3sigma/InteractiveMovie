import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v4"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_IMAGE_V1

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
        mMODE_SOURCE: "HotReload"
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    mDURATION: 0

    BasicImageSourceHover {

        sourceSimple: "Angel_002.jpg"

        mSourceHover: "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"

        heightPercent: 0.50

        onClicked: {
            console.log("CLicked")
        }
        onEntered: {
            console.log("Entered")
        }
        onExited: {
            console.log("Exited")
        }

    }

}
