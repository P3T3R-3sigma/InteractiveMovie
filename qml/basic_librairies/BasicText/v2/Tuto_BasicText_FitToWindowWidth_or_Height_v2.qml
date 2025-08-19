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
        console.log("r1.heightPercent= " + (r1.height/height));
        console.log("r1.yPercent= " + (r1.y / height));
        console.log("r3.heightPercent= " + (r3.height/height));
        console.log("r3.yPercent= " + (r3.y / height));
    }

    property real mPaddingBetweenWindows: 0.025
    property real mTextFontPixelSizePercent: 0.02

    BasicTextFitToWindowHeight {
        id: r1

        text: "BasicTextFitToWindowHeight\n\nFIXED heightPercent (total window)=" + heightPercent
              + "\n\nFontPixelSizePercent= " + mTextFontPixelSizePercent
              + "; wrapMode= " + textIsWrapped + "; padding=0"
             + "\nWidth of the window adapts"

        xPercent: 0.05
        yPercent: mPaddingBetweenWindows
        heightPercent: 0.4       //  We fix the window width

        backgroundColor: "cyan"
        textColor: "black"
        borderWidthPercent: 0.05
        borderColor: "white"

        textFontPixelSizePercent: mTextFontPixelSizePercent
        paddingPercentHeight: 0.10
        paddingPercentWidth: 0.10
        textIsWrapped: true
        textIsAlignToCenter: true
    }

    Rectangle {
        id: pRect1

        visible: false
        x: r1.x
        y: r1.y
        opacity: 0.4
        color: "yellow"
        width: r1.width
        height: r1.heightPercent * parent.height
    }

    BasicTextFitToWindowHeight {
        id: r2

        text: "BasicTextFitToWindowHeight\nsame as left but with smaller text"
             + "\nWidth of the window adapts"

        xPercent: r1.xPercent + r1.widthPercent + mPaddingBetweenWindows
        yPercent: r1.yPercent
        heightPercent: 0.4       //  We fix the window width

        backgroundColor: "cyan"
        textColor: "black"
        borderWidthPercent: 0.05
        borderColor: "white"

        textFontPixelSizePercent: mTextFontPixelSizePercent
        paddingPercentHeight: 0.10
        paddingPercentWidth: 0.10
        textIsWrapped: true
        textIsAlignToCenter: true
    }

    BasicTextFitToWindowWidth {
        id: r3

        text: "BasicTextFitToWindowWidth\n\nFIXED widthPercent= " + widthPercent
              + "\n\nFontPixelSize= " + mTextFontPixelSizePercent
              + "; Text align to the top; wrapMode= " + textIsWrapped
                + "\nWidth & Font are Fixed; Height is responsive and adapts"
        xPercent: 0.05
        yPercent: r1.yPercent + r1.heightPercent + mPaddingBetweenWindows
        widthPercent: 0.4

        backgroundColor: "orange"
        textColor: "black"

        borderColor: "yellow"
        borderWidthPercent: 0.02

        textIsAlignToCenter: true
        textIsAlignToTop: true

        textFontPixelSizePercent: mTextFontPixelSizePercent
        paddingPercentHeight: 0.10
        paddingPercentWidth: 0.05

        textIsWrapped: true
    }

    BasicTextFitToWindowWidth {
        id: r4

        text: "BasicTextFitToWindowWidth\nFIXED widthPercent= " + widthPercent
              + "\nFontPixelSize= " + mTextFontPixelSizePercent
              + "; Text align to the top; wrapMode= " + textIsWrapped
                + "\nWidth & Font are Fixed; Height is responsive and adapts"
        xPercent: 0.05
        yPercent: r3.yPercent + r3.heightPercent + mPaddingBetweenWindows
        widthPercent: 0.4

        backgroundColor: "orange"
        textColor: "black"

        borderColor: "yellow"
        borderWidthPercent: 0.02

        textIsAlignToCenter: true
        textIsAlignToTop: true

        textFontPixelSizePercent: mTextFontPixelSizePercent
        paddingPercentHeight: r3.paddingPercentHeight
        paddingPercentWidth: r3.paddingPercentWidth

        textIsWrapped: true
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            pRect1.visible = true
            r2.text = "BasicTextFitWidthToText"
            + "\nJ'adapte la largeur"
            r4.text = "BasicTextFitToWindowWidth"
                    + "\nJ'adpate la hauteur"
        }
    }

}
