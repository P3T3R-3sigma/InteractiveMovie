import QtQuick
import Felgo
import QtMultimedia
import Qt5Compat.GraphicalEffects

import "../../basic_librairies/BasicVideoSource/v1"
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicDebug/v1"
import "../Choices"

Item {
    id: iSecondaryVideoChoice

    // property bool pChoiceVisible: false
    // property bool pPhoto: false

    // anchors.fill: parent

    // visible: false

    // BasicTextFitToText {
    //     id: iPlaceholderText
    //     text: mMainVideoSource

    //     visible: mDebugOverall && mMainVideoSource

    //     z: 1
    //     yPercent: 0.05
    //     textFontForceSizePixel: 40
    //     textColor: "black"
    //     borderColor: "Pink"
    //     borderWidthPercent: 0.01
    // }

    // BasicVideoSource {
    //     id: iSecondaryVideo

    //     mSource: ""
    //     mVolume: mVideoVolume
    // }

    // BasicImageSource {
    //     id: iPlay

    //     xPercent: 0.1
    //     yPercent: 0.9
    //     widthPercent: 0.03
    //     height: width
    //     z: 1

    //     fillMode: Image.PreserveAspectFit

    //     mSource: "Images/play.png"
    //     visible: false

    //     MouseArea {
    //         anchors.fill: parent

    //         hoverEnabled: true
    //         onEntered: iPlayGlow.visible = true
    //         onExited: iPlayGlow.visible = false

    //         onClicked: {
    //             iSecondaryVideo.playVideo()
    //             iPlay.visible = false
    //             iPause.visible = !pChoiceVisible && iChoiceManager.opacity === 1
    //         }
    //     }
    //     RectangularGlow {
    //         id: iPlayGlow

    //         visible: false
    //         anchors.fill: parent

    //         glowRadius: parent.width*0.1
    //         color: "lightgray"
    //         cornerRadius: parent.width/2
    //     }
    // }
    // BasicImageSource {
    //     id: iPause

    //     xPercent: 0.1
    //     yPercent: 0.9
    //     widthPercent: 0.03
    //     height: width
    //     z: 1

    //     fillMode: Image.PreserveAspectFit

    //     mSource: "Images/pause.png"
    //     visible: !pChoiceVisible && iChoiceManager.opacity === 1

    //     MouseArea {
    //         anchors.fill: parent

    //         hoverEnabled: true
    //         onEntered: iPauseGlow.visible = true
    //         onExited: iPauseGlow.visible = false

    //         onClicked: {
    //             iSecondaryVideo.pauseVideo()
    //             iPause.visible = false
    //             iPlay.visible = !pChoiceVisible && iChoiceManager.opacity === 1
    //         }
    //     }

    //     RectangularGlow {
    //         id: iPauseGlow

    //         visible: false
    //         anchors.fill: parent

    //         glowRadius: parent.width*0.1
    //         color: "lightgray"
    //         cornerRadius: parent.width/2
    //     }
    // }

    // BasicImageSource {
    //     id: iNext

    //     xPercent: 0.15
    //     yPercent: 0.9
    //     widthPercent: 0.03
    //     height: width
    //     z: 1

    //     fillMode: Image.PreserveAspectFit

    //     mSource: "Images/next.png"
    //     visible: !pChoiceVisible && iChoiceManager.opacity === 1

    //     MouseArea {
    //         anchors.fill: parent

    //         hoverEnabled: true
    //         onEntered: iNextGlow.visible = true
    //         onExited: iNextGlow.visible = false

    //         onClicked: {
    //             iPlay.visible = false
    //             iNext.visible = false
    //             iPause.visible = false
    //             skipVideo()
    //         }
    //     }
    //     RectangularGlow {
    //         id: iNextGlow

    //         visible: false
    //         anchors.fill: parent

    //         glowRadius: parent.width*0.1
    //         color: "lightgray"
    //         cornerRadius: parent.width/2
    //     }
    // }

    // Component.onCompleted: {
    //     iSecondaryVideo.setVideoOutputScale(mPosToZoomInXPercent, mPosToZoomInYPercent, 1, 1)
    //     iPlaceholder.sOnClicked.connect(skipVideo)
    // }

    // onVisibleChanged: {
    //     if (visible) {
    //         console.log("HERE")
    //         if (mMainVideoSource) {
    //             iSecondaryVideo.visible = true
    //             iPlay.visible = false
    //             iSecondaryVideo.startVideo()
    //             iTimer.start()
    //         }
    //     } else {
    //         iSecondaryVideo.setVideoPosition(0)
    //         pChoiceVisible = false
    //         iSecondaryVideo.visible = false
    //         iParallelAnimationZoom.stop()
    //         iSecondaryVideo.setVideoOutputScale(mPosToZoomInXPercent, mPosToZoomInYPercent, 1, 1)
    //     }
    // }

    // Timer {
    //     id: iTimer
    //     interval: 400
    //     repeat: true
    //     onTriggered: {
    //         if (iSecondaryVideo.getVideoPosition() > 36000 && !pPhoto) {
    //             iSecondaryVideo.pauseVideo()
    //             pChoiceVisible = true
    //             iChoiceTimer.visible = true
    //         }

    //         if (iSecondaryVideo.getVideoPosition() > iSecondaryVideo.getVideoDuration()-600) {
    //             if (mIsTimer) {
    //                 iSecondaryVideo.pauseVideo()
    //                 showChoices()
    //                 iGlobalMusic.startVideo()
    //                 pChoiceVisible = true
    //                 iParallelAnimationZoom.start()
    //             } else {
    //                 startFadeOut(mDefaultChoice)
    //             }
    //             iTimer.stop()
    //         }
    //     }
    // }

    // Item {
    //     id: iChoiceTimer

    //     visible: false
    //     property int pTimerTime: 20000

    //     anchors.fill: parent

    //     CHgOneChoice {
    //         id: iChoice
    //         anchors.horizontalCenter: parent.horizontalCenter
    //         xPercent: 0.5-0.2203/2
    //         yPercent: 0.59336 + (0.0345 + 0.00766) * 4
    //         widthPercent: 0.2203
    //         heightPercent: 0.0345
    //         textSizePercent: 0.013

    //         pNextScene: mDefaultChoice
    //         pFunctionToDo: takePhoto
    //     }

    //     Rectangle {
    //         id: iTimerGraphic
    //         x: parent.width * (0.5 - 0.58288/2)
    //         y: parent.height * 0.82466
    //         width: parent.width * 0.58288
    //         height: parent.height * 0.00707

    //         z: iTimerGraphicBorder.z+1

    //         color: "#f3b831"
    //         radius: height/2
    //     }
    //     Rectangle {
    //         id: iTimerGraphicBorder
    //         x: parent.width * (0.5 - 0.58288/2)
    //         y: parent.height * 0.82466
    //         width: parent.width * 0.58288
    //         height: parent.height * 0.00707

    //         z: parent.z

    //         color: "#e5e5e5"
    //         radius: height/4
    //     }

    //     ParallelAnimation {
    //         id: iParallelAnimation

    //         running: false
    //         loops: 1
    //         NumberAnimation {
    //             id: iNumberAnimationWidth
    //             target: iTimerGraphic
    //             property: "width"
    //             duration: 10000

    //         }
    //         NumberAnimation {
    //             id: iNumberAnimationX
    //             target: iTimerGraphic
    //             property: "x"
    //             duration: 10000

    //         }
    //         onFinished: {
    //             pPhoto = true
    //             iSecondaryVideo.setVideoPosition(60000)
    //         }
    //     }


    //     onVisibleChanged: {
    //         if (visible) {
    //             startTimer()
    //         } else {
    //             stopTimer()
    //         }
    //     }

    //     function startTimer() {
    //         iNumberAnimationWidth.duration = pTimerTime
    //         iNumberAnimationWidth.to = 0
    //         iNumberAnimationX.duration = pTimerTime
    //         iParallelAnimation.running = true
    //     }
    //     function stopTimer() {
    //         iParallelAnimation.running = false
    //         iTimerGraphic.width = parent.width * 0.58288
    //         iTimerGraphic.x = parent.width * 0.5 - 0.58288/2
    //     }
    //     function pauseTimer() {
    //         iParallelAnimation.running = false
    //     }
    // }

    // function takePhoto() {
    //     iChoiceTimer.stopTimer()
    //     iSecondaryVideo.playVideo()
    // }


    // ParallelAnimation {
    //     id: iParallelAnimationZoom

    //     running: false
    //     loops: 1
    //     NumberAnimation {
    //         id: iVideoZoomX
    //         target: iSecondaryVideo.getVideoOutputScale()
    //         property: "xScale"
    //         to: 1.1
    //         duration: getTime()
    //     }
    //     NumberAnimation {
    //         id: iVideoZoomY
    //         target: iSecondaryVideo.getVideoOutputScale()
    //         property: "yScale"
    //         to: 1.1
    //         duration: getTime()
    //     }
    // }

    // function setSource() {
    //     iSecondaryVideo.mSource = "qrc:/assets/Videos/" + mMainVideoSource + ".mp4"
    // }
    // function getSource() {
    //     return iSecondaryVideo.mSource
    // }

    // function skipVideo() {
    //     setStatusChanges()
    //     if (mIsTimer) {
    //         if (mMainVideoSource) {
    //             iSecondaryVideo.setVideoPosition(iSecondaryVideo.getVideoDuration()-500)
    //         } else {
    //             showChoices()
    //             iGlobalMusic.startVideo()
    //             iTimer.stop()
    //         }

    //     } else {
    //         startFadeOut(mDefaultChoice)
    //     }
    // }


    // function getmListItemToCheckIfLoaded() {
    //     if (mMainVideoSource) {
    //         return [];
    //     }
    //     return []
    // }

    // function getPosFromSource() {
    //     return parseInt(mMainVideoSource.split("_")[1])
    // }
}
