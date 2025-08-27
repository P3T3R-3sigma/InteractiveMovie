import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {
    id: iLibrary

    anchors.fill: parent

    property bool mStep: true


    function meridaSuperGlueOn() {
        sceeneC70.hide()
        sceeneC06.makeAccessible()
    }
    function meridaSuperGlueOff() {
        sceeneC70.makeAccessible()
    }

    function getSceene() {
        return [sceeneC70, sceeneC06]
    }


    CHsChoice {
        id: sceeneC70

        mIsDebug: true

        mTextBeforeChoosing: "Go to the Library"
        mTitle: "Milena is reading"
        mQuestion: "What do you do?"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC73
        mListChoices: [sceeneC72, sceeneC73, sceeneC74, sceeneC75]
    }
    CHsChoice {
        id: sceeneC71

        mIsDebug: true

        mTextBeforeChoosing: ""
        mTitle: "Milena Reject"
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
        id: sceeneC72

        mIsDebug: true

        mTextBeforeChoosing: "Good joke"
        mTitle: "Tell a joke"
        mQuestion: "What joke do you tell?"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC73
        mListChoices: [sceeneC73, sceeneC76, sceeneC77, sceeneC78, sceeneC79]
    }
    CHsChoice {
        id: sceeneC73

        mIsDebug: true

        mTextBeforeChoosing: "Kiss her"
        mTitle: "Forced kiss"
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
        id: sceeneC74

        mIsDebug: true

        mTextBeforeChoosing: "Compliment her beauty"
        mTitle: "Compliment"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC75

        mIsDebug: true

        mTextBeforeChoosing: "Try to buy her out"
        mTitle: "Buy her out"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC76

        mIsDebug: true

        mTextBeforeChoosing: "Binary"
        mTitle: "Explain binary"
        mQuestion: "Who wrote the poem picturing the hero of Onegin?"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC81
        mListChoices: [sceeneC80S07, sceeneC81, sceeneC82, sceeneC83, sceeneC84]
    }
    CHsChoice {
        id: sceeneC77

        mIsDebug: true

        mTextBeforeChoosing: "Baby"
        mTitle: "Explain babys"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC78

        mIsDebug: true

        mTextBeforeChoosing: "Triesome"
        mTitle: "Explain Triesome"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC79

        mIsDebug: true

        mTextBeforeChoosing: "Broken calculator"
        mTitle: "Broken calculator"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC80S07

        mIsDebug: true

        mTextBeforeChoosing: "Alexandre Pushkin"
        mTitle: "Alexandre Pushkin"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneS07
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC81

        mIsDebug: true

        mTextBeforeChoosing: "Oliver Twist"
        mTitle: "Oliver Twist"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC82

        mIsDebug: true

        mTextBeforeChoosing: "Victor Hugo"
        mTitle: "Victor Hugo"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC83

        mIsDebug: true

        mTextBeforeChoosing: "Sherlock Holmes"
        mTitle: "Sherlock Holmes"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC84

        mIsDebug: true

        mTextBeforeChoosing: "Rocco Siffredi"
        mTitle: "Rocco Siffredi"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC71
        mListChoices: []
    }
    CHgSexVideo {
        id: sceeneS07


        mIsDebug: true

        mNextVideo: sceeneHall

        mTitle: "Milena sex"

        mSourceSimple: ""
        mListSourcesImagesToJumpTo: []
    }
}
