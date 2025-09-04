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
    property var pChoosenNext

    visible: false


    CHgBackground {
        id: mBackground

    }

    CHgChoices {
        id: mCHgChoices

        z: 10

        visible: false
    }

    ParallelAnimation {
        id: iParallelAnimationChoice

        running: false
        loops: 1
        NumberAnimation {
            id: iNumberAnimationOpacity
            target: iChoiceManager
            property: "opacity"
            duration: 500

        }
        onFinished: {
            if (opacity === 1) {
            } else {
                iChoiceManager.hideChoices()
                iGlobalMusic.stopVideo()
                pChoosenNext.visible = true
                iChoiceManager.visible = false
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            opacity = 0
            startFadeIn()
            shadow_getChoices()
            setNextSources()
            mCurrentSceene = this
            if (mDisplay === mDisplayEnum.IMAGE) {
                mDefaultChoice = mShadowListChoices[Math.floor(Math.random() * mShadowListChoices.length)]
            }
            mBackground.visible = true
        } else {
            hideChoices()
        }
    }

    Component.onCompleted: {
        shadow_getChoices()
    }

    function startFadeOut(lNext) {
        mCHgChoices.pauseTimer()
        setStatusChanges()
        pChoosenNext = lNext
        iNumberAnimationOpacity.to = 0
        iParallelAnimationChoice.running = true
    }
    function startFadeIn() {
        iNumberAnimationOpacity.to = 1
        iParallelAnimationChoice.running = true
    }


    function getTime() {
        if (mIsTimer) {
            return mCHc.cBaseTime + mShadowListChoices.length * mCHc.cAdditionalTime
        }
        return 0
    }

    function shadow_getChoices() {
        var lShadowListChoices = []
        for (let i=0; i < mListChoices.length; i++) {
            if (mListChoices[i].mStatus !== mStatusEnum.HIDDEN && mListChoices[i].mStatus !== mStatusEnum.TERMINATED) {
                lShadowListChoices.push(mListChoices[i])
            }
        }

        mShadowListChoices = lShadowListChoices
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

    function setNextSources() {
        for (let i=0; i < mShadowListChoices.length; i++) {
            if (!mShadowListChoices[i].getSource()) {
                mShadowListChoices[i].setSource()
            }
        }
        if (mDefaultChoice) {
            if (!mDefaultChoice.getSource()) {
                mDefaultChoice.setSource()
            }
        }
    }

    function setSource() {
        mBackground.setSource()
    }
    function getSource() {
        return mBackground.getSource()
    }

    function showChoices() {
        mChoiceVisible = true
        mCHgChoices.visible = true
    }
    function hideChoices() {
        mChoiceVisible = false
        mCHgChoices.visible = false
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
