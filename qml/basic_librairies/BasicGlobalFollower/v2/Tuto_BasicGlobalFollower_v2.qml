import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicGlobalFollower/v2"
import "../../BasicReflection/v2"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_GLOBAL_FOLLOWER_V2

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



    AppButton {
        text: "Click to start"
        + "\n" + "medium and big rectangles in semi-opacity - at anytime, we can go to the end by pressing the key ESC"
        + "\n" + "3 timers are called at start, to rotate the small, medium and large rectangle in 2s, 4s and 6s"
        + "\n" + "when all animations are finished, we wait 2 seconds"
        + "\n" + "an event full opacity is registered to be called when all timers and all animations are finished"
        onClicked: {
            mBasicGlobalFollower.startAndFollowBasicTimer(mTimer1)
            mBasicGlobalFollower.startAndFollowBasicTimer(mTimer2)
            mBasicGlobalFollower.startAndFollowBasicTimer(mTimer3)
            mBasicGlobalFollower.watchAllToCallEvent(mTHIS_TUTO_BASIC_GLOBAL_FOLLOWER_V2, "wOpacityToOne")
        }
    }

    property int wOpacityToOne

    onWStartChanged: {

    }

    Rectangle {
        color: "lightgrey"
        anchors.fill: parent
        z: -1
    }

    Rectangle {
        id: mSampleRectangleVerySmall
        x: parent.width * 2 / 3 - width / 2
        y: parent.height / 2
        width: 30
        height: 30
        color: "cyan"
        opacity: 0.3
    }

    Rectangle {
        id: mSampleRectangleSmall
        width: 60
        height: 60
        x: parent.width / 2 - width / 2
        y: parent.height / 2
        color: "green"
        opacity: 0.3
    }

    Rectangle {
        id: mSampleRectangleBig
        width: 120
        height: 120
        x: parent.width / 3 - width / 2
        y: parent.height / 2
        color: "orange"
        opacity: 0.3
    }

    NumberAnimation {
        id: mRotateVerySmall

        target: mSampleRectangleVerySmall
        property: "rotation"
        from: 0
        to: 360
        duration: 2000
        onFinished: {
            mBasicGlobalFollower.startAndFollowBasicTimer(mTimer2)
            console.log("mRotateVerySmall finished");

        }
        onStarted: {
            console.log("mRotateVerySmall started");
        }
    }

    NumberAnimation {
        id: mRotateSmall

        target: mSampleRectangleSmall
        property: "rotation"
        from: 0
        to: 360
        duration: 2000
        onFinished: {
            mBasicGlobalFollower.startAndFollowBasicTimer(mTimer3)
            console.log("mRotateSmall finished");

        }
        onStarted: {
            console.log("mRotateSmall started");
        }
    }

    NumberAnimation {
        id: mRotateBig

        target: mSampleRectangleBig
        property: "rotation"
        from: 0
        to: 360
        duration: 2000
        onFinished: {
            console.log("mRotateBig finished");
            mBasicGlobalFollower.startAndFollowBasicTimer(mTimer4)
        }
        onStarted: {
            console.log("mRotateBig started");
        }
    }

    BasicTimer {
        id: mTimer1

        interval: 2000
        onTriggered: {
            mBasicGlobalFollower.startAndFollowAnimation(mRotateVerySmall);
        }
    }

    BasicTimer {
        id: mTimer2

        interval: 6000
        onTriggered: {
            mBasicGlobalFollower.startAndFollowAnimation(mRotateSmall);
        }
    }

    BasicTimer {
        id: mTimer3

        interval: 10000
        onTriggered: {
            mBasicGlobalFollower.startAndFollowAnimation(mRotateBig);
        }
    }

    BasicTimer {
        id: mTimer4

        interval: 2000
    }

    onWOpacityToOneChanged: {
        mSampleRectangleVerySmall.opacity = 1
        mSampleRectangleSmall.opacity = 1
        mSampleRectangleBig.opacity = 1
    }

}

