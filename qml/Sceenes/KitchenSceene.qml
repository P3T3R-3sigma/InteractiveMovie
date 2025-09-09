import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {
    id: iKitchen

    anchors.fill: parent

    function getSceene() {
        return [sceeneC00, sceeneC01, sceeneC02, sceeneC08]
    }

    function resetGame(){
        sceeneC01.hide()
        sceeneC02.hide()
        sceeneC08.hide()
        sceeneC00.makeAccessible()
    }


    CHsChoice {
        id: sceeneC00

        mTextBeforeChoosing: "Go to the kitchen"
        mTitle: "I always wanted you"
        mQuestion: "What do you do"

        mMainVideoSource: "c00"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC04
        mListChoices: [sceeneC04, sceeneC03S01]
        mListUnlocks: [sceeneC02]
        mListTerminates: [sceeneC00]
        mFunctionToCall: function() {mVisitedMerida = true}
    }

    CHsChoice {
        id: sceeneC01

        mStatus: mCHc.mStatusEnum.HIDDEN

        mTextBeforeChoosing: "Go to the kitchen again"
        mTitle: "Merida rejects you"
        mQuestion: ""

        mMainVideoSource: "c01"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC02

        mStatus: mCHc.mStatusEnum.HIDDEN

        mTextBeforeChoosing: qsTr("Go to the kitchen")
        mTitle: qsTr("Merida is teasing you")
        mQuestion: qsTr("What do want to do?")

        mMainVideoSource: "c02"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC04
        mListChoices: [sceeneC04, sceeneC03S01]
    }

    CHsChoice {
        id: sceeneC04

        mTextBeforeChoosing: "Leave Merida"
        mTitle: "Left Merida"
        mQuestion: "sceeneC04"

        mMainVideoSource: "c04"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC03S01

        mTextBeforeChoosing: "Fuck Merida"
        mTitle: "Choose to fuck Merida"
        mQuestion: ""

        mMainVideoSource: "c03"

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneS01
        mListChoices: []
        mListUnlocks: [sceeneC08]
        mListTerminates: [sceeneC02]
        mFunctionToCall: mSetSuperGlue
    }

    CHgSexVideo {
        id: sceeneS01

        mIsDebug: true

        mNextVideo: sceeneHall

        mTitle: "Sex with Merida"
        mSourceSimple: ""
        mListSourcesImagesToJumpTo: []
    }

    CHsChoice {
        id: sceeneC08

        mStatus: mCHc.mStatusEnum.HIDDEN

        mTextBeforeChoosing: "Go to the kitchen again"
        mTitle: "Do you want to marry me?"
        mQuestion: "Marry her?"

        mMainVideoSource: "c08"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneBackToHall
        mListChoices: [sceeneC09, sceeneC10, sceeneC11, sceeneBackToHall]
    }

    CHsChoice {
        id: sceeneC09

        mTextBeforeChoosing: "Please, leave me alone"
        mTitle: "Told Merida to leave you alone."
        mQuestion: ""

        mMainVideoSource: "c09"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC10

        mTextBeforeChoosing: "Sure, I will marry you"
        mTitle: "Said, you marry Merida"
        mQuestion: ""

        mMainVideoSource: "c10"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC14S03
        mListChoices: []
    }

    CHsChoice {
        id: sceeneBackToHall

        mIsDebug: true

        mTextBeforeChoosing: "Go back to the hall"
        mTitle: "Going back to the hall"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC11

        mTextBeforeChoosing: "Confess about anal to Merida 1"
        mTitle: "Matthew really wants anal"
        mQuestion: "Do you insist?"

        mMainVideoSource: "c11"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneBackToHall
        mListChoices: [sceeneC12, sceeneBackToHall]
    }

    CHsChoice {
        id: sceeneC12

        mTextBeforeChoosing: "Insist about anal to Merida"
        mTitle: "Insisting on anal"
        mQuestion: ""

        mMainVideoSource: "c12"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC13S02
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC13S02

        mTextBeforeChoosing: ""
        mTitle: "The trap"
        mQuestion: ""

        mMainVideoSource: "c13"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneS02
        mListChoices: []
        mListUnlocks: [sceeneC01]
        mListTerminates: [sceeneC08, sceeneC05, sceeneC71, sceeneC24]
        mFunctionToCall: mRemoveSuperGlue
    }

    CHgSexVideo {
        id: sceeneS02


        mIsDebug: true

        mNextVideo: sceeneHall

        mTitle: "Force Merida to go anal"

        mSourceSimple: ""
        mListSourcesImagesToJumpTo: []
    }

}
