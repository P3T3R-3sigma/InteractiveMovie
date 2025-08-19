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

    }

    BasicLockNumbers {
        id: pThisLockBoss

        width: parent.width * 0.50
        height: parent.height * 0.50
        x: 50
        y: 50

        mRatioHeightOnWidth: 0.5

        mArraySolution: [1, 1, 1, 1, 1, 1]

        mPaddingPercent: 0.10
        mBorderWidthPercent: 0.002

        mColorCommBackground: Qt.color("transparent")
        mColorCommBorder: Qt.color("transparent")
        mCommPaddingPercentHeight: 0.10
        mCommPaddingPercentWidth: 0.10

        mColorBackground: Qt.color("#2D354A")
        mColorBorder: Qt.color("#7B9ED6")
        mColorText: Qt.color("white")

        // onThisFocusChanged: {
        //     parent.deFocus()
        //     if (focus) {
        //         pTitleHead.textColor = Qt.color("white")
        //     }
        // }

        // onSuccess: {
        //     enabled = false
        //     setColorText(Qt.color("lightgreen"))
        // }

        // function setColorText(sColor) {
        //     pThisLockBoss.mColorText = sColor
        //     pGrantedBoss.textColor = sColor
        //     pTitleHead.textColor = sColor
        // }

        // function resetColor() {
        //     enabled = true
        //     setColorText(Qt.color("grey"))
        //     focus = true
        // }
    }

}
