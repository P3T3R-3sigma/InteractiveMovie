import QtQuick
import Felgo
import QtMultimedia

import "../basic_librairies/BasicImageHover/v1"
import "../basic_librairies/BasicImageSource/v4"
import "../basic_librairies/BasicLoader/v1"
import "../basic_librairies/BasicText/v4"
import "../basic_librairies/BasicDebug/v1"
import "BackGround"
import "Choices"

Item {

    id: iChoiceManager

    anchors.fill: parent

    property var mStatusEnum: {
        "ACCESSIBLE": 0,
        "LOCKED": 1,
        "HIDDEN": 2,
        "TERMINATED": 3
    }
    property var mDisplayEnum: {
        "ONE_VIDEO": 0,
        "TWO_VIDEO": 1,
        "IMAGE": 2
    }

    property bool mIsDebug: false
    property bool mIsDebugImage: false
    property string mDebugMessage: ""

    property bool mIsTimer: false
    property int mStatus: mStatusEnum.ACCESSIBLE
    property int mDisplay: mDisplayEnum.ONE_VIDEO

    property string mTextBeforeChoosing
    property string mTitle                  // The title of the scenario    ** Merida jumps you **
    property string mQuestion               // The question of the scenario ** What do you do? **
    property string mTextIfLocked           // Text in case the option is locked

    property string mMainVideoSource
    property string mSecondaryVideoSource
    property string mSecondaryImageSource

    property int mVideoVolume: mVolumeOverall

    property var mDefaultChoice
    property var mListChoices: []
    property var mShadowListChoices: []
    property var mListUnlocks: []
    property var mListHides: []
    property var mListTerminates: []
    property var mFunctionToCall

    property bool mChoiceVisible: false

    visible: false


    CHgBackground {
        id: mBackground

    }

    CHgChoices {
        id: mCHgChoices

        z: 10

        visible: false

        pXPercent: 0.2
        pYPercent: 0.43
        pWidthPercent: 0.55
        pHeightPercent: 0.35
    }
    CHgChoicesImage {
        id: mCHgChoicesImage

        z: 10

        visible: false

        pXPercent: 0.1
        pYPercent: 0.1
        pWidthPercent: 0.8
        pHeightPercent: 0.8
    }

    onVisibleChanged: {
        if (visible) {
            shadow_getChoices()
            if (mDisplay === mDisplayEnum.IMAGE) {
                mDefaultChoice = mShadowListChoices[Math.floor(Math.random() * mShadowListChoices.length)]
            }
            mBackground.visible = true
        } else {
            hideChoices()
        }
    }
    onMStatusChanged: {
        mCHgChoicesImage.recalibratePositions()
        mCHgChoices.recalibratePositions()
    }
    Component.onCompleted: {
        mCHgChoicesImage.recalibratePositions()
        mCHgChoices.recalibratePositions()
        shadow_getChoices()
    }

    function getTime() {
        if (mIsTimer) {
            return mCHc.cBaseTime + mShadowListChoices.length * mCHc.cAdditionalTime
        }
        return 0
    }

    function shadow_getChoices() {
        mShadowListChoices = []
        for (let i=0; i < mListChoices.length; i++) {
            if (mListChoices[i].mStatus !== mStatusEnum.HIDDEN && mListChoices[i].mStatus !== mStatusEnum.TERMINATED) {
                mShadowListChoices.push(mListChoices[i])
            }
        }
        mShadowListChoices = mShadowListChoices
        mCHgChoicesImage.recalibratePositions()
        mCHgChoices.recalibratePositions()
    }

    function setStatusChanges() {
        let i = 0
        for (i=0; i < mListUnlocks.length; i++) {
            mListUnlocks[i].makeAccessible()
        }
        for (i=0; i < mListTerminates.length; i++) {
            mListTerminates[i].terminate()
        }
        for (i=0; i < mListHides.length; i++) {
            mListHides[i].hide()
        }
        if (mFunctionToCall) {
            mFunctionToCall()
        }
    }

    function showChoices() {
        mChoiceVisible = true
        if (mIsDebugImage) {
            mCHgChoicesImage.visible = true
        } else {
            mCHgChoices.visible = true
        }

    }
    function hideChoices() {
        mChoiceVisible = false
        if (mIsDebugImage) {
            mCHgChoicesImage.visible = false
        } else {
            mCHgChoices.visible = false
        }
    }
    function getChoicesVisible() {
        mChoiceVisible = false
        if (mIsDebugImage) {
            mCHgChoicesImage.visible = false
        } else {
            mCHgChoices.visible = false
        }
    }

    function hide() {
        mStatus = mStatusEnum.HIDDEN
    }
    function terminate() {
        mStatus = mStatusEnum.TERMINATED
    }
    function makeAccessible() {
        mStatus = mStatusEnum.ACCESSIBLE
    }
    function lock() {
        mStatus = mStatusEnum.LOCKED
    }

    function getmListItemToCheckIfLoaded() {
        return [...mBackground.getmListItemToCheckIfLoaded(), ...mListChoices, mDefaultChoice];
    }


}
