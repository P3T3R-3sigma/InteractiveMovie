import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicLoader/v1"

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
    BasicSource {
        id: mBasicSource
    }
    BasicLoaderManager {
        id: mBasicLoaderManager

        mIS_DEBUG: true
    }


    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    mDURATION: 0


    BasicImageSource {
        id: pBasicImageSource

        sourceSimple: "librairies_basic/Angel/Angel_002.jpg"
        opacity: 0.3
        widthPercent: 0.20
        x: 0
        y: 0
    }

    BasicImageSource {
        id: pBasicImageSourceTer

        sourceSimple: "librairies_basic/Angel/Angel_003.jpg"
        opacity: 0.3
        widthPercent: 0.30
        xPercent: 0.30
        y: 0
    }

    BasicImageSource {
        id: pBasicImageSourceBis

        sourceSimple: "librairies_basic/Angel/Angel_001.jpg"
        opacity: 0.3
        widthPercent: 0.20
        x: 0
        yPercent: 0.50
    }

    BasicImageSource {
        id: pBasicImageSourceHover

        sourceSimple: "librairies_basic/Angel/Angel_001.jpg"
        opacity: 1
        heightPercent: 0.30
        xPercent: 0.65
        y: 0.05

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                pBasicImageSourceHover.sourceSimple = "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"
            }
            onExited: {
                pBasicImageSourceHover.sourceSimple = "librairies_basic/Angel/Angel_001.jpg"
            }
        }

        onWidthChanged: {
            "new width= " + width
        }
        onHeightChanged: {
            "new height= " + height
        }
    }

    AppButton {
        width: parent.width * 0.30
        height: parent.height * 0.10
        x: (parent.width - width) / 2
        y: parent.height - height
        text: "click to switch middle image"
        onClicked: {
            if (pBasicImageSourceTer.sourceSimple.endsWith("003.jpg")) {
                pBasicImageSourceTer.sourceSimple = "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"
            } else {
                pBasicImageSourceTer.sourceSimple = "librairies_basic/Angel/Angel_003.jpg"
            }
        }
    }














}
