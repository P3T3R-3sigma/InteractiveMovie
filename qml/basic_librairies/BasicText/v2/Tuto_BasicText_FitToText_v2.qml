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
        p1.startBumpFullWindow();
        p2.startBumpText();
    }

    property real mPaddingBetweenWindows: 0.05
    property real mTextFontPixelSizePercent: 0.05


    BasicTextFitToText {
        id: p1

        xPercent: 0.05
        yPercent: 0.05

        text: "BasicTextFitToText"
        textFontPixelSizePercent: mTextFontPixelSizePercent

        backgroundColor: "pink"
        textColor: "blue"
        borderWidthPercent: 0.12
        borderColor: "white"

        paddingPercentHeight: 0.2
        paddingPercentWidth: 0.12
    }

    BasicTextFitToText {
        id: p2

        xPercent: 0.05
        yPercent: p1.yPercent + p1.heightPercent + mPaddingBetweenWindows

        text: "BasicTextFitToText"
            + "\n" + "textFontPixelSizePercent= " + textFontPixelSizePercent
            + "\n" + "paddingPercentHeight= " + paddingPercentHeight
            + "\n" + "paddingPercentWidth= " + paddingPercentWidth
        textFontPixelSizePercent: mTextFontPixelSizePercent

        backgroundColor: "pink"
        textColor: "blue"
        borderWidthPercent: 0.01
        borderColor: "white"

        paddingPercentHeight: 0.20
        paddingPercentWidth: 0.12
        textIsAlignToCenter: true
    }










}
