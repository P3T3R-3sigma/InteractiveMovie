import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {

    id: iBedroom

    anchors.fill: parent


    function meridaSuperGlueOn() {
        if (sceeneC22.mStatus === sceeneC22.mStatusEnum.TERMINATED) {
            return
        } else if (sceeneC20.mStatus === sceeneC20.mStatusEnum.TERMINATED) {
        } else {
            sceeneC20.hide()
        }
        sceeneC22.hide()
        sceeneC24.makeAccessible()
    }
    function meridaSuperGlueOff() {
        if (sceeneC22.mStatus === sceeneC22.mStatusEnum.TERMINATED) {
            return
        } else if (sceeneC20.mStatus === sceeneC20.mStatusEnum.TERMINATED) {
        } else {
            sceeneC20.makeAccessible()
        }
    }

    function resetGame(){
        sceeneC20.makeAccessible()
        sceeneC22.hide()
        sceeneC23.hide()
        sceeneC26.makeAccessible()
        sceeneC29.makeAccessible()
    }

    function getSceene() {
        return [sceeneC20, sceeneC22, sceeneC23, sceeneC24]
    }

    CHsChoice {
        id: sceeneC20

        mTextBeforeChoosing: qsTr("Go to the Bedroom")
        mTitle: qsTr("BGF")
        mQuestion: qsTr("What do want to do?")

        mMainVideoSource: "c20"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC28
        mListChoices: [sceeneC25, sceeneC26, sceeneC30, sceeneC28, sceeneC29]
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

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
        mListUnlocks: [sceeneC26, sceeneC29]
    }
    CHsChoice {
        id: sceeneC22

        mStatus: mStatusEnum.HIDDEN

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Hi")
        mQuestion: qsTr("What do want to do?")

        mMainVideoSource: "c22"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC28
        mListChoices: [sceeneC25, sceeneC26, sceeneC30, sceeneC28, sceeneC29]
    }
    CHsChoice {
        id: sceeneC23

        mStatus: mStatusEnum.HIDDEN

        mTextBeforeChoosing: qsTr("Go to the Bedroom again")
        mTitle: qsTr("Haven't you done enough?")

        mMainVideoSource: "c23"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC25

        mTextBeforeChoosing: qsTr("My hormones are shouting")
        mTitle: qsTr("My hormones")
        mQuestion: qsTr("")

        mMainVideoSource: "c25"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC14S03
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC26

        mTextBeforeChoosing: qsTr("Leya is incredible")
        mTitle: qsTr("Leya is incredible")
        mQuestion: qsTr("What do you do?")

        mMainVideoSource: "c26"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC28
        mListChoices: [sceeneC25, sceeneC31S04, sceeneC28, sceeneC29]
        mListHides: [sceeneC26]
    }
    CHsChoice {
        id: sceeneC27

        mTextBeforeChoosing: qsTr("Ask to put on sunburn")
        mTitle: qsTr("I got a sunburn")
        mQuestion: qsTr("")

        mMainVideoSource: "c27"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: null
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC28

        mTextBeforeChoosing: qsTr("Tell a joke  about sex")
        mTitle: qsTr("Sex talk")
        mQuestion: qsTr("")

        mMainVideoSource: "c28"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
        mListUnlocks: [sceeneC26, sceeneC29]
    }
    CHsChoice {
        id: sceeneC29

        mTextBeforeChoosing: qsTr("Tell a joke about chihuahas")
        mTitle: qsTr("Chihuahas")
        mQuestion: qsTr("What do you do?")

        mMainVideoSource: "c29"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC28
        mListChoices: [sceeneC25, sceeneC26, sceeneC31S04, sceeneC28]
        mListHides: [sceeneC29]
    }
    CHsChoice {
        id: sceeneC30

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Ask to put on sunburn")
        mTitle: qsTr("This is inapropriate")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
        mListUnlocks: [sceeneC26, sceeneC29]
    }
    CHsChoice {
        id: sceeneC31S04

        mTextBeforeChoosing: qsTr("Ask to put on sunburn")
        mTitle: qsTr("It is really because you are a nice guy")
        mQuestion: qsTr("")

        mMainVideoSource: "c31"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
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
