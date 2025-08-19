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
        mThisResize.start()
    }

    property real mZOOM: 0.40
    property int mDURATION: 5000

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    Rectangle {
        anchors.fill: parent
        color: "cyan"
        z: -1
        opacity: 0.2
    }


    ParallelAnimation {
        id: mThisResize

        NumberAnimation {
            target: mThisSampleScene
            property: "height"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.height
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.height * mZOOM
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: mThisSampleScene
            property: "width"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.width
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.width * mZOOM
            easing.type: Easing.InOutQuad
        }

        onFinished: {
            mThisResizeIncreaseBack.start()
        }
    }

    ParallelAnimation {
        id: mThisResizeIncreaseBack

        NumberAnimation {
            target: mThisSampleScene
            property: "height"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.height * mZOOM
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.height
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: mThisSampleScene
            property: "width"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.width * mZOOM
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.width
            easing.type: Easing.InOutQuad
        }
    }


    BasicTextFitToWindow {
        yPercent: 0.10
        widthPercent: 0.20
        heightPercent: 0.20
        text: "BasicTextFitToWindow"
        backgroundColor: "lightyellow"
        textColor: "black"
        textIsAlignToCenterH: true
        paddingPercentHeight: 0.12
        paddingPercentWidth: 0.07
        borderColor: "pink"
        borderWidthPercent: 0.02
    }


    BasicTextFitToWindowWidth {
        yPercent: 0.40
        widthPercent: 0.20
        text: "BasicTextFitToWindowWidth\nHeight will adapte by being responsive"
        backgroundColor: "lightyellow"
        textColor: "black"
        textIsAlignToCenterH: true
        paddingPercentHeight: 0.12
        paddingPercentWidth: 0.07
        borderColor: "pink"
        borderWidthPercent: 0.02
        textIsWrapped: true
    }

    BasicTextFitToWindowHeight {
        yPercent: 0.10
        xPercent: 0.40
        heightPercent: 0.10
        text: "BasicTextFitToWindowHeight: Width will adapte by being responsive"
        backgroundColor: "lightyellow"
        textColor: "black"
        textIsAlignToCenterH: true
        paddingPercentHeight: 0.12
        paddingPercentWidth: 0.07
        borderColor: "pink"
        borderWidthPercent: 0.02
        textIsWrapped: true
    }
}
