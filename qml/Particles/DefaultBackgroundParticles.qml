import QtQuick
import Felgo
import QtQuick.Particles


OneParticleAbstract_WithClip {

    id: mThis

    /**

      Put particles floating in the air in the full window
      used to give an impression of realism in a photo

      */


    property int mNbParticles: 100

    /**
      Launches particles within its boundaries
      */
    Emitter {
        id: mThisEmitter

        system: getpParticleSystem() // always must be a particleSystem - only one system

        emitRate: mNbParticles * 1000 / lifeSpan // Number of particles emitted per second, default is 10

        lifeSpan: 10000   //  duration of life of particle. the higher, the bigger will be the
        lifeSpanVariation: 2000 // add random to the 'lifeSpan'

        maximumEmitted: -1 // 10 // maximum of particles alive (-1 = no maximum limit)

        size: Math.ceil(parent.height) * 0.001 //  size of particles in pixel at the begining of their life
        endSize: Math.ceil(parent.height) * 0.001 // the size will end at 'endSize' in a linear interpolation

        /*
          the shape inside which the particle will start
          */
        anchors.fill: parent

        /*
          the initial speed at which the particle will be sent (direction, )
          */
        velocity: AngleDirection {
            angle: 0
            angleVariation: 360
            magnitude: Math.ceil(parent.height) * 0.01
            magnitudeVariation: magnitude / 2
        }

    }

    /*
      Define the particle
      */
    ImageParticle {
        system: getpParticleSystem()

        source: mBasicSource.getSource("Images/white_disc_2.png")

        property real lLevelWhite: 0.8
        color: Qt.rgba(lLevelWhite, lLevelWhite, lLevelWhite, 0.3)
        // color: "white"
        // colorVariation: Qt.rgba(0.2, 0.2, 0.2, 0)

        opacity: 0.2

        entryEffect: ImageParticle.Fade

        rotationVariation: 360
        rotationVelocity: 45
        rotationVelocityVariation: rotationVelocity * 0.20

    }

    function start() {
        mThisEmitter.enabled = true;
        getpParticleSystem().running = true
        mThisEmitter.burst(mNbParticles)
    }

    function clear() {
        getpParticleSystem().restart();
    }

    function stop() {
        mThisEmitter.enabled = false
        getpParticleSystem().running = false
    }
}


