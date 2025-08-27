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

        mIsDebug: true

        mTextBeforeChoosing: "Go to the kitchen"
        mTitle: "I always wanted you"
        mQuestion: "What do you do"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC04
        mListChoices: [sceeneC04, sceeneC03S01]
        mListUnlocks: [sceeneC02]
        mListTerminates: [sceeneC00]
    }

    CHsChoice {
        id: sceeneC01

        mStatus: mStatusEnum.HIDDEN

        mIsDebug: true
        mDebugMessage: "Merida rejects you"

        mTextBeforeChoosing: "Go to the kitchen again"
        mTitle: "Merida rejects you"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC02

        mStatus: mStatusEnum.HIDDEN

        mIsDebug: true
        mDebugMessage: "Merida teasing"

        mTextBeforeChoosing: qsTr("Go to the kitchen")
        mTitle: qsTr("Merida is teasing you")
        mQuestion: qsTr("What do want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC04
        mListChoices: [sceeneC04, sceeneC03S01]
    }

    CHsChoice {
        id: sceeneC04

        mIsDebug: true
        mDebugMessage: "Leaving Merida"

        mTextBeforeChoosing: "Leave Merida"
        mTitle: "Left Merida"
        mQuestion: "sceeneC04"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC03S01

        mIsDebug: true
        mDebugMessage: "Before fucking Merida"

        mTextBeforeChoosing: "Fuck Merida"
        mTitle: "Choose to fuck Merida"
        mQuestion: ""

        mMainVideoSource: ""
        mTime: 0
        mVideoVolume: 0
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


        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true
        mDebugMessage: "Do you eant to marry her?"

        mTextBeforeChoosing: "Go to the kitchen again"
        mTitle: "Do you want to marry me?"
        mQuestion: "Marry her?"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: [sceeneC09, sceeneC10, sceeneC11, sceeneBackToHall]
    }

    CHsChoice {
        id: sceeneC09


        mIsDebug: true
        mDebugMessage: "Told Merida to leave you alone"

        mTextBeforeChoosing: "Please, leave me alone"
        mTitle: "Told Merida to leave you alone."
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC10


        mIsDebug: true
        mDebugMessage: "Said you will marry Merida"

        mTextBeforeChoosing: "Sure, I will marry you"
        mTitle: "Said, you marry Merida"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
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
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC11

        mIsDebug: true
        mDebugMessage: "Confession about anal"

        mTextBeforeChoosing: "Confess about anal to Merida 1"
        mTitle: "Matthew really wants anal"
        mQuestion: "Do you insist?"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: [sceeneC12, sceeneBackToHall]
    }

    CHsChoice {
        id: sceeneC12

        mIsDebug: true

        mTextBeforeChoosing: "Insist about anal to Merida"
        mTitle: "Insisting on anal"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC13S02
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC13S02

        mIsDebug: true

        mTextBeforeChoosing: ""
        mTitle: "The trap"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneS02
        mListChoices: []
        mListUnlocks: [sceeneC01]
        mListTerminates: [sceeneC08, sceeneC05, sceeneC06, sceeneC07]
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
