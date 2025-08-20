import QtQuick
import Felgo
import QtMultimedia

import "basic_librairies/BasicLoader/v1"


BasicLoaderManager {
    id: iVideoBeforeChoice

    visible: false

    property var pVideoNext
    property var pImageNext

    VideoOutput {
        id: iVideoBeforeChoiceVideoOutput

        fillMode: VideoOutput.PreserveAspectFit
        anchors.fill: parent

    }

    MediaPlayer {
        id: iVideoBeforeChoiceVideoMediaPlayer

        source: mBasicSource.getSource(pVideoBeforeChoiceSource)
        videoOutput: iVideoBeforeChoiceVideoOutput
        audioOutput: AudioOutput {
            volume: pVolume
        }

        onPlaybackStateChanged: {
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                iVideoBeforeChoice.visible = false
                if (pVideoWhileChoiceSource) {
                    pVideoNext.visible = true
                } else if (pImageWhileChoiceSource) {
                    pImageNext.visible = true
                } else {
                    mBasicDisplay.error(iVideoBeforeChoice, "No image or video for choice.")
                }
                mCHgChoices.visible = true
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            iVideoBeforeChoice.visible = false
            if (pVideoWhileChoiceSource) {
                pVideoNext.visible = true
            } else if (pImageWhileChoiceSource) {
                pImageNext.visible = true
            } else {
                mBasicDisplay.error(iVideoBeforeChoice, "No image or video for choice.")
            }
            mCHgChoices.visible = true
        }
    }
    onVisibleChanged: {
        if (visible) {
            if (pVideoBeforeChoiceSource) {
                iVideoBeforeChoiceVideoMediaPlayer.play()
            } else if (pVideoWhileChoiceSource) {
                iVideoBeforeChoice.visible = false
                pVideoNext.visible = true
                mCHgChoices.visible = true
            } else if (pImageWhileChoiceSource) {
                iVideoBeforeChoice.visible = false
                pImageNext.visible = true
                mCHgChoices.visible = true
            } else {
                mBasicDisplay.error(iVideoBeforeChoice, "No image or video for choice.")
            }
        } else {
            iVideoBeforeChoiceVideoMediaPlayer.stop()
        }
    }
}
