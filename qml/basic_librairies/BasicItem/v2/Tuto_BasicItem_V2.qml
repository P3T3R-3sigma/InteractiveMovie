import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v1"
import "../../BasicGlobalFollower/v1"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_ITEM_V2

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
    BasicAnimationFollower {
        id: mBasicAnimationFollower
    }
    BasicTimerManager {
        id: mBasicTimerManager
    }
    BasicItemManager {
        id: mBasicItemManager
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
        mBasicItem.moveResizeRotateFade(lX0_Percent, lY0_Percent, lWidth0_Percent, lHeight0_Percent, 0, 0.1);
        /**
          Move the sprite to the right
          */
        mBasicItem.moveResizeRotateFade(lX0_Percent + 0.3,
                                        lY0_Percent - 0.3,
                                        0.2,
                                        0.1,
                                        360,
                                        1,
                                        mDuration);
        /*
          Wait the animation to be finished to move to the next event
          */
        mBasicGlobalFollower.watchAllToCallEvent(mTHIS_TUTO_BASIC_ITEM_V2, "wSecondMove")
    }

    /*
      Properties
      */
    property int wSecondMove
    property int wThirdMoveMove
    property int mDuration: 500

    onWSecondMoveChanged: {
        mBasicItem.moveResizeRotateFade(0,
                                        0.75,
                                        0.4,
                                        0.4,
                                        0,
                                        0.5,
                                        mDuration, 500);

        /*
          Wait the animation to be finished to move to the next event
          */
        mBasicGlobalFollower.watchAllToCallEvent(mTHIS_TUTO_BASIC_ITEM_V2, "wThirdMoveMove")
    }

    onWThirdMoveMoveChanged: {
        ////////////////////////////////////////////
        // console.log();
        // console.log(mBasicItem.vString());

        mBasicItem.widthPercent = 50 / mBasicItem.parent.width

        // console.log("mTHIS_TUTO_BASIC_ITEM_V2.width= " + mTHIS_TUTO_BASIC_ITEM_V2.width);
        // console.log("mBasicItem.widthPercent= " + mBasicItem.widthPercent);
        // console.log(mBasicItem.vString());
        ////////////////////////////////////////////
    }

    BasicItem {
        id: mBasicItem

        Rectangle {
            anchors.fill: parent
            color: "cyan"
        }
    }

}
