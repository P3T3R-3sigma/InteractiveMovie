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

    }


    BasicTextFitToWindow {
        width: 150
        height: 200
        x: 50
        y: 50
        backgroundColor: "lightyellow"
        textColor: "black"
        radiusPctHeight: 0

        text: "BasicTextFitToWindow"
            + "\nTesting the position of the text"
            + "\nverticalAlignment= " + toAlignementToText(shadow_getmAppText().verticalAlignment)
            + "\ntextIsWrapped= " + shadow_getmAppText().wrapMode

    }

    BasicTextFitToWindow {
        width: 150
        height: 200
        x: 50
        y: 300
        backgroundColor: "lightyellow"
        textColor: "black"
        radiusPctHeight: 0

        text: "BasicTextFitToWindow"
            + "\nTesting the position of the text"
            + "\nverticalAlignment= " + toAlignementToText(shadow_getmAppText().verticalAlignment)
            + "\ntextIsWrapped= " + shadow_getmAppText().wrapMode

        textIsAlignToBottom: true
    }

    BasicTextFitToWindowWidth {
        width: 150
        height: 200
        x: 250
        y: 50
        backgroundColor: "lightyellow"
        textColor: "black"
        radiusPctHeight: 0

        text: "BasicTextFitToWindow"
            + "\nTesting the position of the text"
            + "\nverticalAlignment= " + toAlignementToText(shadow_getmAppText().verticalAlignment)
            + "\ntextIsWrapped= " + shadow_getmAppText().wrapMode

        textIsWrapped: true

    }

    BasicTextFitToWindowWidth {
        width: 150
        height: 200
        x: 250
        y: 300
        backgroundColor: "lightyellow"
        textColor: "black"
        radiusPctHeight: 0

        text: "BasicTextFitToWindow"
            + "\nTesting the position of the text"
            + "\nverticalAlignment= " + toAlignementToText(shadow_getmAppText().verticalAlignment)
            + "\ntextIsWrapped= " + shadow_getmAppText().wrapMode

        textIsAlignToBottom: true
        textIsWrapped: true
    }

    BasicTextFitToWindow {
        width: 150
        height: 200
        x: 450
        y: 50
        backgroundColor: "lightyellow"
        textColor: "black"
        radiusPctHeight: 0

        text: "BasicTextFitToWindow"
            + "\nTesting the position of the text"
            + "\nverticalAlignment= " + toAlignementToText(shadow_getmAppText().verticalAlignment)
            + "\ntextIsWrapped= " + shadow_getmAppText().wrapMode

        textIsWrapped: true
    }

    BasicTextFitToWindow {
        width: 150
        height: 200
        x: 450
        y: 300
        backgroundColor: "lightyellow"
        textColor: "black"
        radiusPctHeight: 0

        text: "BasicTextFitToWindow"
            + "\nTesting the position of the text"
            + "\nverticalAlignment= " + toAlignementToText(shadow_getmAppText().verticalAlignment)
            + "\ntextIsWrapped= " + shadow_getmAppText().wrapMode

        textIsAlignToBottom: true
        textIsWrapped: true
    }


    function toAlignementToText(sAlignement) {
        if (sAlignement == Text.AlignBottom) {
            return "AlignBottom"
        }
        if (sAlignement == Text.AlignVCenter) {
            return "AlignVCenter"
        }
        if (sAlignement == Text.AlignTop) {
            return "AlignTop"
        }
        return "Undefined"
    }

}
