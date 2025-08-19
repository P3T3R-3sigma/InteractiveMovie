import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicGlobalFollower/v2"

SceneAbstract {

    id: mTHIS_TUTO_REFLECTION_V3

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

    /////////////////////////////////////////////////////////////
    //      TUTO
    /////////////////////////////////////////////////////////////


    onWStartChanged: {
        mBasicReflection.mIS_SHOW_COMMUNICATION = true;
    }

    property int mCount;
    property bool mBool

    AppButton {
        id: mSimpleButtonInteger

        width: parent.width * 0.10
        height: parent.height * 0.10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click to add 1 by reflection\nmCount= " + mCount
        onClicked: {
            mBasicReflection.callEvent(mTHIS_TUTO_REFLECTION_V3, "mCount", mSimpleButtonInteger);
        }
    }

    AppButton {
        id: mSimpleButtonBoolean

        width: parent.width * 0.10
        height: parent.height * 0.10
        y: mSimpleButtonInteger.y + mSimpleButtonInteger.height * 1.5
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click to switch boolean\nmBool= " + mBool
        onClicked: {
            let lInstruction = mBool ? "!mBool" : "mBool"
            mBasicReflection.callEvent(mTHIS_TUTO_REFLECTION_V3, lInstruction, mSimpleButtonInteger);
        }
    }

    AppButton {
        id: mAppButtonAnimation

        width: parent.width * 0.10
        height: parent.height * 0.10
        y: mSimpleButtonBoolean.y + mSimpleButtonBoolean.height * 1.5
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click to start the animation (rotation of the square) by reflection"
        onClicked: {
            mBasicReflection.callEvent(null, mParallelAnimation, mTHIS_TUTO_REFLECTION_V3);
        }
    }

    Rectangle {
        id: mRECTANGLE
        width: parent.width * 0.10
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - width * 1.5
    }

    ParallelAnimation {
        id: mParallelAnimation

        NumberAnimation {
            target: mRECTANGLE
            property: "rotation"
            from: 0
            to: 360
            duration: 2000
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: mRECTANGLE
            property: "width"
            from: mRECTANGLE.width
            to: mRECTANGLE.width * 1.5
            duration: 2000
            easing.type: Easing.InOutQuad
        }
    }

    AppButton {
        id: mAppButtonTimer

        width: parent.width * 0.10
        height: parent.height * 0.10
        y: mAppButtonAnimation.y + mAppButtonAnimation.height * 1.5
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click to start the timer by reflection (check the end in console)"
        onClicked: {
            mBasicReflection.callEvent(null, mTIMER, mTHIS_TUTO_REFLECTION_V3);
        }
    }

    BasicTimer {
        id: mTIMER

        interval: 2000
        onTriggered: {
            console.log("Timer finished")
        }
    }
}
