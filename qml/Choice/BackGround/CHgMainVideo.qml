import QtQuick
import Felgo
import QtMultimedia
import Qt5Compat.GraphicalEffects

import "../../basic_librairies/BasicVideoSource/v1"
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicDebug/v1"

Item {
    id: iMainVideoChoice

    property bool pChoiceVisible: false
    property bool lPaused: false

    anchors.fill: parent

    BasicTextFitToText {
        id: iPlaceholderText
        text: mMainVideoSource

        visible: mDebugOverall && mMainVideoSource

        z: 1
        yPercent: 0.05
        textFontForceSizePixel: 40
        textColor: "black"
        borderColor: "Pink"
        borderWidthPercent: 0.01
    }

    BasicVideoSource {
        id: iMainVideo

        mSource: ""
        mVolume: mVideoVolume
    }

    BasicTextFitToText {
        id: iPlay
        text: "Play"

        z: 1
        yPercent: 77.5/90
        xPercent: 7/160
        textFontPixelSizePercent: 2.5/90
        textColor: "#ADADAD"
        textFont.family: "Century Gothic Pro"

        visible: iChoiceManager.opacity === 1 && lPaused && !pChoiceVisible

        MouseArea {
            anchors.fill: parent

            hoverEnabled: true
            onEntered: iPlayGlow.visible = true
            onExited: iPlayGlow.visible = false

            onClicked: {
                iMainVideo.playVideo()
                lPaused = false
            }
            onPositionChanged: function(mouse) {
                iMoveMouseParticle.setEmitPos(mouse.x + iPlay.x, mouse.y + iPlay.y)
                mParticleManager.showParticle(iMoveMouseParticle)
            }
        }
        RectangularGlow {
            id: iPlayGlow

            visible: false
            anchors.fill: parent

            glowRadius: parent.width*0.1
            color: "lightgray"
            cornerRadius: parent.width/2
            opacity: 0.8
        }
    }
    BasicTextFitToText {
        id: iPause
        text: "Pause"

        z: 1
        yPercent: 77.5/90
        xPercent: 7/160
        textFontPixelSizePercent: 2.5/90
        textColor: "#ADADAD"
        textFont.family: "Century Gothic Pro"
        visible: iChoiceManager.opacity === 1 && !lPaused && !pChoiceVisible

        MouseArea {
            anchors.fill: parent

            hoverEnabled: true
            onEntered: iPauseGlow.visible = true
            onExited: iPauseGlow.visible = false

            onClicked: {
                iMainVideo.pauseVideo()
                lPaused = true
            }
            onPositionChanged: function(mouse) {
                iMoveMouseParticle.setEmitPos(mouse.x + iPause.x, mouse.y + iPause.y)
                mParticleManager.showParticle(iMoveMouseParticle)
            }
        }

        RectangularGlow {
            id: iPauseGlow

            visible: false
            anchors.fill: parent
            opacity: 0.8

            glowRadius: parent.width*0.1
            color: "lightgray"
            cornerRadius: parent.width/2
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            lPaused = true
            skipVideo()
        }
    }

    Component.onCompleted: {
        iMainVideo.setVideoOutputScale(mPosToZoomInXPercent, mPosToZoomInYPercent, 1, 1)
        iPlaceholder.sOnClicked.connect(skipVideo)
    }

    onVisibleChanged: {
        if (visible) {
            if (mMainVideoSource) {
                iMainVideo.visible = true
                iMainVideo.startVideo()
                iTimer.start()
            }
        } else {
            iMainVideo.setVideoPosition(0)
            pChoiceVisible = false
            lPaused = false
            iMainVideo.visible = false
            iParallelAnimationZoom.stop()
            iMainVideo.setVideoOutputScale(mPosToZoomInXPercent, mPosToZoomInYPercent, 1, 1)
        }
    }

    Timer {
        id: iTimer
        interval: 400
        repeat: true
        onTriggered: {
            if (iMainVideo.getVideoPosition() > iMainVideo.getVideoDuration()-600) {
                if (mIsTimer) {
                    iMainVideo.pauseVideo()
                    showChoices()
                    iGlobalMusic.startVideo()
                    pChoiceVisible = true
                    iParallelAnimationZoom.start()
                } else {
                    startFadeOut(mDefaultChoice)
                }
                iTimer.stop()
            }
        }
    }

    ParallelAnimation {
        id: iParallelAnimationZoom

        running: false
        loops: 1
        NumberAnimation {
            id: iVideoZoomX
            target: iMainVideo.getVideoOutputScale()
            property: "xScale"
            to: 1.1
            duration: getTime()
        }
        NumberAnimation {
            id: iVideoZoomY
            target: iMainVideo.getVideoOutputScale()
            property: "yScale"
            to: 1.1
            duration: getTime()
        }
    }

    function setSource() {
        iMainVideo.mSource = "qrc:/assets/Videos/" + mMainVideoSource + ".mp4"
    }
    function getSource() {
        return iMainVideo.mSource
    }

    function skipVideo() {
        setStatusChanges()
        if (mIsTimer) {
            if (mMainVideoSource) {
                iMainVideo.setVideoPosition(iMainVideo.getVideoDuration()-500)
            } else {
                showChoices()
                iGlobalMusic.startVideo()
                iTimer.stop()
            }

        } else {
            startFadeOut(mDefaultChoice)
        }
    }


    function getmListItemToCheckIfLoaded() {
        if (mMainVideoSource) {
            return [];
        }
        return []
    }

    function getPosFromSource() {
        return parseInt(mMainVideoSource.split("_")[1])
    }
}
