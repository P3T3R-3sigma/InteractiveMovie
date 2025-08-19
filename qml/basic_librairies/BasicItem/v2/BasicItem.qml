import QtQuick
import Felgo
import "../../Utils/v1"

Item {

    id: mTHIS_BASIC_ITEM_V2

    /*
      */
    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent
    /**
      Default values - can be changed
      */
    property int mEasingType
    property int mDurationAnimation
    /*
      Case of frozen (to go back to position)
      */
    property real mFrozenX
    property real mFrozenY
    property real mFrozenWidth
    property real mFrozenHeight
    property real mFrozenRotation
    /**
      Reflection - call event
      */
    property QtObject mQtObjectContainer
    property string mEventToCall
    property bool mIsCallReflection

    /*
      The coordinates depends on the parent and are set in percent
      */
    x: parent.width * xPercent
    y: parent.height * yPercent
    width: parent.width * widthPercent
    height: parent.height * heightPercent

    /*
      Parallel Animation
      */
    ParallelAnimation {
        id: mParallelAnimationMoveRotateFadeResize

        running: false
        loops: 1

        NumberAnimation {
            id: mNumberAnimationXPercent
            target: mTHIS_BASIC_ITEM_V2
            property: "xPercent"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: mNumberAnimationYPercent
            target: mTHIS_BASIC_ITEM_V2
            property: "yPercent"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: mNumberAnimationRotation
            target: mTHIS_BASIC_ITEM_V2
            property: "rotation"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: mNumberAnimationWidthPercent
            target: mTHIS_BASIC_ITEM_V2
            property: "widthPercent"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: mNumberAnimationHeightPercent
            target: mTHIS_BASIC_ITEM_V2
            property: "heightPercent"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        NumberAnimation {
            id: mNumberAnimationOpacity
            target: mTHIS_BASIC_ITEM_V2
            property: "opacity"
            duration: mDurationAnimation
            easing.type: mEasingType
        }
        onFinished: {
            if (mIsCallReflection) {
                mIsCallReflection = false;
                mBasicReflection.callEvent(mQtObjectContainer, mEventToCall, mTHIS_BASIC_ITEM_V2);
                mQtObjectContainer = null;
                mEventToCall = "";
            }
        }
    }

    function moveResizeRotateFade(sToXPercent, sToYPercent, sToWidthPercent, sToHeightPercent, sToRotation, sToOpacity,
                                  sDuration, sDelayForTimer, sEasingType) {
        /*
          Case of null
          */
        let lToXPercent = mBasicNum.chooseNotNull(xPercent, sToXPercent);
        let lToYPercent = mBasicNum.chooseNotNull(yPercent, sToYPercent);
        let lToWidthPercent = mBasicNum.chooseNotNull(widthPercent, sToWidthPercent)
        let lToHeightPercent = mBasicNum.chooseNotNull(heightPercent, sToHeightPercent)
        let lToRotation = mBasicNum.chooseNotNull(rotation, sToRotation);
        let lToOpacity = mBasicNum.chooseNotNull(opacity, sToOpacity);
        /**
          Case the BasicItem is not placed anywhere --> we initiate it and exit
          */
        if (xPercent == 0 & yPercent == 0 && widthPercent == 0 && heightPercent == 0) {
            xPercent = lToXPercent;
            yPercent = lToYPercent;
            widthPercent = lToWidthPercent;
            heightPercent = lToHeightPercent;
            rotation = lToRotation;
            opacity = lToOpacity;
        }
        /**
          Moving to
          */
        else {
            /*
              Set parameters for the animations
              */
            mNumberAnimationXPercent.to = lToXPercent;
            mNumberAnimationYPercent.to = lToYPercent;
            mNumberAnimationWidthPercent.to = lToWidthPercent;
            mNumberAnimationHeightPercent.to = lToHeightPercent;
            mNumberAnimationRotation.to = lToRotation
            mNumberAnimationOpacity.to = lToOpacity;
            mDurationAnimation = mBasicNum.chooseNotNull(mBasicConst.getmDEFAULT_DURATION(), sDuration);
            mEasingType = mBasicNum.chooseNotNull(mBasicConst.getmDEFAULT_EASING_TYPE(), sEasingType);
            /**
              Case there is no timer --> we start the animation right away
              */
            if (mBasicNum.isNull(sDelayForTimer)) {
                mBasicAnimationFollower.startAndFollow(mParallelAnimationMoveRotateFadeResize);
            }
            /**
              Case there is a timer --> we launch it with an event and we follow it (so if global click, then it is completed)
                */
            else {
                mBasicTimerManager.launchBasicTimer(sDelayForTimer, mParallelAnimationMoveRotateFadeResize);
            }
        }
    }

    function vString() {
        return "parent= " + mBasicDisplay.getName(parent)
                + "; xPercent= " + xPercent
                + "; yPercent= " + yPercent
                + "; widthPercent= " + widthPercent
                + "; heightPercent= " + heightPercent
                + "; rotation= " + Math.round(rotation)
                + "; x= " + Math.round(x)
                + "; y= " + Math.round(y)
                + "; width= " + Math.round(width)
                + "; height= " + Math.round(height);
    }

    function vStringClassic() {
        return "parent= " + mBasicDisplay.getName(parent)
                + "; x= " + Math.round(x)
                + "; y= " + Math.round(y)
                + "; width= " + Math.round(width)
                + "; height= " + Math.round(height)
                + "; rotation= " + Math.round(rotation);
    }

    function setEventToCallWhenStopMoving(sQtObjectContainer, sEventToCall) {
        mIsCallReflection = true;
        mQtObjectContainer = sQtObjectContainer;
        mEventToCall = sEventToCall;
    }

    function freezeXYWH() {
        mFrozenX = mTHIS_BASIC_ITEM_V2.x;
        mFrozenY = mTHIS_BASIC_ITEM_V2.y
        mFrozenWidth = mTHIS_BASIC_ITEM_V2.width;
        mFrozenHeight = mTHIS_BASIC_ITEM_V2.height
        mFrozenRotation = mTHIS_BASIC_ITEM_V2.rotation
    }

    function moveBackToFrozen(sToOpacity, sEasingType, sDelayForTimer, sDuration) {
        moveRotateFadeResize(mFrozenX, mFrozenY, mFrozenRotation, mFrozenWidth, mFrozenHeight, sToOpacity, sEasingType, sDelayForTimer, sDuration)
    }

    function completeMove() {
        mParallelAnimationMoveRotateFadeResize.complete();
    }

    function getmIsAnimationRunning() {
        return mParallelAnimationMoveRotateFadeResize.running;
    }

    /**
      Case we know at one moment the absolute position and size of the item and we want to use the percent instead
      */
    function convertXYWHtoPercent(sAbsoluteX, sAbsoluteY, sAbsoluteWidth, sAbsoluteHeight) {
        xPercent = sAbsoluteX / parent.width;
        yPercent = sAbsoluteY / parent.height;
        widthPercent = sAbsoluteWidth / parent.width;
        heightPercent = sAbsoluteHeight / parent.height;
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


}
