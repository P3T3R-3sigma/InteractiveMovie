import QtQuick
import Felgo
import "../../Utils/v1"

Item {

    id: mThisShadowOneReflection

    /**
      , should contain the following functions
            start()
            stop()
            complete()
            getmIsRunning()
      */
    property QtObject mQtObject     //  the timer or the animation for example
    /**
      Variables
      */
    property ShadowOneReflectionManager mShadowOneReflectionManager;
    property QtObject mContainer
    property string mEventToCall: ""
    property bool mIsEndIfClick
    property bool mIsPending
    property bool mIsEndIfClickDefined: false
    property bool mIsEventAlreadyCalled: false

    function shadow_initiate(sObjectContainer, sEventToCall, sIsEndIfClick) {
        mIsEventAlreadyCalled = false;
        setmContainer(sObjectContainer);
        setmEventToCall(sEventToCall);
        setmIsEndIfClick(sIsEndIfClick);
    }

    function callEvent(sSender) {
        if (!mIsEventAlreadyCalled) {
            mIsEventAlreadyCalled = true
            mBasicReflection.callEvent(mContainer, mEventToCall, sSender);
            parent.removeCompleted(mThisShadowOneReflection);
        }        
    }

    function checkIfNeedCallEvent() {
        if (!getmIsRunningOrPending()) {
            callEvent(mThisShadowOneReflection);
            return true
        } else {
            return false
        }
    }

    function vString() {
        return mBasicDisplay.getName(mQtObject)
                + ": mContainer= '" + mBasicDisplay.getName(mContainer) + "'"
                + "; mEventToCall= '" + mEventToCall + "'"
                + "; mIsEndIfClick= " + mIsEndIfClick
                + "; running= " + getmIsRunning()
                + "; mIsRunningOrPending= " + getmIsRunningOrPending();
    }

    function getmIsRunningOrPending() {
        return getmIsRunning() || mIsPending;
    }

    /**
      Override
      */
    function start() {
        mQtObject.start();
    }
    function getmIsRunning() {
        return mQtObject.running;
    }
    function stop() {
        mQtObject.stop();
    }
    function complete() {
        mQtObject.complete();
    }

    /**
      Getters & Setters
      */
    function getmIsEndIfClick() {
        if (mIsEndIfClickDefined) {
            return mIsEndIfClick;
        } else {
            return mBasicGlobalFollower.getmDefaultEndIfClick();
        }
    }
    function setmIsEndIfClick(sIsEndIfClick) {
        if (sIsEndIfClick !== undefined && sIsEndIfClick !== null) {
            mIsEndIfClickDefined = true
            mIsEndIfClick = sIsEndIfClick;
        }
    }
    function getmQtObject() {
        return mQtObject;
    }
    function setmQtObject(sQtObject) {
        mQtObject = sQtObject;
    }
    function setmContainer(sContainer) {
        if (sContainer !== undefined && sContainer !== null) {
            mContainer = sContainer;
        }
    }
    function setmEventToCall(sEventToCall) {
        if (sEventToCall !== undefined && sEventToCall !== null) {
            mEventToCall = sEventToCall;
        }
    }
    function setmIsPending(sIsPending) {
        mIsPending = sIsPending
    }
    function setmShadowOneReflectionManager(sShadowOneReflectionManager) {
        mShadowOneReflectionManager = sShadowOneReflectionManager;
    }

}
