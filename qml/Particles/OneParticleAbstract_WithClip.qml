import QtQuick
import Felgo
import QtQuick.Particles

Rectangle {

    id: mThis

    /*
      Controls
      */
    property string mTitle: ""
    property real xPercent: 0
    property real yPercent: 0
    property real widthPercent: 1
    property real heightPercent: 1
    /*
      Variables
      */
    property bool mIsZoom

    z: 100

    color: "transparent" // "lightyellow"
    x: parent.width * xPercent
    y: parent.height * yPercent
    width: parent.width * widthPercent
    height: parent.height * heightPercent

    clip: true // will impose the particles to stay in the rectangle // bas performance

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

    function pause() {
        pParticleSystem.running = false
    }

    function start() {
        pParticleSystem.running = true
    }














}
