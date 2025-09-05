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
import "Particles"






GameWindow {
    id: mGameWindow

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

    ParticlesManager {
        id: mParticleManager
    }

    property bool mMeridaSuperglue: false
    property int mVolumeOverall: 50
    property bool mDebugOverall: true
    property bool mParticleOverall: true
    property bool mShowIntro: false
    property var mCurrentSceene

    Rectangle {
        id: iSplashForDebug
        visible: mDebugOverall
        y: parent.height * 0.2
        width: parent.width
        height: parent.height * 0.4
        color: "black"
        z: 2
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Text {
                    id: baseTimeText
                    text: "The number of seconds added to the timer regardless of the number of choices. (current: " + mCHc.cBaseTime/1000 + ")"
                    font.pixelSize: 40
                    color: "white"
                }

                Rectangle {
                    width: 100; height: 66
                    color: "lightgray"
                    border.color: "black"

                    TextInput {
                        id: baseTimeInput
                        anchors.fill: parent
                        anchors.margins: 10
                        font.pixelSize: 36
                        focus: true
                        inputMethodHints: Qt.ImhDigitsOnly
                        validator: IntValidator { bottom: 1; top: 20 }  // Adjust range as needed
                        onTextChanged: {
                            if (text !== "" && (parseInt(text) < 1 || parseInt(text) > 20)) {
                                text = ""
                            }
                        }
                    }
                }
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Text {
                    id: perChoiceText
                    text: "The number of seconds added to the timer for every choice. (current: " + mCHc.cAdditionalTime/1000 + ")"
                    font.pixelSize: 40
                    color: "white"
                }

                Rectangle {
                    width: 100; height: 66
                    color: "lightgray"
                    border.color: "black"

                    TextInput {
                        id: perChoiceInput
                        anchors.fill: parent
                        anchors.margins: 10
                        font.pixelSize: 36
                        focus: true
                        inputMethodHints: Qt.ImhDigitsOnly
                        validator: IntValidator { bottom: 0; top: 10 }  // Adjust range as needed
                        onTextChanged: {
                            if (text !== "" && (parseInt(text) <= 0 || parseInt(text) > 10)) {
                                text = ""
                            }
                        }
                    }
                }
            }
            AppButton {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Set timer")
                onClicked: {
                    if (perChoiceInput.text) {
                        mCHc.cAdditionalTime = perChoiceInput.text * 1000
                    }
                    if (baseTimeInput.text) {
                        mCHc.cBaseTime = baseTimeInput.text * 1000
                    }
                }
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Text {
                    id: iParticleOnOffText
                    text: "Turn " + (mParticleOverall ? "off" : "on") + " the particles: "
                    font.pixelSize: 40
                    color: "white"
                }

                Rectangle {
                    width: 50; height: 50
                    color: mParticleOverall ? "green" : "black"
                    border.color: "lightgray"
                    border.width: 5

                    MouseArea {
                        anchors.fill: parent

                        onClicked: mParticleOverall = !mParticleOverall
                    }
                }
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Text {
                    id: iShowIntro
                    text: "Show Intro scene: "
                    font.pixelSize: 40
                    color: "white"
                }

                Rectangle {
                    width: 50; height: 50
                    color: mShowIntro ? "green" : "black"
                    border.color: "lightgray"
                    border.width: 5

                    MouseArea {
                        anchors.fill: parent

                        onClicked: mShowIntro = !mShowIntro
                    }
                }
            }
        }
    }


    MoveMouseParticle {
        id: iMoveMouseParticle
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onPositionChanged: function(mouse) {
            // Set absolute scene position
            iMoveMouseParticle.setEmitPos(mouse.x, mouse.y)
            mParticleManager.showSpecific(iMoveMouseParticle)
        }
    }


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
        mCurrentSceene.visible = false
        mRemoveSuperGlue()
        sceeneC05.hide()
        sceeneC24.hide()
        sceeneC71.hide()
        iKitchenSceene.resetGame()
        iBedroomsceene.resetGame()
        iSwimmingPoolSceene.resetGame()
        iLibrarySceene.resetGame()
    }

    BasicVideoSource {
        id: iGlobalMusic

        mSource: "qrc:/assets/Videos/c70.mp4"
        mVolume: mVolumeOverall
    }

    CHsChoice {
        id: sceeneIntro

        mStatus: mStatusEnum.ACCESSIBLE

        mIsDebug: !mShowIntro

        mTextBeforeChoosing: "Go back to hall"
        mTitle: "Intro"
        mQuestion: ""

        mMainVideoSource: mShowIntro ? "Intro" : ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []


        //////////////////////////////////
        // BasicDebugRectangle {visible: true; color: "blue"; anchors.fill: parent}
        //////////////////////////////////
    }

    CHsChoice {
        id: sceeneHall



        mDisplay: mDisplayEnum.IMAGE

        mTextBeforeChoosing: "Go back to hall"
        mTitle: "HALL"
        mQuestion: "Where to go?"

        mMainVideoSource: ""
        mSecondaryVideoSource: ""
        mSecondaryImageSource: "c80"
        mIsTimer: true
        mVideoVolume: mVolumeOverall
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

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC71

        mStatus: mStatusEnum.HIDDEN
        mTextBeforeChoosing: "Go to the Library"
        mTitle: "Milena Superglue"
        mQuestion: ""

        mMainVideoSource: "c71"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }
    CHsChoice {
        id: sceeneC24

        mStatus: mStatusEnum.HIDDEN

        mTextBeforeChoosing: qsTr("Go to the Bedroom")
        mTitle: qsTr("Amber Superglue")

        mMainVideoSource: "c24"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneHall
        mListChoices: []
    }

    CHsChoice {
        id: sceeneC14S03

        mTextBeforeChoosing: ""
        mTitle: "Revenge"
        mQuestion: ""

        mMainVideoSource: "c14"
        mSecondaryVideoSource: ""
        mSecondaryImageSource: ""

        mVideoVolume: mVolumeOverall
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

        mVideoVolume: mVolumeOverall
        mDefaultChoice: sceeneIntro
        mListChoices: []
        mFunctionToCall: restartGame
    }

    AppButton {
        id: downloadButtton
        visible: true
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: width * 0.70
        y: parent.height - height * 1.5
        z: 2
        text: "Start Game"
        onClicked: {
            console.log("------- launch loader -----------")
            /*
              Set sources
              */

            /*
              Start loaded
              */
            sceeneIntro.setSource()

            mBasicLoaderManager.startCheck(mGameWindow , "loadedSuccess");
        }
    }
    AppButton {
        id: restartButton
        visible: false
        width: parent.width * 0.15
        height: parent.height * 0.1
        x: parent.width * 0.05
        y: parent.height * 0.05
        z: 2
        text: "Restart Game"
        onClicked: {
            mCurrentSceene.visible = false
            iSplashForDebug.visible = mDebugOverall
            downloadButtton.visible = true
            restartButton.visible = false
            restartGame()
        }
    }


    function loadedSuccess() {
        console.log("Loaded successfully all choices")
        sceeneIntro .visible = true
        downloadButtton.visible = false
        iSplashForDebug.visible = false
        restartButton.visible = true
        /*
          Communication
          */
        mBasicLoaderManager.toConsole();
    }


    function getmListItemToCheckIfLoaded() {
        return [];
    }

}
