import QtQuick
import Felgo
import QtQuick.Particles


OneParticleAbstract {

    id: mThis

    /**

      Put particles floating in the air in the full window
      used to give an impression of realism in a photo

      */


    property int mNbParticles: 1000

    /**
      Launches particles within its boundaries
      */
    Emitter {
        id: mThisEmitter

        system: getpParticleSystem() // always must be a particleSystem - only one system

        lifeSpan: 1000   //  duration of life of particle. the higher, the bigger will be the
        lifeSpanVariation: 500 // add random to the 'lifeSpan'

        size: 5 //  size of particles in pixel at the begining of their life

        /*
          the shape inside which the particle will start
          */
        anchors.fill: parent

        shape: EllipseShape {
            fill: false
        }

        /*
          the initial speed at which the particle will be sent (direction, )
          */
        velocity: TargetDirection {
            targetX: width / 2
            targetY: height / 2
            magnitude: -100
            magnitudeVariation: -20
            targetVariation: 10
        }
    }

    /*
      Define the particle
      */
    ImageParticle {
        system: getpParticleSystem()

        anchors.fill: parent

        source: mBasicSource.getSource("Images/white_disc_2.png")
    }

    function start() {
        mThisEmitter.burst(mNbParticles)
    }

    function clear() {
        getpParticleSystem().restart();
    }

    function stop() {
        mThisEmitter.enabled = false
    }
}


