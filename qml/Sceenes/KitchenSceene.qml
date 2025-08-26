import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {
    id: iKitchen

    anchors.fill: parent

    property bool mStep: true
    signal onStepChanged()

    onMStepChanged: onStepChanged()

    function getSceene() {
        return [sceeneC00, sceeneC01, sceeneC02, sceeneC08]
    }

    CHsChoice {
        id: sceeneC00

        mTerminateAfterPlay: true

        mIsDebug: true

        mTextBeforeChoosing: "Go to the kitchen"
        mTitle: "I always wanted you"
        mQuestion: "What do you do"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mListUnlocks: [sceeneC02]
        mDefaultChoice: sceeneC04
        mListChoices: [sceeneC04, sceeneC03S01]
    }

    CHsChoice {
        id: sceeneC01

        mTerminateAfterPlay: false
        mStatus: mStatusEnum.HIDDEN

        mIsDebug: true
        mDebugMessage: "Merida rejects you"

        mTextBeforeChoosing: ""
        mTitle: ""
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

        mTerminateAfterPlay: false
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

        mTerminateAfterPlay: false

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

        mTerminateAfterPlay: false

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


        mTerminateAfterPlay: false

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


        mTerminateAfterPlay: false

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


        mTerminateAfterPlay: false

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


        mTerminateAfterPlay: false

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


        mTerminateAfterPlay: false

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


        mTerminateAfterPlay: false

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


        mTerminateAfterPlay: false

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
