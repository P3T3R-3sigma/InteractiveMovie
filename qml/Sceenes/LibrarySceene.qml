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
        sceeneC71.makeAccessible()
    }
    function meridaSuperGlueOff() {
        sceeneC70.makeAccessible()
    }

    function getSceene() {
        return [sceeneC70, sceeneC71]
    }

    function resetGame() {
        sceeneC70.makeAccessible()
    }

    CHsChoice {
        id: sceeneC70

        mTextBeforeChoosing: "Go to the Library"
        mTitle: "Milena is reading"
        mQuestion: "What do you do?"

        mMainVideoSource: "c70"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC75
        mListChoices: [sceeneC72, sceeneC73, sceeneC74, sceeneC75]
        mFunctionToCall: function() {mVisitedMilena = true}
    }
    CHsChoice {
        id: sceeneC72

        mTextBeforeChoosing: "Good joke"
        mTitle: "Tell a joke"
        mQuestion: "What joke do you tell?"

        mMainVideoSource: "c72"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC79
        mListChoices: [sceeneC73, sceeneC76, sceeneC77, sceeneC78, sceeneC79]
    }
    CHsChoice {
        id: sceeneC73

        mTextBeforeChoosing: "Kiss her"
        mTitle: "Forced kiss"
        mQuestion: ""

        mMainVideoSource: "c73"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC14S03
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC74

        mTextBeforeChoosing: "Compliment her beauty"
        mTitle: "Compliment"
        mQuestion: ""

        mMainVideoSource: "c74"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC75

        mTextBeforeChoosing: "Try to buy her out"
        mTitle: "Buy her out"
        mQuestion: ""

        mMainVideoSource: "c75"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC76

        mTextBeforeChoosing: "Binary"
        mTitle: "Explain binary"
        mQuestion: "Who wrote the poem picturing the hero of Onegin?"

        mMainVideoSource: "c76"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC83
        mListChoices: [sceeneC80S07, sceeneC81, sceeneC82, sceeneC83, sceeneC84]
    }
    CHsChoice {
        id: sceeneC77

        mTextBeforeChoosing: "Baby"
        mTitle: "Explain babys"
        mQuestion: ""

        mMainVideoSource: "c77"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC78

        mTextBeforeChoosing: "Triesome"
        mTitle: "Explain Triesome"
        mQuestion: ""

        mMainVideoSource: "c78"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC79

        mTextBeforeChoosing: "Broken calculator"
        mTitle: "Broken calculator"
        mQuestion: ""

        mMainVideoSource: "c79"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC80S07

        mTextBeforeChoosing: "Alexandre Pushkin"
        mTitle: "Alexandre Pushkin"
        mQuestion: ""

        mMainVideoSource: "c80"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneS07
        mListChoices: []
        mFunctionToCall: function() {mHadSexMilena = true}
    }
    CHsChoice {
        id: sceeneC81

        mTextBeforeChoosing: "Oliver Twist"
        mTitle: "Oliver Twist"
        mQuestion: ""

        mMainVideoSource: "c81"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC82

        mTextBeforeChoosing: "Victor Hugo"
        mTitle: "Victor Hugo"
        mQuestion: ""

        mMainVideoSource: "c82"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC83

        mTextBeforeChoosing: "Sherlock Holmes"
        mTitle: "Sherlock Holmes"
        mQuestion: ""

        mMainVideoSource: "c83"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC84

        mTextBeforeChoosing: "Rocco Siffredi"
        mTitle: "Rocco Siffredi"
        mQuestion: ""

        mMainVideoSource: "c84"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
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
