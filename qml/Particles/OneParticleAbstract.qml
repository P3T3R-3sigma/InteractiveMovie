import QtQuick
import Felgo
import QtQuick.Particles

Rectangle {

    id: mThis

    /*
      Controls
      */
    property string mTitle: ""
    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent
    /*
      Variables
      */
    property bool mIsZoom


    color: "grey" // "lightyellow"
    x: parent.width * xPercent
    y: parent.height * yPercent
    width: parent.width * widthPercent
    height: parent.height * heightPercent

    /*
      Declare
      */
    Component.onCompleted: {
        mParticleManager.declareNewParticle(mThis)
    }

    /*
      */
    AppText {
        id: pAppText

        height: parent.height * 0.10
        text: mTitle
        width: parent.width
    }

    /*
      The particle system is used to control the start/pause/resume
      */
    ParticleSystem {
        id: pParticleSystem
    }


    function getpParticleSystem() {
        return pParticleSystem;
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (mIsZoom) {
                mGameWindow.showGlobal();
            } else {
                mGameWindow.showSpecific(mThis)
            }
            mIsZoom = !mIsZoom
        }
    }

    function pause() {
        pParticleSystem.running = false
    }

    function start() {
        pParticleSystem.running = true
    }














}
