import QtQuick
import Felgo
import QtMultimedia

import "basic_librairies/BasicLoader/v1"

BasicLoaderManager {
    id: iVideoWhileChoice

    visible: false

    VideoOutput {
        id: iVideoWhileChoiceVideoOutput

        fillMode: VideoOutput.PreserveAspectFit
        anchors.fill: parent

    }

    MediaPlayer {
        id: iVideoWhileChoiceVideoMediaPlayer

        source: mBasicSource.getSource(pVideoWhileChoiceSource)
        videoOutput: iVideoWhileChoiceVideoOutput
        audioOutput: AudioOutput {
            volume: pVolume
        }

        onPlaybackStateChanged: {
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                iVideoWhileChoiceVideoMediaPlayer.play()
            }
        }
    }
    onVisibleChanged: {
        if (visible) {
            iVideoWhileChoiceVideoMediaPlayer.play()
        } else {
          iVideoWhileChoiceVideoMediaPlayer.stop()
        }
    }
}
