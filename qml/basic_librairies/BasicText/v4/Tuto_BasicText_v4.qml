import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v4"
import "../../BasicDebug/v1"

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
        createDynamicallyBasicTextFitToWindow();
    }



    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    Rectangle {
        anchors.fill: parent
        color: "cyan"
        z: -1
        opacity: 0.2
    }

    /*
      BasicTextFitToWindow
      */
    BasicTextFitToWindow {
        xPercent: 0
        yPercent: 0.10
        heightPercent: 0.20
        widthPercent: 0.20
        text: "BasicTextFitToWindow"
        backgroundColor: "lightyellow"
        textColor: "black"
        textIsAlignToCenterH: true
        paddingPercentHeight: 0.02
        paddingPercentWidth: 0.02
        borderColor: "pink"
        borderWidthPercent: 0.01
    }

    /*
      BasicTextFitToWindowWidth
      We impose the width of the window, the height will adjust automatically,
      respecting the specs of the padding and the border
      */
    BasicTextFitToWindowWidth {
        yPercent: 0.35
        widthPercent: 0.20
        text: "BasicTextFitToWindowWidth\nWe impose the width of the window, the height will adjust automatically, respecting the specs of the padding and the border"
        backgroundColor: "lightyellow"
        textColor: "black"
        textIsAlignToCenterH: true
        paddingPercentHeight: 0.02
        paddingPercentWidth: 0.02
        borderColor: "pink"
        borderWidthPercent: 0.02
        textFontPixelSizePercent: 0.02
        textIsWrapped: true
    }

    /*
      BasicTextFitToWindowWidth
      We impose the height of the window, the width will adjust automatically,
      respecting the specs of the padding and the border
      */
    BasicTextFitToWindowHeight {
        xPercent: 0.30
        yPercent: 0.10
        heightPercent: 0.20
        text: "BasicTextFitToWindowWidth\nWe impose the height of the window, the width will adjust automatically, respecting the specs of the padding and the border"
        backgroundColor: "lightyellow"
        textColor: "black"
        textIsAlignToCenter: true
        paddingPercentHeight: 0.02
        paddingPercentWidth: 0.02
        borderColor: "pink"
        borderWidthPercent: 0.02
        textFontPixelSizePercent: 0.02
    }

    /**
      BasicTextFitToText
      We impose the size of the font\nThe Window will adapt to the text
      respecting the border and the padding\nNo wrapMode allowed
      */
    BasicTextFitToText {
        xPercent: 0.30
        yPercent: 0.77
        text: "BasicTextFitToText\nWe impose the size of the font\nThe Window will adapt to the text\nrespecting the border and the padding\nNo wrapMode allowed"
        backgroundColor: "lightyellow"
        textColor: "black"
        textIsAlignToCenter: true
        paddingPercentHeight: 0.02
        paddingPercentWidth: 0.02
        borderColor: "pink"
        borderWidthPercent: 0.02
        textFontPixelSizePercent: 0.02
    }

    /*
      Dynamic creation of BasicTextFitToWindow
      */
    property var mListBasicTextFitToWindow

    Component {
        id: pThisComponentBasicTextFitToWindow
        BasicTextFitToWindow {
            onVisibleAndReady: {
                console.log("Visible and ready for " + vStringBasic())
            }
        }
    }

    function createDynamicallyBasicTextFitToWindow() {
        mListBasicTextFitToWindow = [];
        let lComponent = pThisComponentBasicTextFitToWindow
        let lYPercent = 0.35
        for (let lIdx = 0; lIdx < 3; lIdx++) {
            /*
              Create window
              */
            let lBasicTextFitToWindow = lComponent.createObject(mThisSampleScene);
            mListBasicTextFitToWindow.push(lBasicTextFitToWindow)
            /*

              */
            lBasicTextFitToWindow.mName = ("pIdx= " + lIdx)
            lBasicTextFitToWindow.yPercent = lYPercent
            lBasicTextFitToWindow.xPercent = 0.02
            lBasicTextFitToWindow.heightPercent = 0.10
            lBasicTextFitToWindow.widthPercent = 0.25
            lBasicTextFitToWindow.paddingPercentHeight = 0.01
            lBasicTextFitToWindow.paddingPercentWidth = 0.02
            lBasicTextFitToWindow.borderColor = "pink"
            lBasicTextFitToWindow.backgroundColor = "lightyellow"
            lBasicTextFitToWindow.textColor = "black"
            lBasicTextFitToWindow.borderWidthPercent = 0.01
            /*
              Com
              */
            console.log(lBasicTextFitToWindow.vStringBasic())
            /*
              Move on
              */
            lYPercent += lBasicTextFitToWindow.heightPercent * 1.2
        }
    }


    BasicDebugWindow {
        widthPercent: 0.20
        heightPercent: 0.10
        xPercent: 0.02
        yPercent: 0.70
        paddingPercentHeight: 0
        text: "change font color to\nGREEN"
        property bool mIsGreen
        onClicked: {
            if (mIsGreen) {
                text = "change font color to\nGREEN"
                changeColor(Qt.color("black"))
                mIsGreen = false
            } else {
                text = "change font color to\nBLACK"
                changeColor(Qt.color("green"))
                mIsGreen = true
            }
        }
    }

    /**
      */
    function changeColor(sToColor) {
        for (let lIdx = 0; lIdx < mListBasicTextFitToWindow.length; lIdx++) {
            let lBasicTextFitToWindow = mListBasicTextFitToWindow[lIdx];
            lBasicTextFitToWindow.textColor = sToColor
            lBasicTextFitToWindow.text = "Window dynamically created No " + lIdx
        }
    }

    BasicDebugWindow {

        widthPercent: 0.20
        heightPercent: 0.10
        xPercent: 0.02
        yPercent: 0.82
        paddingPercentHeight: 0
        text: "change background color to\nCYAN"
        property bool mIsGreen
        onClicked: {
            if (mIsGreen) {
                text = "change background color to\nCYAN"
                changeColorBackground(Qt.color("lightgrey"))
                mIsGreen = false
            } else {
                text = "change background color to\nLIGHTGREY"
                changeColorBackground(Qt.color("cyan"))
                mIsGreen = true
            }
        }
        onVisibleAndReady: {
            console.log("Grey Window visible and ready")
        }
    }

    /**
      */
    function changeColorBackground(sToColor) {
        for (let lIdx = 0; lIdx < mListBasicTextFitToWindow.length; lIdx++) {
            let lBasicTextFitToWindow = mListBasicTextFitToWindow[lIdx];
            lBasicTextFitToWindow.backgroundColor = sToColor
            lBasicTextFitToWindow.text = "Window dynamically created No " + lIdx
        }
    }









































}
