import QtQuick
import Felgo

import "../../basic_librairies/BasicVideo/v1"
import "../Choice"
import "../BackGround"

Item {


    CHsChoiceManager {
        id: sceeneIntro

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC00

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: [sceeneC04, sceeneC03S01]
    }

    CHsChoiceManager {
        id: sceeneC01

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC02

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC04

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC03S01

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHgSexVideo {
        id: sceeneS01


        mNextVideo: ch0

        mSourceSimple: "VideoReduite.mp4"


        mListSourcesImagesToJumpTo: [
            // "start_LABEL_Start_MMSS_0000.jpg",
            "JomereLesbi_LABEL_The each_MMSS_0041.jpg",
            "JomereLesbi_Gun_LABEL_Gun down_MMSS_0115.jpg",
            "JomereLesbi_Cunni_LABEL_Cuni_MMSS_0150.jpg",
            "JomereLesbi_Cunni_Doggy_LABEL_Doggy_MMSS_0439.jpg",
            // "end_LABEL_End_MMSS_9999.jpg",
        ]
    }

    CHsChoiceManager {
        id: sceeneC05

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC06

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC07

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC08

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: [sceeneC09, sceeneC10, sceeneC11, sceeneC12]
    }

    CHsChoiceManager {
        id: sceeneC09

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC10

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneBackToHall

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC11

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC12

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC13S02

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneS02

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneC14S03

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

    CHsChoiceManager {
        id: sceeneS03

        mStatus: mStatusEnum.ACCESSIBLE
        mTerminateAfterPlay: false

        mTextBeforeChoosing: ""
        mTitle: ""
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: []
    }

}
