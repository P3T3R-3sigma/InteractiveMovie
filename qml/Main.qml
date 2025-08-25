import Felgo
import QtQuick
import QtMultimedia

import "abstract"
import "basic_librairies/Utils/v1"
import "basic_librairies/BasicItem/v3"
import "basic_librairies/BasicGlobalFollower/v2"
import "basic_librairies/BasicImage/v3"
import "basic_librairies/BasicImageSource/v4"
import "basic_librairies/BasicImageHover/v1"
import "basic_librairies/BasicImageMulti/v1"
import "basic_librairies/BasicLoader/v1"
import "basic_librairies/BasicVideo/v1"
import "basic_librairies/BasicVideoSource/v1"
import "basic_librairies/BasicText/v4"
import "basic_librairies/BasicSprites/v3"
import "basic_librairies/BasicReflection/v3"
import "basic_librairies/BasicScroll/v2"
import "basic_librairies/BasicSubWindow/v3"
import "basic_librairies/BasicDebug/v1"
import "Choice/BackGround"
import "Choice"






GameWindow {
    id: iGameWindow

    BasicConst {
        id: mBasicConst
    }

    BasicList {
        id: mBasicList
    }
    BasicNum {
        id: mBasicNum
    }
    BasicDisplay {
        id: mBasicDisplay
    }
    BasicSource {
        id: mBasicSource
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicLoaderManager {
        id: mBasicLoaderManager
    }
    BasicVideoConstants {
        id: cBasicVideo
    }
    BasicSpriteManager {
        id: mBasicSpriteManager
    }
    BasicReflection {
        id: mBasicReflection
    }

    /*
      Constants
      */
    CHc {
        id: mCHc
    }

    CHsChoice {
        id: ch0
        mTitle: qsTr("Title 0")
        mQuestion: qsTr("question 0")

        mDisplay: mDisplayEnum.DEBUG
        mTerminateAfterPlay: true
        mTextBeforeChoosing: ""
        mMainVideoSource: "Videos/VideoReduite.mp4"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: "Angel/Angel_001.jpg"
        mTime: 400000
        mDefaultChoice: null
        mListChoices: [ch1, ch2, ch3, ch4]
    }

    CHgSexVideo {
        id: iSexVideo

        mNextVideo: ch0

        mIsDebug: false

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


    CHsChoice {
        id: ch1
        mTitle: qsTr("Title 1")
        mQuestion: qsTr("question 1")
        mDisplay: mDisplayEnum.DEBUG

        mTextBeforeChoosing: qsTr("Choice 1, Choice 1, Choice 1, Choice 1, Choice1, Choice 1, Choice 1, Choice")
        mMainVideoSource: "Videos/VideoReduite.mp4"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: "Angel/Angel_001.jpg"
        mTime: 10000
        mDefaultChoice: null
        mListChoices: [ch2, ch3]
        Component.onCompleted: {
            ch1.hide()
        }
    }
    CHsChoice {
        id: ch2
        mTitle: qsTr("Title 2")
        mQuestion: qsTr("question 2")

        mDisplay: mDisplayEnum.DEBUG
        mTextIfLocked: qsTr("Locked 2")
        mTextBeforeChoosing: qsTr("Choice 2")
        mMainVideoSource: "Videos/VideoReduite.mp4"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: "Angel/Angel_001.jpg"
        mTime: 10
        mDefaultChoice: iSexVideo
        mListChoices: []
        Component.onCompleted: {
            ch2.lock()
        }
    }

    CHsChoice {
        id: ch3
        mTitle: qsTr("Title 3")
        mQuestion: qsTr("question 3")
        mDisplay: mDisplayEnum.DEBUG

        mTextBeforeChoosing: qsTr("Choice 3")
        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: "Angel/Angel_001.jpg"
        mTime: 10000
        mDefaultChoice: null
        mListChoices: []
        Component.onCompleted: {
            ch3.terminate()
        }
    }
    CHsChoice {
        id: ch4
        mTitle: qsTr("Title 4")
        mQuestion: qsTr("question 4")
        mDisplay: mDisplayEnum.DEBUG

        mTextBeforeChoosing: qsTr("Choice 4")
        mMainVideoSource: "Videos/VideoReduite.mp4"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: "Angel/Angel_001.jpg"
        mTime: 10000
        mDefaultChoice: ch2
        mListChoices: [ch1, ch2]
        onVisibleChanged:  {
            ch2.makeAccessible()
            shadow_getChoices()
        }
    }

    AppButton {
        id: downloadButtton
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: width * 0.70
        y: parent.height - height * 1.5
        z: 20
        text: "Download sources"
        onClicked: {
            console.log("------- launch loader -----------")
            /*
              Set sources
              */

            /*
              Start loaded
              */
            mBasicLoaderManager.startCheck(iGameWindow , "loadedSuccess");
        }
    }


    function loadedSuccess() {
        console.log("Loaded successfully all choices")
        ch0.visible = true
        downloadButtton.visible = false
        /*
          Communication
          */
        mBasicLoaderManager.toConsole();
    }


    function getmListItemToCheckIfLoaded() {
        return [ch0];
    }

}
