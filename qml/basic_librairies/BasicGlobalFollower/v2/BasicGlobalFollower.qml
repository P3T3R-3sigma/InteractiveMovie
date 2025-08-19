import QtQuick
import Felgo
import "../../Utils/v1"

Item {

    /**
      Start Animation, BasicTimers, and follow their status

      2 advantages
            - follow the Animations and the BasicTimers: inform if some are still running, or if all are finished
            - can watch and call an event when no more items to follow are running

      */

    id: mTHIS_BASIC_GLOBAL_FOLLOWER_V2

    /////////////////////////////////////////////////////////////////////
    //          FUNCTIONS TO CALL BY THE DEVELOPER
    /////////////////////////////////////////////////////////////////////

    /**
      Constants
      */
    property bool mIS_SHOW_COM_BASIC_GLOBAL_FOLLOWER: false
    property var mSUPPORTED_TYPES: ["Animation", "BasicTimer"]
    /**
      Variables
      */
    property var mListBasicGlobalFollowerItem: []
    property var mListEventsToCall: []


    /**
      Register the item to follow --> we can know when it is finished with the method getmIsAtLeastOneRunning()
      */
    function startAndFollowAnimation(sAnimation, sIsContinueEvenIfEscape) {
        startAndFollow(sAnimation, "Animation", sIsContinueEvenIfEscape)
    }
    function startAndFollowBasicTimer(sBasicTimer, sIsContinueEvenIfEscape) {
        startAndFollow(sBasicTimer, "BasicTimer", sIsContinueEvenIfEscape)
    }

    /**
      Call the event once all Animatons, Timers and BasicTimers are completed or stopped
      */
    function watchAllToCallEvent(sContainer, sEventToCall) {
        let lEvent = []
        lEvent.push(sContainer);
        lEvent.push(sEventToCall);
        mListEventsToCall.push(lEvent);
        mTIMER_WATCH_FOR_END.start();
        /*
          Communication
          */
        if (mIS_SHOW_COM_BASIC_GLOBAL_FOLLOWER) {
            console.log("'watchAllToCallEvent' > mListEventsToCall.length= " + mListEventsToCall.length)
        }
    }

    /**
      TRUE if there is at least one itemFollowed which is running, false if none of them are running (empty list or all finished)
      */
    function getmIsAtLeastOneRunning() {
        for (let lIdx = 0; lIdx < mListBasicGlobalFollowerItem.length; lIdx++) {
            let lBasicGlobalFollowerItem = mListBasicGlobalFollowerItem[lIdx];
            if (!lBasicGlobalFollowerItem.isFinished()) {
                return true;
            }
        }
        return false;
    }

    /**
      Force finish status upon all the BasicGlobalFollowerItem
      call the events and destroy all BasicGlobalFollowerItem
      */
    function completeAll() {
        /*
          Force all the BasicGlobalFollowerItem to be finished
          */
        for (let lIdx = 0; lIdx < mListBasicGlobalFollowerItem.length; lIdx++) {
            let lBasicGlobalFollowerItem = mListBasicGlobalFollowerItem[lIdx];
            lBasicGlobalFollowerItem.complete();
        }
        /**
          Update list of running events and destroy all BasicGlobalFollowerItem which are finished
          */
        updateFinishedItems();
    }

    /**
      Recursive Timer to watch for the end of the event
      */
    Timer {
        id: mTIMER_WATCH_FOR_END
        interval: 100
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            let lIsStopTimer = false;
            if (mListBasicGlobalFollowerItem.length > 0) {
                /**
                  Call the events which are finished and destroy the BasicGlobalFollowerItem
                  */
                updateFinishedItems();
                /**
                  Stop watch if no event is running
                  */
                if (!getmIsAtLeastOneRunning()) {
                    lIsStopTimer = true;
                }
            } else {
                lIsStopTimer = true;

            }
            /**
              Stop the timer and call event in case there is one
              */
            if (lIsStopTimer) {
                /**
                  Communication
                  */
                if (mIS_SHOW_COM_BASIC_GLOBAL_FOLLOWER) {
                    console.log("lIsStopTimer= " + lIsStopTimer);
                }
                /*
                  Stop timer
                  */
                mTIMER_WATCH_FOR_END.stop();
                /**
                  The call by reflection can trigger a new event, so we need to copy the list and empty it
                  */
                let lListEventToCall = [].concat(mListEventsToCall);
                mListEventsToCall = [];
                /**
                  Call the events by reflection
                  */
                for (let lIdx = 0; lIdx < lListEventToCall.length; lIdx++) {
                    let lEvent = lListEventToCall[lIdx];
                    let lContainer = lEvent[0];
                    let lEventToCall = lEvent[1];
                    mBasicReflection.callEvent(lContainer, lEventToCall, mTHIS_BASIC_GLOBAL_FOLLOWER_V2);
                }
                /**
                  Communication
                  */
                if (mIS_SHOW_COM_BASIC_GLOBAL_FOLLOWER) {
                    console.log("No more events");
                }
            }
        }
        onRunningChanged: {
            if (mIS_SHOW_COM_BASIC_GLOBAL_FOLLOWER) {
                if (running) {
                    console.log("mTIMER_WATCH_FOR_END started")
                } else {
                    console.log("mTIMER_WATCH_FOR_END stopped")
                }
                console.log("mListBasicGlobalFollowerItem.length= " + mListBasicGlobalFollowerItem.length)
            }
        }
    }

    ////////////////////////////////////////////////////////////////////
    //          CODE SHADOW
    ////////////////////////////////////////////////////////////////////

    /**
      Create a tracker on the sItemToFollow
        sItemToFollow:
            - Animaton
            - BasicTimer
            - Timer
        sIsContinueEvenIfEscape: (Optional): deactivate the escape key
      */
    function startAndFollow(sItemToFollow, sType, sIsContinueEvenIfEscape) {
        /**
          Communication
          */
        if (mIS_SHOW_COM_BASIC_GLOBAL_FOLLOWER) {
            mBasicDisplay.com(mBasicDisplay.getName(mTHIS_BASIC_GLOBAL_FOLLOWER_V2),
                              "startAndFollow(sItemToFollow= " + mBasicDisplay.getName(sItemToFollow)
                              + ", sType= " + sType + ", sIsContinueEvenIfEscape= " + sIsContinueEvenIfEscape);
        }
        /**
          Create the itemFollow
          */
        let lComponent = Qt.createComponent("BasicGlobalFollowerItem.qml");
        let lBasicGlobalFollowerItem = lComponent.createObject();
        /*
          Check the type of the item to follow is known
          */
        let lType = mBasicDisplay.getType(sItemToFollow);
        if (!mSUPPORTED_TYPES.includes(sType)) {
            mBasicDisplay.error(mTHIS_BASIC_GLOBAL_FOLLOWER_V2, "The item type is not supported by the BasicGlobalFollower; type= " + lType);
        }
        /**
          Initiate - Pass on the data to the itemFollow + follow the item
          */
        lBasicGlobalFollowerItem.initiate_BasicGlobalFollowerItem(sItemToFollow, lType, sIsContinueEvenIfEscape);
        mListBasicGlobalFollowerItem.push(lBasicGlobalFollowerItem);
        /**
          Start the item
          */
        lBasicGlobalFollowerItem.start();
        /**
          Communication
          */
        if (mIS_SHOW_COM_BASIC_GLOBAL_FOLLOWER) {
            console.log("mListBasicGlobalFollowerItem.length= " + mListBasicGlobalFollowerItem.length)
        }
        /**
          Call the timer to watch for the end
          */
        mTIMER_WATCH_FOR_END.start();
    }

    /**
      Call the event for the BasicGlobalFollowerItem which are finished + destroy them
      */
    function updateFinishedItems() {
        if (mListBasicGlobalFollowerItem.length == 0) {
            return;
        }
        let lIsAtLeastOneRunning = false;
        let lIsAtLeastOneFinished = false;
        /*
          Check what we are dealing with: are there some finished and running ?
          */
        for (let lIdx = 0; lIdx < mListBasicGlobalFollowerItem.length; lIdx++) {
            let lBasicGlobalFollowerItem = mListBasicGlobalFollowerItem[lIdx];
            if (lBasicGlobalFollowerItem.isFinished()) {
                lIsAtLeastOneFinished = true;
            } else {
                lIsAtLeastOneRunning = true;
            }
        }
        /*
          Case none are finished --> we exit safely
          */
        if (!lIsAtLeastOneFinished) {
            return;
        }
        /*
          Case one at least is finished --> we create 2 lists: finished and running
          */
        let lListBasicGlobalFollowerItemFinished = [];
        let lListBasicGlobalFollowerItemRunning = [];
        for (let lIdx = 0; lIdx < mListBasicGlobalFollowerItem.length; lIdx++) {
            let lBasicGlobalFollowerItem = mListBasicGlobalFollowerItem[lIdx];
            if (lBasicGlobalFollowerItem.isFinished()) {
                lListBasicGlobalFollowerItemFinished.push(lBasicGlobalFollowerItem);
            } else {
                lListBasicGlobalFollowerItemRunning.push(lBasicGlobalFollowerItem);
            }
        }
        /*
          Destroy the finished BasicGlobalFollowerItem
          */
        for (let lIdx = 0; lIdx < lListBasicGlobalFollowerItemFinished.length; lIdx++) {
            let lBasicGlobalFollowerItem = lListBasicGlobalFollowerItemFinished[lIdx];
            lBasicGlobalFollowerItem.destroy();
        }
        /*
          Update the list of Items still running
          */
        mListBasicGlobalFollowerItem = lListBasicGlobalFollowerItemRunning;
    }



}
