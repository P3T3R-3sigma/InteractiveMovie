import QtQuick
import Felgo

Item {

    id: mThisBasicGlobalFollower

    /**
      Default constant
      */
    property bool mDefaultEndIfClick: false          //  will be inserted in the "CompleteAll" by default if true, or not if false
    /**
      Variables
      */
    property var mListFollowers: []
    property var mListEventsToCall: []

    /**
      will call the event when no more animation and no more BasicTimer is running
      if there is no animation, then will call the event right away, without waiting time
      frequency of the check is 50ms
      */
    function watchAllToCallEvent(sContainer, sEventToCall) {
        let lEvent = []
        lEvent.push(sContainer);
        lEvent.push(sEventToCall);
        mListEventsToCall.push(lEvent);
        pWatcher.start();
    }

    /**
      Complete all animations and trigger all BasicTimers
      */
    function completeAll() {
        for (let lIdx = 0; lIdx < mListFollowers.length; lIdx++) {
            let lFollower = mListFollowers[lIdx];
            lFollower.completeAll();
        }
    }

    /**
      Returns true if there is a pending animation or timer, or video
      */
    function getmIsAtLeastOnePendingOrRunning() {
        for (let lIdx = 0; lIdx < mListFollowers.length; lIdx++) {
            let lFollower = mListFollowers[lIdx];
            if (lFollower.shadow_isAtLeastOneRunningOrPending()) {
                return true;
            }
        }
        if (mBasicItemManager.getmIsAtLeastOneMoving()) {
            return true;
        }
        return false;
    }

    function checkForEvent() {
        if (mListEventsToCall.length > 0) {
            /**
              cancel if there is at least one pending or running
              */
            if (getmIsAtLeastOnePendingOrRunning()) {
                return;
            }
            /**
              Clone the list of events to call and reset
              */
            let lListEventsToCall = []
            for (let lIdx = 0; lIdx < mListEventsToCall.length; lIdx++) {
                lListEventsToCall.push(mListEventsToCall[lIdx]);
            }
            mListEventsToCall = [];
            /**
              Check for event
              */
            for (let lIdx = 0; lIdx < lListEventsToCall.length; lIdx++) {
                let lEvent = lListEventsToCall[lIdx];
                let lContainer = lEvent[0];
                let lEventStr = lEvent[1];
                /**
                  Call Reflection
                  */
                mBasicReflection.callEvent(lContainer, lEventStr, mThisBasicGlobalFollower);
            }
        }
    }

    Timer {
        id: pWatcher
        interval: 50
        onTriggered: {
            checkForEvent();            
            pWatcher.start();
        }
    }

    function declareNewShadowReflectionManager(sReflectionManager) {
        if (mListFollowers === null || mListFollowers === undefined) {
            mListFollowers = [];
        }
        mListFollowers.push(sReflectionManager);
    }

    /**
      Getters & Setters
      */
    function setmDefaultEndIfClick(sDefaultEndIfClick) {
        mDefaultEndIfClick = sDefaultEndIfClick;
    }
    function getmDefaultEndIfClick() {
        return mDefaultEndIfClick;
    }

}
