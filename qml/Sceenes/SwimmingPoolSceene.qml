import QtQuick
import Felgo

import "../Choice"
import "../Choice/BackGround"

Item {

    id: iSwimmingPool

    anchors.fill: parent

    function meridaSuperGlueOn() {
        if (sceeneC40.mStatus === sceeneC40.mStatusEnum.TERMINATED) {
        } else {
            sceeneC40.hide()
        }
        sceeneC57.hide()
        sceeneC05.makeAccessible()
    }
    function meridaSuperGlueOff() {

        if (sceeneC40.mStatus === sceeneC40.mStatusEnum.TERMINATED) {
            sceeneC57.makeAccessible()
        } else {
            sceeneC40.makeAccessible()
        }
    }

    function getSceene() {
        return [sceeneC40, sceeneC05, sceeneC57]
    }

    function resetGame(){
        sceeneC57.hide()
        sceeneC40.makeAccessible()
    }


    CHsChoice {
        id: sceeneC40

        mTextBeforeChoosing: qsTr("Go to the Swimming Pool")
        mTitle: qsTr("Lollypop")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: "c40_1"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: "c40_1"
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC43
        mListChoices: [sceeneC42, sceeneC43, sceeneC44, sceeneC45, sceeneC46]
    }
    CHsChoice {
        id: sceeneC41

        mTextBeforeChoosing: qsTr("")
        mTitle: qsTr("Go away")
        mQuestion: qsTr("")

        mMainVideoSource: "c41"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC42

        mTextBeforeChoosing: qsTr("Lie down")
        mTitle: qsTr("Lie down ")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: "c42"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC48
        mListChoices: [sceeneC47, sceeneC48, sceeneC49, sceeneC50]
    }
    CHsChoice {
        id: sceeneC43

        mTextBeforeChoosing: qsTr("Say hello")
        mTitle: qsTr("Hello")
        mQuestion: qsTr("")

        mMainVideoSource: "c43"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC44

        mTextBeforeChoosing: qsTr("Propose a drink")
        mTitle: qsTr("drink")
        mQuestion: qsTr("")

        mMainVideoSource: "c44"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC45

        mTextBeforeChoosing: qsTr("Compliment")
        mTitle: qsTr("Compliment")
        mQuestion: qsTr("")

        mMainVideoSource: "c45"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC46

        mTextBeforeChoosing: qsTr("Kiss her")
        mTitle: qsTr("Kissing her")
        mQuestion: qsTr("")

        mMainVideoSource: "c46"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC14S03
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC47

        mTextBeforeChoosing: qsTr("Wait 1 minute")
        mTitle: qsTr("Waiting")
        mQuestion: qsTr("What do you want to do?")

        mMainVideoSource: "c47"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC52
        mListChoices: [sceeneC52, sceeneC53, sceeneC54S05, sceeneC56S05, sceeneC57]
    }
    CHsChoice {
        id: sceeneC48

        mTextBeforeChoosing: qsTr("Say hello")
        mTitle: qsTr("Hello 2")
        mQuestion: qsTr("")

        mMainVideoSource: "c52"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC49

        mTextBeforeChoosing: qsTr("Propose a drink")
        mTitle: qsTr("drink 2")
        mQuestion: qsTr("")

        mMainVideoSource: "c49"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC50

        mTextBeforeChoosing: qsTr("Compliment")
        mTitle: qsTr("Compliment 2")
        mQuestion: qsTr("")

        mMainVideoSource: "c50"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC52

        mTextBeforeChoosing: qsTr("Say hello")
        mTitle: qsTr("Hello 3")
        mQuestion: qsTr("")

        mMainVideoSource: "c52"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC53

        mTextBeforeChoosing: qsTr("Propose a drink")
        mTitle: qsTr("drink 3")
        mQuestion: qsTr("")

        mMainVideoSource: "c53"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC54S05

        mTextBeforeChoosing: qsTr("Compliment")
        mTitle: qsTr("Compliment 3")
        mQuestion: qsTr("")

        mMainVideoSource: "c54"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneS05
        mListChoices: []
        mListUnlocks: [sceeneC57]
        mListTerminates: [sceeneC40]
    }
    CHsChoice {
        id: sceeneC56S05

        mTextBeforeChoosing: qsTr("Kiss her")
        mTitle: qsTr("Kissing her 2")
        mQuestion: qsTr("")

        mMainVideoSource: "c56"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneS05
        mListChoices: []
        mListUnlocks: [sceeneC57]
        mListTerminates: [sceeneC40]
    }
    CHsChoice {
        id: sceeneC57

        mStatus: mStatusEnum.HIDDEN
        mTextBeforeChoosing: qsTr("Offer money to Lollypop")
        mTitle: qsTr("Money Money")
        mQuestion: qsTr("How much do you want to pay?")

        mMainVideoSource: "c57"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mIsTimer: true
        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC59
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

        mTextBeforeChoosing: qsTr("200 USD")
        mTitle: qsTr("200 USD")
        mQuestion: qsTr("")

        mMainVideoSource: "c58"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneC14S03
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC59

        mTextBeforeChoosing: qsTr("400 USD")
        mTitle: qsTr("400 USD")
        mQuestion: qsTr("")

        mMainVideoSource: "c59"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC60S06

        mTextBeforeChoosing: qsTr("2000 USD")
        mTitle: qsTr("2000 USD")
        mQuestion: qsTr("")

        mMainVideoSource: "c60"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
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
