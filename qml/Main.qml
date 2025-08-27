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
import "Choice/Choices"
import "Choice"
import "Sceenes"






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

    property bool mMeridaSuperglue: false

    function mSetSuperGlue() {
        mMeridaSuperglue = true
        iSwimmingPoolSceene.meridaSuperGlueOn()
        iBedroomsceene.meridaSuperGlueOn()
        iLibrarySceene.meridaSuperGlueOn()
    }
    function mRemoveSuperGlue() {
        mMeridaSuperglue = false
        iSwimmingPoolSceene.meridaSuperGlueOff()
        iBedroomsceene.meridaSuperGlueOff()
        iLibrarySceene.meridaSuperGlueOff()
    }
    function restartGame() {
        sceeneC05.hide()
        sceeneC06.hide()
        sceeneC07.hide()
        iKitchenSceene.resetGame()
        iBedroomsceene.resetGame()
        iSwimmingPoolSceene.resetGame()
        iLibrarySceene.resetGame()

    }

    CHsChoice {
        id: sceeneIntro

        mStatus: mStatusEnum.ACCESSIBLE

        mIsDebug: true

        mTextBeforeChoosing: "Go back to hall"
        mTitle: "Intro"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneHall
        mListChoices: []


        //////////////////////////////////
        // BasicDebugRectangle {visible: true; color: "blue"; anchors.fill: parent}
        //////////////////////////////////
    }

    CHsChoice {
        id: sceeneHall



        mDisplay: mDisplayEnum.IMAGE
        mIsDebug: true

        mTextBeforeChoosing: "Go back to hall"
        mTitle: "HALL"
        mQuestion: "Where to go?"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: null
        mListChoices: [...iKitchenSceene.getSceene(), ...iBedroomsceene.getSceene(), ...iSwimmingPoolSceene.getSceene(), ...iLibrarySceene.getSceene()]


        //////////////////////////////////
        // BasicDebugRectangle {visible: true; color: "blue"; anchors.fill: parent}
        //////////////////////////////////
    }


    KitchenSceene {
        id: iKitchenSceene
    }
    BedroomSceene {
        id: iBedroomsceene
    }
    SwimmingPoolSceene {
        id: iSwimmingPoolSceene
    }
    LibrarySceene {
        id: iLibrarySceene
    }


    CHsChoice {
        id: sceeneC05

        mIsDebug: true

        mStatus: mStatusEnum.HIDDEN
        mTextBeforeChoosing: "Go to the Swimming Pool"
        mTitle: "Swimming pool Superglue"
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
        id: sceeneC06

        mStatus: mStatusEnum.HIDDEN
        mIsDebug: true

        mTextBeforeChoosing: "Go to the Library"
        mTitle: "Library Superglue"
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
        id: sceeneC07

        mIsDebug: true
        mDebugMessage: "sceeneC07"

        mStatus: mStatusEnum.HIDDEN
        mTextBeforeChoosing: "Go to the Bedroom"
        mTitle: "Bedroom Superglue"
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
        id: sceeneC14S03



        mIsDebug: true

        mTextBeforeChoosing: ""
        mTitle: "Revenge"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneS03
        mListChoices: []
    }
    CHgSexVideo {
        id: sceeneS03


        mIsDebug: true

        mNextVideo: gameOver

        mTitle: "Leya + Matthew BGA"
        mSourceSimple: ""
        mListSourcesImagesToJumpTo: []
    }
    CHsChoice {
        id: gameOver



        mIsDebug: true

        mTextBeforeChoosing: ""
        mTitle: "GameOver"
        mQuestion: ""

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""
        mTime: 0
        mVideoVolume: 0
        mDefaultChoice: sceeneIntro
        mListChoices: []
        mFunctionToCall: restartGame
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
        sceeneIntro .visible = true
        downloadButtton.visible = false
        /*
          Communication
          */
        mBasicLoaderManager.toConsole();
    }


    function getmListItemToCheckIfLoaded() {
        return [sceeneIntro];
    }

}
