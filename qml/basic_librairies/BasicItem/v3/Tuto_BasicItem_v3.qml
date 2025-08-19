import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_ITEM_V3

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
        /**
          Initiate
          */
        let lX0_Percent = 0.5
        let lY0_Percent = 0.5
        let lWidth0_Percent = 0.1
        let lHeight0_Percent = 0.1;
        /**
          Communication
          */
        console.log(mBasicItem.vString());
        /*
          Initiate the position
          */
        mBasicItem.moveResizeRotateFade(lX0_Percent,
                                        lY0_Percent,
                                        lWidth0_Percent,
                                        lHeight0_Percent,
                                        0,
                                        0.1);
        /**
          Communication
          */console.log();
        console.log("after Placement");
        console.log(mBasicItem.vString());
        /**
          Move the rectangle to the right
          */
        mBasicItem.moveResizeRotateFade(lX0_Percent + 0.3,
                                        lY0_Percent - 0.3,
                                        lWidth0_Percent * 2,
                                        lHeight0_Percent,
                                        360,
                                        1,
                                        mDuration,
                                        mDuration);
        /*
          Wait the animation to be finished to move to the next event
          */
        mBasicGlobalFollower.watchAllToCallEvent(mTHIS_TUTO_BASIC_ITEM_V3, "wSecondMove")
    }

    /*
      Properties
      */
    property int wSecondMove
    property int wThirdMoveMove
    property int mDuration: 2000

    onWSecondMoveChanged: {
        /*
          Communication
          */
        console.log();
        console.log("before 2nd Move");
        console.log(mBasicItem.vString());
        /*
          Instruction for second move
          */
        mBasicItem.moveResizeRotateFade(0,
                                        0.6,
                                        0.4,
                                        0.4,
                                        0,
                                        0.5,
                                        mDuration,
                                        mDuration);
        /*
          Communication
          */
        console.log();
        console.log("after instruction 2nd Move");
        console.log("wThirdMoveMove= " + wThirdMoveMove);
        console.log(mBasicItem.vString());
        /*
          Wait the animation to be finished to move to the next event
          */
        mBasicGlobalFollower.watchAllToCallEvent(mTHIS_TUTO_BASIC_ITEM_V3, "wThirdMoveMove")
    }

    onWThirdMoveMoveChanged: {
        /*
          Communication
          */
        console.log();
        console.log("after 3rd Move");
        console.log("wThirdMoveMove= " + wThirdMoveMove);
        console.log(mBasicItem.vString());
        /*
          Reduce the size
          */
        let lParent = mBasicItem.parent
        mBasicItem.widthPercent = 50 / lParent.width
    }

    BasicItem {
        id: mBasicItem

        Rectangle {
            anchors.fill: parent
            color: "cyan"
        }
    }

}
