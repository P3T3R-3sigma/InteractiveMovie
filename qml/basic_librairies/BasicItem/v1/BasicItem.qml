import QtQuick
import Felgo

Item {

    id: mTHIS_BASIC_ITEM_V1

    /**
      Event
      */
    property int wVisibleSwitch
    /**
      Default values - can be changed
      */
    property int mEasingType
    property int mDurationAnimation
    property real mFrozenX
    property real mFrozenY
    property real mFrozenWidth
    property real mFrozenHeight
    property real mFrozenRotation
    property real mVisibleSwitchX0
    property real mVisibleSwitchY0
    property real mVisibleSwitchX1
    property real mVisibleSwitchY1
    property var mListStopOver
    /**
      Booleans
      */
    property bool mIsInitiated
    property bool mIsActivateVisibleSwitch
    property bool mIsMoving
    property bool mIsDeclaredToBasicItemManager
    /**
      Reflection - call event
      */
    property QtObject mQtObjectContainer
    property string mEventToCall
    property bool mIsCallReflection


    ParallelAnimation {
        id: mMoveRotateFadeResize

        running: false
        loops: 1

        NumberAnimation {
            id: pMoveX
            target: mTHIS_BASIC_ITEM_V1
            property: "x"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: pMoveY
            target: mTHIS_BASIC_ITEM_V1
            property: "y"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: pRotate
            target: mTHIS_BASIC_ITEM_V1
            property: "rotation"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: pAnimeWidth
            target: mTHIS_BASIC_ITEM_V1
            property: "width"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: pAnimeHeight
            target: mTHIS_BASIC_ITEM_V1
            property: "height"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: pAnimeOpacity
            target: mTHIS_BASIC_ITEM_V1
            property: "opacity"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        onFinished: {
            if (mListStopOver.length > 0) {
                shadow_initiateNextStopOver();
                mBasicAnimationFollower.startAndFollow(mMoveRotateFadeResize);
            } else {
                mIsMoving = mBasicItemManager.declareStopMoving(mTHIS_BASIC_ITEM_V1);
                if (mIsCallReflection) {
                    mIsCallReflection = false;
                    mBasicReflection.callEvent(mQtObjectContainer, mEventToCall, mTHIS_BASIC_ITEM_V1);
                }
            }
        }
    }

    function moveRotateFadeResize(sToX, sToY, sToRotate, sToWidth, sToHeight, sToOpacity,
                                  sEasingType, sDelayForTimer, sDuration) {
        /**
          Case the BasicItem is not placed anywhere --> we initiate it and exit
          */
        if (x == 0 & y == 0 && width == 0 && height == 0) {
            initiatePosition(sToX, sToY, sToWidth, sToHeight, sToRotate);
        }
        /**
          Moving to
          */
        else {
            mIsMoving = mBasicItemManager.declareMoving(mTHIS_BASIC_ITEM_V1);
            mDurationAnimation = mBasicNum.chooseNotNull(mBasicConst.getmDEFAULT_DURATION(), sDuration);
            mEasingType = mBasicNum.chooseNotNull(mBasicConst.getmDEFAULT_EASING_TYPE(), sEasingType);
            /**
              Check if there is a visible switch window which we need to take into account
              */
            shadow_buildListStopOvers(sToX, sToY, sToRotate, sToWidth, sToHeight, sToOpacity);
            /**
              Initiate the next step over
              */
            shadow_initiateNextStopOver();
            /**
              Case there is no timer --> we start the animation right away
              */
            if (sDelayForTimer === undefined || sDelayForTimer === null) {
                moveRotateFadeResizeBasicItemParent(sToX, sToY, sToRotate, sToWidth, sToHeight, sToOpacity,
                                                  sEasingType, sDelayForTimer, sDuration);
                mBasicAnimationFollower.startAndFollow(mMoveRotateFadeResize);
            }
            /**
              Case there is a timer --> we launch it with an event and we follow it (so if global click, then it is completed)
                */
            else {
                mBasicTimerManager.launchBasicTimer(sDelayForTimer, mMoveRotateFadeResize);
            }
        }
    }

    /** @Override */
    function initiateBasicItemParent(sX, sY, sWidth, sHeight, sRotation) {
        /** @Override */
    }

    /** @Override */
    function moveRotateFadeResizeBasicItemParent(sToX, sToY, sToRotate, sToWidth, sToHeight, sToOpacity,
                                  sEasingType, sDelayForTimer, sDuration) {
        /** @Override */
    }

    /** @DEPRECATED */
    function initiateBasicItem(sX, sY, sWidth, sHeight, sRotation) {
        ////////////////////////////////////////////////
        mBasicDisplay.deprecated(mTHIS_BASIC_ITEM_V1);
        ////////////////////////////////////////////////
        mTHIS_BASIC_ITEM_V1.x = mBasicNum.chooseNotNull(x, sX);
        mTHIS_BASIC_ITEM_V1.y = mBasicNum.chooseNotNull(y, sY);
        mTHIS_BASIC_ITEM_V1.width = mBasicNum.chooseNotNull(width, sWidth);
        mTHIS_BASIC_ITEM_V1.height = mBasicNum.chooseNotNull(height, sHeight);
        mTHIS_BASIC_ITEM_V1.rotation = mBasicNum.chooseNotNull(rotation, sRotation);
        shadow_declareToBasicItemManger(mTHIS_BASIC_ITEM_V1);
        mIsInitiated = true;
        initiateBasicItemParent(sX, sY, sWidth, sHeight, sRotation);
    }

    /** @DEPRECATED */
    function initiatePosition(sX, sY, sWidth, sHeight, sRotation) {
        ////////////////////////////////////////////////
        mBasicDisplay.deprecated(mTHIS_BASIC_ITEM_V1);
        ////////////////////////////////////////////////
        initiateBasicItem(sX, sY, sWidth, sHeight, sRotation);
    }

    function vString() {
        return "x= " + Math.round(x) + "; y= " + Math.round(y) + "; width= " + Math.round(width) + "; height= " + Math.round(height) + "; rotation= " + Math.round(rotation);
    }

    function setEventToCallWhenStopMoving(sQtObjectContainer, sEventToCall) {
        mIsCallReflection = true;
        mQtObjectContainer = sQtObjectContainer;
        mEventToCall = sEventToCall;
    }

    function freezeXYWH0() {
        mFrozenX = mTHIS_BASIC_ITEM_V1.x;
        mFrozenY = mTHIS_BASIC_ITEM_V1.y
        mFrozenWidth = mTHIS_BASIC_ITEM_V1.width;
        mFrozenHeight = mTHIS_BASIC_ITEM_V1.height
        mFrozenRotation = mTHIS_BASIC_ITEM_V1.rotation

        //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        // console.log(">Freeze: mFrozenX= " + mFrozenX + "; mFrozenY= " + mFrozenY + "; mFrozenWidth= " + mFrozenWidth + "; mFrozenHeight= " + mFrozenHeight);
        //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    }

    function addToFrozenXY(sAddToFrozenX, sAddToFrozenY) {
        mFrozenX += mBasicNum.chooseNotNull(0, sAddToFrozenX);
        mFrozenY += mBasicNum.chooseNotNull(0, sAddToFrozenY);
    }

    function moveBackTo0(sToOpacity, sEasingType, sDelayForTimer, sDuration) {
        moveRotateFadeResize(mFrozenX, mFrozenY, mFrozenRotation, mFrozenWidth, mFrozenHeight, sToOpacity, sEasingType, sDelayForTimer, sDuration)
    }

    function reset() {
        mIsInitiated = false
        setVisible(false);
    }

    function completeMove() {
        mMoveRotateFadeResize.complete();
    }

    function getmIsAnimationRunning() {
        return mMoveRotateFadeResize.running;
    }

    /**
      If the BasicItem moves and crosses this window, then it will switch its state visible true/false
      note: on the window, the state is like in the window
      */
    function setVisibleSwitchWindow(_sX, _sY, _sWidth, _sHeight) {
        mVisibleSwitchX0 = _sX;
        mVisibleSwitchY0 = _sY;
        mVisibleSwitchX1 = _sX + _sWidth;
        mVisibleSwitchY1 = _sY + _sHeight;
    }

    function getmIsInVisibleSwitchBox(_sX, _sY) {
        return mVisibleSwitchX0 <= _sX && _sX <= mVisibleSwitchX1 && mVisibleSwitchY0 <= _sY && _sY <= mVisibleSwitchY1;
    }

    function shadow_initiateNextStopOver() {
        if (mListStopOver.length > 0) {
            let lStopOver = mListStopOver[0];
            mListStopOver.shift();
            /**
              prepare variable for the stop over
              */
            let lIdx = 0;
            pMoveX.to = lStopOver[++lIdx];
            pMoveY.to = lStopOver[++lIdx];
            pRotate.to = lStopOver[++lIdx];
            pAnimeWidth.to = lStopOver[++lIdx];
            pAnimeHeight.to = lStopOver[++lIdx];
            pAnimeOpacity.to = lStopOver[++lIdx];
            mDurationAnimation = lStopOver[++lIdx];
            mEasingType = lStopOver[++lIdx];
            visible = lStopOver[++lIdx];
        }
    }

    function shadow_buildListStopOvers(sToX, sToY, sToRotate, sToWidth, sToHeight, sToOpacity) {
        /**
          Treat the null variables as optional
          */
        let lToX = mBasicNum.chooseNotNull(x, sToX);
        let lToY = mBasicNum.chooseNotNull(y, sToY);
        let lToRotate = mBasicNum.chooseNotNull(rotation, sToRotate);
        let lToWidth = mBasicNum.chooseNotNull(width, sToWidth);
        let lToHeight = mBasicNum.chooseNotNull(height, sToHeight);
        let lToOpacity = mBasicNum.chooseNotNull(opacity, sToOpacity);
        /**
          Initiate + get out if there is no change
          */
        mListStopOver = [];
        if (lToX === x && lToY === y && lToRotate === rotation
                && lToWidth === width && lToHeight === height && lToOpacity === opacity) {
            return;
        }
        /**
          Add the final destination as a stop over
          */
        shadow_addNewStopOver(lToX, lToY, lToX, lToY, lToRotate, lToWidth, lToHeight, lToOpacity);
        if (mIsActivateVisibleSwitch) {
            /**
                Case of the left
            */
            if (lToX !== x) {
                let lX = mVisibleSwitchX0;
                let lY = (y * (lX - lToX) + lToY * (x - lX)) / (x - lToX);
                if (shadow_isValidStopOver(lX, lY)) {
                    shadow_addNewStopOver(lX, lY, lToX, lToY, lToRotate, lToWidth, lToHeight, lToOpacity)
                }
            }
            /**
                Case of the right
            */
            if (lToX !== x) {
                let lX = mVisibleSwitchX1;
                let lY = (y * (lX - lToX) + lToY * (x - lX)) / (x - lToX);
                if (shadow_isValidStopOver(lX, lY)) {
                    shadow_addNewStopOver(lX, lY, lToX, lToY, lToRotate, lToWidth, lToHeight, lToOpacity)
                }
            }
            /**
                Case of the top
            */
            if (lToY !== y) {
                let lY = mVisibleSwitchY0;
                let lX = (x * (lY - lToY) + lToX * (y - lY)) / (y - lToY);
                if (shadow_isValidStopOver(lX, lY)) {
                    shadow_addNewStopOver(lX, lY, lToX, lToY, lToRotate, lToWidth, lToHeight, lToOpacity)
                }
            }
            /**
                Case of the bottom
            */
            if (lToY !== y) {
                let lY = mVisibleSwitchY1;
                let lX = (x * (lY - lToY) + lToX * (y - lY)) / (y - lToY);
                if (shadow_isValidStopOver(lX, lY)) {
                    shadow_addNewStopOver(lX, lY, lToX, lToY, lToRotate, lToWidth, lToHeight, lToOpacity)
                }
            }
        }
        /**
          Treat the duration
          */
        let lDuration = 0;
        for (let lIdx = 0; lIdx < mListStopOver.length; lIdx++) {
            let lStopOver = mListStopOver[lIdx];
            let lDurationDelta = lStopOver[7] - lDuration;
            lDuration = lStopOver[7];
            lStopOver[7] = lDurationDelta;
        }
        /**
          Treat the easing type
          */
        for (let lIdx = 0; lIdx < mListStopOver.length; lIdx++) {
            let lStopOver = mListStopOver[lIdx];
            if (mListStopOver.length === 1) {
                lStopOver.push(mEasingType);
            } else if (lIdx == 0) {
                lStopOver.push(Easing.InQuad);
            } else if (lIdx == mListStopOver.length - 1) {
                lStopOver.push(Easing.OutQuad);
            } else {
                lStopOver.push(Easing.Linear);
            }
        }
        /**
          Treat visible
          */
        let lIsVisible = !visible;
        for (let lIdx = 0; lIdx < mListStopOver.length; lIdx++) {
            let lStopOver = mListStopOver[lIdx];
            lIsVisible = !lIsVisible;
            lStopOver.push(lIsVisible);
        }
    }

    function shadow_addNewStopOver(sX, sY, sToX, sToY, sToRotate, sToWidth, sToHeight, sToOpacity) {
        /**
          Compute the percent from start - this will be use to sort the stop over
          */
        let lDistFromStart = Math.sqrt((Math.pow(sX - x, 2) + Math.pow(sY - y, 2)));
        let lDistTotal = Math.sqrt((Math.pow(sToX - x, 2) + Math.pow(sToY - y, 2)));
        let lPercentNew = lDistTotal == 0 ? 1 : (lDistFromStart / lDistTotal);
        let lStopOverNew = [];
        lStopOverNew.push(lPercentNew);
        /**
          Sort the stop overs from the beginning to the end. Insert the new stop over in the list
          */
        if (mListStopOver.length === 0) {
            mListStopOver.push(lStopOverNew);
        } else {
            for (let lIdx = 0; lIdx < mListStopOver.length; lIdx++) {
                let lStopOver = mListStopOver[lIdx];
                let lPercent = lStopOver[0];
                if (lPercent > lPercentNew) {
                    mListStopOver.splice(lIdx, 0, lStopOverNew);
                    break;
                }
            }
        }
        /**
          compute the data as a percent of the progression to the final destination
          */
        lStopOverNew.push(sX);
        lStopOverNew.push(sY);
        let lRotate = lPercentNew * (sToRotate - rotation) + rotation;
        let lToWidth = lPercentNew * (sToWidth - width) + width;
        let lToHeight = lPercentNew * (sToHeight - height) + height;
        let lToOpacity = lPercentNew * (sToOpacity - opacity) + opacity;
        let lDuration = lPercentNew * mDurationAnimation;
        lStopOverNew.push(lRotate);
        lStopOverNew.push(lToWidth);
        lStopOverNew.push(lToHeight);
        lStopOverNew.push(lToOpacity);
        lStopOverNew.push(lDuration);
    }

    function shadow_isValidStopOver(sX, sY) {
        if (!getmIsInVisibleSwitchBox(sX, sY)) {
            return false;
        } else {
            let lEndStop = mListStopOver[mListStopOver.length - 1];
            let lToX = lEndStop[1];
            let lToY = lEndStop[2];
            return mBasicNum.isOppositeSignOrZero(x - sX, lToX - sX)
                    && mBasicNum.isOppositeSignOrZero(y - sY, lToY - sY);
        }
    }

    function shadow_declareToBasicItemManger() {
        if (!mIsDeclaredToBasicItemManager) {
            mIsDeclaredToBasicItemManager = true;
            mBasicItemManager.declareBasicItem(mTHIS_BASIC_ITEM_V1);
        }
    }

    /**
      Getters & Setters
      */
    function setVisible(sIsVisible) {
        visible = sIsVisible;
    }
    function getmDurationAnimation() {
        return mDurationAnimation
    }
    function setmIsActivateVisibleSwitch(sIsActivateVisibleSwitch) {
        mIsActivateVisibleSwitch = sIsActivateVisibleSwitch;
    }
    function getmIsMoving() {
        return mIsMoving;
    }
}
