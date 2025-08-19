import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"

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
    BasicImageSourceManager {
        id: mBasicImageSourceManager
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    onWStartChanged: {
        mBasicImageSourceManager.displayBasicImageSourceManager();
    }

    Rectangle {
        anchors.fill: parent
        color: "yellow"
        opacity: 0.2
    }

    BasicImageSource {
        id: pBasicImageSource

        sourceSimple: "librairies_basic/Angel/Angel_002.jpg"
        opacity: 0.3
    }

    BasicImageSource {
        id: pBasicImageSourceTer

        sourceSimple: "librairies_basic/Angel/Angel_003.jpg"
        opacity: 0.3
    }

    BasicImageSource {
        id: pBasicImageSourceBis

        sourceSimple: "librairies_basic/Angel/Angel_001.jpg"
        opacity: 0.3
    }


}
