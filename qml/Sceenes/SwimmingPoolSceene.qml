import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {

    id: iSwimmingPool

    anchors.fill: parent

    function meridaSuperGlueOn() {
        sceeneC40.hide()
        sceeneC05.makeAccessible()
    }
    function meridaSuperGlueOff() {
        sceeneC40.makeAccessible()
    }

    function getSceene() {
        return [sceeneC40, sceeneC05]
    }

    function resetGame(){
        sceeneC57.hide()
        sceeneC40.makeAccessible()
    }


    CHsChoice {
        id: sceeneC40

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
    }
    CHsChoice {
        id: sceeneC41

        mIsDebug: true

        mTextBeforeChoosing: qsTr("")
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
        id: sceeneC42

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Lie down")
        mTitle: qsTr("Lie down ")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC48
        mListChoices: [sceeneC47, sceeneC48, sceeneC49, sceeneC50]
    }
    CHsChoice {
        id: sceeneC43

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Say hello")
        mTitle: qsTr("Hello")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC44

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Propose a drink")
        mTitle: qsTr("drink")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC45

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Compliment")
        mTitle: qsTr("Compliment")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC46

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
    CHsChoice {
        id: sceeneC47

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Wait 1 minute")
        mTitle: qsTr("Waiting")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC52
        mListChoices: [sceeneC52, sceeneC53, sceeneC54, sceeneC56, sceeneC57]
    }
    CHsChoice {
        id: sceeneC48

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Say hello")
        mTitle: qsTr("Hello 2")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC49

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Propose a drink")
        mTitle: qsTr("drink 2")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC50

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Compliment")
        mTitle: qsTr("Compliment 2")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC52

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Say hello")
        mTitle: qsTr("Hello 3")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC53

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Propose a drink")
        mTitle: qsTr("drink 3")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC54

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Compliment")
        mTitle: qsTr("Compliment 3")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneS05
        mListChoices: []
        mListUnlocks: [sceeneC57]
    }
    CHsChoice {
        id: sceeneC56

        mIsDebug: true

        mTextBeforeChoosing: qsTr("Kiss her")
        mTitle: qsTr("Kissing her 2")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneS05
        mListChoices: []
        mListUnlocks: [sceeneC57]
    }
    CHsChoice {
        id: sceeneC57

        mIsDebug: true

        mStatus: mStatusEnum.HIDDEN
        mTextBeforeChoosing: qsTr("Offer money")
        mTitle: qsTr("Money Money")
        mQuestion: qsTr("How much do you want to pay?")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 10000
        mVideoVolume: 0
        mDefaultChoice: sceeneC58
        mListChoices: [sceeneC58, sceeneC59, sceeneC60S06]
    }
    CHgSexVideo {
        id: sceeneS05


        mIsDebug: true

        mNextVideo: sceeneHall

        mTitle: "Lollypop sex"

        mSourceSimple: ""
        mListSourcesImagesToJumpTo: []
    }

    CHsChoice {
        id: sceeneC58

        mIsDebug: true

        mTextBeforeChoosing: qsTr("200 USD")
        mTitle: qsTr("200 USD")
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
        id: sceeneC59

        mIsDebug: true

        mTextBeforeChoosing: qsTr("400 USD")
        mTitle: qsTr("400 USD")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneC41
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC60S06

        mIsDebug: true

        mTextBeforeChoosing: qsTr("800 USD")
        mTitle: qsTr("800 USD")
        mQuestion: qsTr("")

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneS06
        mListChoices: []
    }

    CHgSexVideo {
        id: sceeneS06


        mIsDebug: true

        mNextVideo: sceeneHall

        mTitle: "Lollypop sex anal"

        mSourceSimple: ""
        mListSourcesImagesToJumpTo: []
    }
}
