import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_IMAGE_V2

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
    BasicSource {
        id: mBasicSource
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    onWStartChanged: {

        mBasicSource.mIS_DEBUG = true


    }

    Rectangle {
        anchors.fill: parent
        color: "yellow"
        opacity: 0.2
    }

    BasicImageSource {
        id: pBasicImageSource

        sourceSimple: "InteractViewSimple/Assistant_screen.jpg"
        opacity: 0.3
        widthPercent: 0.20
        x: 0
        y: 0
    }

    // BasicImageSource {
    //     id: pBasicImageSourceTer

    //     sourceSimple: "librairies_basic/Angel/Angel_003.jpg"
    //     opacity: 0.3
    //     widthPercent: 0.30
    //     xPercent: 0.30
    //     y: 0
    // }

    // BasicImageSource {
    //     id: pBasicImageSourceBis

    //     sourceSimple: "librairies_basic/Angel/Angel_001.jpg"
    //     opacity: 0.3
    //     widthPercent: 0.20
    //     x: 0
    //     yPercent: 0.50
    // }


}
