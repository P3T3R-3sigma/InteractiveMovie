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
    property string mDebugMessage: ""

    property int mStatus: mStatusEnum.ACCESSIBLE
    property bool mTerminateAfterPlay: false

    property int mDisplay: mDisplayEnum.ONE_VIDEO
    property string mTextBeforeChoosing
    property string mTitle      // The title of the scenario    ** Merida jumps you **
    property string mQuestion   // The question of the scenario ** What do you do? **

    property string mTextIfLocked   // Text in case the option is locked
    property string mMainVideoSource
    property string mSecondaryVideoSource
    property string mSecondaryImageSource
    property int mTime      // The time for the timer for choosing
    property int mVideoVolume: 0
    property var mDefaultChoice
    property var mListChoices: []
    property var mShadowListChoices: []
    property var mListUnlocks: []

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

    onVisibleChanged: {
        if (visible) {
            shadow_getChoices()
            mBackground.visible = true
            if (mTerminateAfterPlay) {
                mStatus = mStatusEnum.TERMINATED
            }
            for (let i=0; i < mListUnlocks.length; i++) {
                mListUnlocks[i].makeAccessible()
            }
        }
    }
    onMStatusChanged: mCHgChoices.recalibratePositions()

    Component.onCompleted: mCHgChoices.recalibratePositions()

    function shadow_getChoices() {
        mShadowListChoices = []
        for (let i=0; i < mListChoices.length; i++) {
            if (mListChoices[i].mStatus !== mStatusEnum.HIDDEN && mListChoices[i].mStatus !== mStatusEnum.TERMINATED) {
                mShadowListChoices.push(mListChoices[i])
            }
        }
        mShadowListChoices = mShadowListChoices
        mCHgChoices.recalibratePositions()
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
