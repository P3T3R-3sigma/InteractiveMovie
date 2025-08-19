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
    }
    BIScBasicImageSourceConstants {
        id: cBIS
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    onWStartChanged: {
        // mBasicImageSourceManager.displayBasicImageSourceManager();
        pBasicImage.moveResizeRotateFade(0.4, 0.2, null, 0.5, 360, 1, 5000);
    }

    visible: false
    anchors.fill: parent


    Rectangle {
        anchors.fill: parent
        color: "yellow"
        opacity: 0.2

    }

    BasicImage {
        id: pBasicImage

        heightPercent: 0.2
        widthPercent: 0.1
        sourceSimple: "librairies_basic/Angel/Angel_002.jpg"
        radiusPct: 0.2
        borderWidthPct: 0.05
        borderColor: "cyan"
        opacity: 0.05
        backgroundColor: "orange"

        fillMode: Image.PreserveAspectFit
    }

    BasicImage {
        id: pBasicImageTer

        widthPercent: 0.1
        xPercent: 0.3
        yPercent: 0.3
        sourceSimple: "librairies_basic/Angel/Angel_002.jpg"
        borderWidthPct: 0.01
        borderColor: "cyan"
        radiusPct: 0
        opacity: 0.5
    }


    BasicImage {
        id: pBasicImageBis

        heightPercent: 0.5
        xPercent: 1 - widthPercent
        sourceSimple: "librairies_basic/Angel/Angel_002.jpg"
        radiusPct: 0.1
        borderWidthPct: 0.01
        borderColor: "magenta"
    }


}
