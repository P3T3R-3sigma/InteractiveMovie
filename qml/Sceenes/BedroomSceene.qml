import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {

    id: iBedroom

    anchors.fill: parent


    function getSceene() {
        return [sceeneC20, sceeneC21, sceeneC22, sceeneC23]
    }

    CHsChoice {
        id: sceeneC20


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Bedroom")
        mTitle: qsTr("BGF")
        mQuestion: qsTr("What do want to do?")

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
        id: sceeneC21

        mTerminateAfterPlay: true

        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Go away")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC22


        mTerminateAfterPlay: true

        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Hi")
        mQuestion: qsTr("What do want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC25
        mListChoices: [sceeneC25, sceeneC26, sceeneC27, sceeneC28, sceeneC29]
    }
    CHsChoice {
        id: sceeneC23


        mTerminateAfterPlay: true

        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Haven't you done enough?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC24


        mTerminateAfterPlay: true

        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true

        mTextBeforeChoosing: qsTr("")
        mTitle: qsTr("SuperGlue")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC25


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("My hormones are shouting")
        mTitle: qsTr("My hormones")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC14S03
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC26


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Leya is incredible")
        mTitle: qsTr("Leya is incredible")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC27


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Ask to put on sunburn")
        mTitle: qsTr("I got a sunburn")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC28


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Tell a joke  about sex")
        mTitle: qsTr("Sex talk")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC29


        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Tell a joke about chihuahas")
        mTitle: qsTr("Chihuahas joke")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

}
