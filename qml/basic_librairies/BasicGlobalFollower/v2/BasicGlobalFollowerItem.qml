import QtQuick
import Felgo
import "../../BasicReflection"

Item {

    /**
      Contains
            - the item to follow (Animation, Timer, etc.)
            - the reflection to be called
            - the interface from the item to follow to the necessary functions: running, etc.
      */


    id: mBASIC_GLOBAL_FOLLOWER_ITEM_V2

    property var mItemToFollow
    property bool mIsContinueEvenIfEscape
    property string mType

    /**
      initiate
      */
    function initiate_BasicGlobalFollowerItem(sItemToFollow, sType, sIsContinueEvenIfEscape) {
        mItemToFollow = sItemToFollow;
        mType = sType;
        mIsContinueEvenIfEscape = sIsContinueEvenIfEscape == undefined ? false : mIsContinueEvenIfEscape;
    }

    /**
      */
    function isFinished() {
        switch (mType) {
        case "Animation": return !mItemToFollow.running;
        case "BasicTimer": return !mItemToFollow.running;
        case "Timer": return !mItemToFollow.running;
        default: console.log("Error @ mBASIC_GLOBAL_FOLLOWER_ITEM_V2.isFinished()")
        }
    }

    function start() {
        switch (mType) {
        case "Animation": mItemToFollow.start(); return;
        case "BasicTimer": mItemToFollow.start(); return;
        case "Timer": mItemToFollow.start(); return;
        default: console.log("Error @ mBASIC_GLOBAL_FOLLOWER_ITEM_V2.start()")
        }
    }

    function complete() {
        function start() {
            switch (mType) {
            case "Animation": mItemToFollow.complete(); return;
            case "BasicTimer": mItemToFollow.complete(); return;
            case "Timer": return;
            default: console.log("Error @ mBASIC_GLOBAL_FOLLOWER_ITEM_V2.complete()")
            }
        }
    }

}
