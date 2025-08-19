import QtQuick
import Felgo

Item {

    id: mThisShadowOneReflectionManager

    property var mMapKeyToShadowOneReflection: new Map();   //  deprecated
    property var mListShadowOneReflectionRunning: []
    property var mShadow_ListShadowOneReflectionToStart: []
    property var mShadow_ListShadowOneReflectionToUnStack: []
    property QtObject mContainer
    property string mEventToCall: ""

    Component.onCompleted: {
        mBasicGlobalFollower.declareNewShadowReflectionManager(mThisShadowOneReflectionManager);
    }

    function shadow_createShadowOneReflection(sQtObject) {
        var lComponent
        lComponent = Qt.createComponent("ShadowOneReflection.qml");
        let lShadowOneReflection = lComponent.createObject(mThisShadowOneReflectionManager);
        mListShadowOneReflectionRunning.push(lShadowOneReflection);
        /**
          Communication on error
          */
        if (sQtObject === undefined || sQtObject === null) {
            let lMsg = "sQtObject should exist"
            + "\nsQtObject= " + sQtObject;
            mBasicDisplay.error(mThisShadowOneReflectionManager, lMsg);
        }
        /**
          Case of the Animation is passed through --> we link it directly to the ShadowOneReflection
          */
        lShadowOneReflection.mQtObject = sQtObject;
        /**
          Return the newly created shadowOneReflection
          */
        return lShadowOneReflection;
    }

    function shadow_callEventWhenNoMoreAnimationRunning(sContainer, sEventToCall) {
        mContainer = sContainer;
        mEventToCall = sEventToCall;
        shadow_checkForEventToCall();
    }

    function shadow_checkForEventToCall() {
        if (mEventToCall !== "" && !shadow_isAtLeastOneRunningOrPending()) {
            let lEventToCall = mEventToCall;
            mEventToCall = ""
            mBasicReflection.callEvent(mContainer, lEventToCall, mThisShadowOneReflectionManager);
        }
    }

    /**
      Will trigger all the ShadowOneReflection for which the boolean sIsEndIfClick has been set at true
      */
    function shadow_completeAll() {
        let lIdx = 0;
        while (lIdx < mListShadowOneReflectionRunning.length) {
            let lShadowOneReflection = mListShadowOneReflectionRunning[lIdx];
            if (lShadowOneReflection.getmIsRunning() && lShadowOneReflection.getmIsEndIfClick()) {
                lShadowOneReflection.complete();
                lShadowOneReflection.callEvent(mThisShadowOneReflectionManager);
            } else {
                lIdx++;
            }
        }
    }

    function removeCompleted(sShadowOneReflection) {
        let lIdx = mListShadowOneReflectionRunning.indexOf(sShadowOneReflection);
        mListShadowOneReflectionRunning.splice(lIdx, 1);
    }

    function vString() {
        let lString = "List Follow= ";
        for (let lIdx = 0; lIdx < mListShadowOneReflectionRunning.length; lIdx++) {
            let lShadowOneReflection = mListShadowOneReflectionRunning[lIdx];
            lString += "; " + lShadowOneReflection.vString();
        }
        return lString;
    }

    function shadow_isAtLeastOneRunningOrPending() {
        for (let lIdx = 0; lIdx < mListShadowOneReflectionRunning.length; lIdx++) {
            let lShadowOneReflection = mListShadowOneReflectionRunning[lIdx];
            if (lShadowOneReflection.getmIsRunningOrPending()) {
                return true;
            }
        }
        return false;
    }

    /**
      If the sShadowOneReflection is already running then we need to finish it before restarting it
      */
    function shadow_start(sShadowOneReflection) {
        if (sShadowOneReflection.getmIsRunningOrPending()) {

            ////////////////////////////////////////
            console.log(mBasicDisplay.getName(mThisShadowOneReflectionManager) + " calling but "
                        + "Already running at start: " + sShadowOneReflection.vString());
            ////////////////////////////////////////

            sShadowOneReflection.setmIsPending(true);
            sShadowOneReflection.complete("shadow_start");
            shadow_declareNewShadowOneReflectionToStart(sShadowOneReflection);
        } else {
            sShadowOneReflection.start();
        }
        if (!pWatcher.running) {
            pWatcher.start();
        }
    }

    function shadow_declareNewShadowOneReflectionToStart(sShadowOneReflection) {
        if (!pWait.running) {
            pWait.start();
        }
        mShadow_ListShadowOneReflectionToStart.push(sShadowOneReflection);
    }

    Timer {
        id: pWait
        interval: 50
        onTriggered: {
            mShadow_ListShadowOneReflectionToUnStack = [].concat(mShadow_ListShadowOneReflectionToStart);
            mShadow_ListShadowOneReflectionToStart = [];
            pEmptyStack.start();
        }
    }

    Timer {
        id: pEmptyStack
        interval: 50
        onTriggered: {
            for (let lIdx = 0; lIdx < mShadow_ListShadowOneReflectionToUnStack.length; lIdx++) {
                let lShadowOneReflection = mShadow_ListShadowOneReflectionToUnStack[lIdx];
                lShadowOneReflection.start();
                lShadowOneReflection.setmIsPending(false);
            }
            mShadow_ListShadowOneReflectionToUnStack = [];
            pWait.start();
        }
    }

    Timer {
        id: pWatcher
        interval: 50
        onTriggered: {
            let lIdx = 0;
            while (lIdx < mListShadowOneReflectionRunning.length) {
                let lShadowOneReflection = mListShadowOneReflectionRunning[lIdx];
                if (!lShadowOneReflection.checkIfNeedCallEvent()) {
                    lIdx++;
                }
            }
            shadow_checkForEventToCall();
            pWatcher.start();
        }
    }

    /**
      Getters & Setters
      */
    function getmListShadowOneReflectionRunning() {
        return mListShadowOneReflectionRunning;
    }

}
