import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {

    id: iSwimmingPool

    anchors.fill: parent


    function getSceene() {
        return [sceeneC40, sceeneC41]
    }

    CHsChoice {
        id: sceeneC40


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Swimming Pool")
        mTitle: qsTr("Lollypop")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC46
        mListChoices: [sceeneC42, sceeneC43, sceeneC44, sceeneC45, sceeneC46]
        mListUnlocks: [sceeneC41]
    }
    CHsChoice {
        id: sceeneC41


        mTerminateAfterPlay: false

        mIsDebug: true

        mStatus: mStatusEnum.HIDDEN
        mTextBeforeChoosing: qsTr("Go to the Swimming Pool")
        mTitle: qsTr("Lollypop neutral")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC46
        mListChoices: [sceeneC42, sceeneC43, sceeneC44, sceeneC45, sceeneC46]
    }
    CHsChoice {
        id: sceeneC42


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Lie down")
        mTitle: qsTr("Lie down ")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC25
        mListChoices: [sceeneC25, sceeneC26, sceeneC27, sceeneC28, sceeneC29]
        mListUnlocks: [sceeneC22]
    }
    CHsChoice {
        id: sceeneC43


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Say hello")
        mTitle: qsTr("Hello")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC25
        mListChoices: [sceeneC25, sceeneC26, sceeneC27, sceeneC28, sceeneC29]
        mListUnlocks: [sceeneC22]
    }
    CHsChoice {
        id: sceeneC44


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Propose a drink")
        mTitle: qsTr("drink")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC25
        mListChoices: [sceeneC25, sceeneC26, sceeneC27, sceeneC28, sceeneC29]
        mListUnlocks: [sceeneC22]
    }
    CHsChoice {
        id: sceeneC45


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Compliment")
        mTitle: qsTr("Compliment")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC25
        mListChoices: [sceeneC25, sceeneC26, sceeneC27, sceeneC28, sceeneC29]
        mListUnlocks: [sceeneC22]
    }
    CHsChoice {
        id: sceeneC46


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Kiss her")
        mTitle: qsTr("Kissing her")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC14S03
        mListChoices: []
    }

}
