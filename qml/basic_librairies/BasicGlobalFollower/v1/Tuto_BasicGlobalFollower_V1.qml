import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicGlobalFollower/v1"
import "../../BasicReflection/v2"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_GLOBAL_FOLLOWER_V1

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
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicAnimationFollower {
        id: mBasicAnimationFollower
    }
    BasicTimerManager {
        id: mBasicTimerManager
    }
    BasicItemManager {
        id: mBasicItemManager
    }
    BasicReflection {
        id: mBasicReflection
    }

    /////////////////////////////////////////////////////////////
    //      TUTO
    /////////////////////////////////////////////////////////////


    property int wTriggerAll
    property int wTriggerRectangleVerySmall
    property int wTriggerRectangleSmall
    property int wTriggerRectangleBIG
    property int wMoveOn
    property int mDelay: 2000

    onWStartChanged: {
        start();
    }

    Rectangle {
        color: "lightgrey"
        anchors.fill: parent
    }

    Rectangle {
        id: mSampleRectangleForVideo
        width: 300
        height: 220
        anchors.centerIn: parent
    }

    Rectangle {
        id: mSampleRectangleVerySmall
        x: parent.width * 2 / 3 - width / 2
        y: parent.height / 2
        width: 15
        height: 15
        color: "cyan"
    }

    Rectangle {
        id: mSampleRectangleSmall
        width: 30
        height: 30
        x: parent.width / 2 - width / 2
        y: parent.height / 2
        color: "lightgreen"
    }

    Rectangle {
        id: mSampleRectangleBig
        width: 60
        height: 60
        x: parent.width / 3 - width / 2
        y: parent.height / 2
        color: "orange"
    }

    NumberAnimation {
        id: mSampleRotateVerySmall
        target: mSampleRectangleVerySmall
        property: "rotation"
        from: 0
        to: 360
        duration: 10000
        onFinished: {
            console.log("mSampleRotateVerySmall finished");
        }
    }

    NumberAnimation {
        id: mSampleRotateSmall
        target: mSampleRectangleSmall
        property: "rotation"
        from: 0
        to: 360
        duration: 5000
        onFinished: {
            console.log("mSampleRotateSmall finished");
        }
    }

    NumberAnimation {
        id: mSampleRotateBig
        target: mSampleRectangleBig
        property: "rotation"
        from: 0
        to: 360
        duration: 2500
        onFinished: {
            console.log("mSampleRotateBig finished");
        }
    }

    AppText {
        text: "medium and big rectangles in semi-opacity - at anytime, we can go to the end by clicking anywhere"
        + "\n1) (using a BasicVideo) We run the BasicVideo. When the video is finished, we move to the next step"
        + "\n2) (Using BasicTimer) we wait 2 seconds and then we start the animation of the very small rectangle"
        + "\n3) (using BasicTimer), we start rotating the medium and big rectangle after 4, and 6 seconds (we set opacity at 1 when rotating)
        "
        fontSize: 10
        anchors.top: parent.top
    }

    function start() {
        console.log("STARTING");
        /**
          Initiate
          */
        mSampleRectangleSmall.opacity = 0.3
        mSampleRectangleBig.opacity = 0.3
        /**
          Create Video
          */
        // let lBasicVideo = mBasicVideoManager.getmAndCreateBasicVideo(mSampleRectangleForVideo,
        //                                                              "../../assets/videos/Zlata/",
        //                                                              "Zlata_TakeCards_01.mp4",
        //                                                              null,
        //                                                              "Zlata_TakeCards_01.jpg");
        // mBasicVideoManager.startAndFollowBasicVideo(lBasicVideo, true, mTHIS_TUTO_BASIC_GLOBAL_FOLLOWER_V1, "wTriggerAll");
        mBasicGlobalFollower.watchAllToCallEvent(mTHIS_TUTO_BASIC_GLOBAL_FOLLOWER_V1, "wMoveOn");
        mBasicGlobalFollower.setmDefaultEndIfClick(true)
    }

    onWTriggerAllChanged: {
        console.log("onWTriggerAllChanged");
        let lBasicVideo = mBasicVideoManager.getmAndCreateBasicVideo(mSampleRectangleForVideo,
                                                                     "../../assets/videos/Vince/",
                                                                     "Vince_TakeCards_01.mp4",
                                                                     null,
                                                                     "Vince_TakeCards_01.jpg");
        mBasicVideoManager.startAndFollowBasicVideo(lBasicVideo, true);
        mBasicTimerManager.launchBasicTimer(mDelay, mSampleRotateVerySmall);
        mBasicTimerManager.launchBasicTimer(2 * mDelay, mTHIS_TUTO_BASIC_GLOBAL_FOLLOWER_V1, "wTriggerRectangleSmall");
        mBasicTimerManager.launchBasicTimer(3 * mDelay, mTHIS_TUTO_BASIC_GLOBAL_FOLLOWER_V1, "wTriggerRectangleBIG");
    }

    onWTriggerRectangleSmallChanged: {
        console.log("onWTriggerRectangleSmallChanged= " + wTriggerRectangleSmall);
        mSampleRectangleSmall.opacity = 1
        mBasicAnimationFollower.startAndFollow(mSampleRotateSmall);
    }

    onWTriggerRectangleBIGChanged: {
        console.log("onWTriggerRectangleBIGChanged= " + wTriggerRectangleBIG);
        mSampleRectangleBig.opacity = 1
        mBasicAnimationFollower.startAndFollow(mSampleRotateBig);
    }

    onWMoveOnChanged: {
        console.log("onWMoveOnChanged= " + wMoveOn)
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons
        onClicked: (mouse) => {
                       if (mouse.button === Qt.LeftButton) {
                            mBasicGlobalFollower.completeAll();
                       } else if (mouse.button === Qt.RightButton) {
                            start();
                       }


        }
    }

}
