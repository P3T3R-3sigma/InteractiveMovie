import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {

    id: iBedroom

    anchors.fill: parent

    property bool pLaugh: false

    function meridaSuperGlueOn() {
        if (sceeneC20.mStatus === sceeneC20.mStatusEnum.TERMINATED) {
        } else {
            sceeneC20.hide()
        }
        sceeneC22.hide()
        sceeneC07.makeAccessible()
    }
    function meridaSuperGlueOff() {
        if (sceeneC20.mStatus === sceeneC20.mStatusEnum.TERMINATED) {
            sceeneC22.makeAccessible()
        } else {
            sceeneC20.makeAccessible()
        }
    }

    function getSceene() {
        return [sceeneC20, sceeneC22, sceeneC23, sceeneC07]
    }

    function setLaugh() {
        pLaugh = true
    }

    CHsChoice {
        id: sceeneC20

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
        mListTerminates: [sceeneC20]
    }
    CHsChoice {
        id: sceeneC21

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Go away")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC22

        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Hi")
        mQuestion: qsTr("What do want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC25
        mListChoices: [sceeneC25, sceeneC26, sceeneC27, sceeneC28, sceeneC29]
    }
    CHsChoice {
        id: sceeneC23




        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Haven't you done enough?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC25

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

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Leya is incredible")
        mTitle: qsTr("Leya is incredible")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC22
        mListChoices: []
        mFunctionToCall: setLaugh
    }
    CHsChoice {
        id: sceeneC27

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Ask to put on sunburn")
        mTitle: qsTr("I got a sunburn")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: pLaugh ? sceeneC31S04 : sceeneC21
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC28

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Tell a joke  about sex")
        mTitle: qsTr("Sex talk")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC21
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC29

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Tell a joke about chihuahas")
        mTitle: qsTr("Chihuahas joke")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC22
        mListChoices: []
        mFunctionToCall: setLaugh
    }
    CHsChoice {
        id: sceeneC30

        mIsDebug: true

        mTextBeforeChoosing: qsTr("")
        mTitle: qsTr("This is inapropriate")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC21
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC31S04

        mIsDebug: true

        mTextBeforeChoosing: qsTr("")
        mTitle: qsTr("It is really because you are a nice guy")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneS04
        mListChoices: []
        mListUnlocks: [sceeneC23]
        mListTerminates: [sceeneC22]
    }
    CHgSexVideo {
        id: sceeneS04


        mIsDebug: true

        mNextVideo: sceeneHall

        mTitle: "Sex on bed: Amber"

        mSourceSimple: ""
        mListSourcesImagesToJumpTo: []
    }

}
