import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v1"

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
        mBasicChat.createLines();
    }

    Rectangle {
        anchors.fill: parent
        color: "orange"
        opacity: 0.1
    }

    BasicChat {
        id: mBasicChat

        xPercent: 0.05
        yPercent: 0.05

        widthPercent: 0.40
        heightPercent: 0.50

        textFontForceSizePixel: 0.02 * parent.height

        text:"__How is you day?"
            + "__Pff. My boss is a nightmare. He is so old, he forgets everything__He has alzheimer?"
            + "__Yes, and it is not a joke. I am even surprised he can remember his passwords."
            + "__He is such a nationalist also.\nHe is talking about his country all the time.\nI am sure he puts his national colors every where"
            + "__I sympathize my dear"

        Rectangle {
            anchors.fill: parent
            color: "orange"
            opacity: 0.1
        }


    }

}
