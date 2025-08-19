import QtQuick
import Felgo
import "../../BasicImageSourceHover/v2"
import "../../BasicDebug/v1"

Item {

    id: mThisBVSPS

    /////////////////////////////////////////////////////////////
    // BasicDebugRectangle {visible: true}
    /////////////////////////////////////////////////////////////

    property int mNbSlotsImages: 5
    property int mNbIntervals: mNbSlotsImages
    property real mWidthPctWished: (1 - mNbIntervals * cBasicVideo.sps_Interval) / mNbSlotsImages
    property real mW0: Math.min(mWidthPctWished * width, 2 * height * (1 - cBasicVideo.sps_TOP_to_BOTTOM))
    property real mH0: mW0
    property real mI0: (width - mNbSlotsImages * mW0) / mNbIntervals
    property real mY0: (height * cBasicVideo.sps_TOP_to_BOTTOM - mH0 / 2)

    x: parent.width * cBasicVideo.sps_X
    y: (parent.height - height) / 2
    width: parent.width * cBasicVideo.sps_W
    height: parent.height * cBasicVideo.sps_H

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mImagePause, mImagePlay, mImageStop, mImageSound, mImageSoundMute]
    }

    /*
      When we show the bar (of move away)
      */
    onVisibleChanged: {
        mSoundBar.visible = false
    }

    /*
      */
    MouseArea {
        id: mThisMouseAreaMain

        anchors.fill: parent
        hoverEnabled: true

        onExited: {
            if (!mThisSoundControl.mIsInside) {
                mSoundBar.visible = false
            }
        }

    }

    /*
      Pause/Start
      */
    Item {
        id: mThisPauseStart

        x: mThisBVSPS.mI0
        width: mThisBVSPS.mW0
        height: mThisBVSPS.mH0
        y: mThisBVSPS.mY0

        /**
            Pause
          */
        BasicImageSourceHover {
            id: mImagePause

            anchors.fill: parent

            sourceSimpleMain: "librairies_basic/BasicVideo/" + "pause.png"
            sourceSimpleHover: "librairies_basic/BasicVideo/" + "pause_hover.png"

            onClicked: {
                mThisBasicVideo.pause()
                mImagePause.visible = false
            }
        }

        /**
          Play
          */
        BasicImageSourceHover {
            id: mImagePlay

            visible: !mImagePause.visible
            anchors.fill: parent

            sourceSimpleMain: "librairies_basic/BasicVideo/" + "play.png"
            sourceSimpleHover: "librairies_basic/BasicVideo/" + "play_hover.png"

            onClicked: {
                mThisBVSPS
                mImagePause.visible = true
                mThisBasicVideo.play()
            }
        }
    }


    /**
      Stop
      */
    BasicImageSourceHover {
        id: mImageStop

        x: mThisPauseStart.x + mThisPauseStart.width + mThisBVSPS.mI0
        width: mThisBVSPS.mW0
        height: mThisBVSPS.mH0
        y: mThisBVSPS.mY0

        sourceSimpleMain: "librairies_basic/BasicVideo/" + "next.png"
        sourceSimpleHover: "librairies_basic/BasicVideo/" + "next_hover.png"

        onClicked: {
            mThisBVSPS
            mImagePause.visible = true
            mThisBasicVideo.stopVideo()
        }
    }


    /*
      Sound
      */
    Item {
        id: mThisSoundControl

        x: mImageStop.x + mImageStop.width + mThisBVSPS.mI0
        width: mThisBVSPS.mW0
        height: mThisBVSPS.mH0
        y: mThisBVSPS.mY0
        z: 1

        property bool mIsInside
        property real mSoundCursorBeforeMute: mThisSoundCursor.x0

        /*
          Sound level
          */
        BasicImageSourceHover {
            id: mImageSound

            anchors.fill: parent

            sourceSimpleMain: "librairies_basic/BasicVideo/" + "sound.png"
            sourceSimpleHover: "librairies_basic/BasicVideo/" + "sound_hover.png"

            onClicked: {
                mThisSoundControl.showSoundOrMute(false);
                mThisSoundControl.mSoundCursorBeforeMute = mThisSoundCursor.x
                mThisSoundCursor.x = 0
            }
            onEntered: {
                mThisSoundControl.mIsInside = true
                mSoundBar.visible = true
            }
            onExited: {
                mThisSoundControl.mIsInside = false
            }
        }

        /*
          Mute
          */
        BasicImageSourceHover {
            id: mImageSoundMute

            anchors.fill: parent

            sourceSimpleMain: "librairies_basic/BasicVideo/" + "mute.png"
            sourceSimpleHover: "librairies_basic/BasicVideo/" + "mute_hover.png"

            onEntered: {
                mThisSoundControl.mIsInside = true
                mSoundBar.visible = true
            }
            onExited: {
                mThisSoundControl.mIsInside = false
            }
            onClicked: {
                mThisSoundControl.showSoundOrMute(true);
                mThisSoundCursor.x = mThisSoundControl.mSoundCursorBeforeMute
            }
        }

        /**
          sound and mute cannot be shown together - we select one or another
          */
        function showSoundOrMute(sIsShowSoundOrMute) {
            mImageSound.visible = sIsShowSoundOrMute
            mImageSoundMute.visible = !sIsShowSoundOrMute
        }
    }

    /*
      Sound bar
      */
    Rectangle {
        id: mSoundBar

        x: mThisSoundControl.x + mImageStop.width + mThisBVSPS.mI0 / 2
        y: mThisSoundControl.y + mThisSoundControl.height / 2 - height / 2
        width: 2 * mThisBVSPS.mW0
        height: width * cBasicVideo.sps_H_SOUND_BAR
        radius: height / 2

        color: cBasicVideo.sps_COLOR_SOUND_BAR

        /*
          The round control to modify the sound volume
          */
        Rectangle {
            id: mThisSoundCursor

            property real x0: mSoundBar.width - width //  - width / 2

            height: mSoundBar.height * cBasicVideo.sps_H_SOUND_CURSOR
            width: height
            radius: width
            y: mSoundBar.height / 2 - height / 2
            x: x0
            color: cBasicVideo.sps_COLOR_SOUND_ACTIVE_BAR

            /**
              Allow to move the sound cursor
              */
            MouseArea {
                anchors.fill: parent
                drag.target: mThisSoundCursor
                drag.axis: Drag.XAxis
                drag.minimumX: 0 // -mThisSoundCursor.width / 2
                drag.maximumX: mThisSoundCursor.x0
            }

            onXChanged: {
                mThisBVSPS.setmVolume(x / x0)
                mThisSoundControl.showSoundOrMute(x > 0);
            }
        }

        /*
          The bar of the sound active
          */
        Rectangle {
            id: mThisSoundBarActive

            height: parent.height
            width: mThisSoundCursor.x + mThisSoundCursor.width / 2
            radius: height / 2
            color: cBasicVideo.sps_COLOR_SOUND_ACTIVE_BAR
        }
    }

    /*
      Getters & Setters
      */
    function getmVolume() {
        return parent.getmVolume()
    }
    function setmVolume(sVolume) {
        parent.setmVolume(sVolume)
    }
    function getmY_Mid_SoundBar() {
        return mSoundBar.y + mSoundBar.height / 2;
    }

}
