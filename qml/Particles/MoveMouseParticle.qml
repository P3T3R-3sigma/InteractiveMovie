import QtQuick
import Felgo
import QtQuick.Particles


OneParticleAbstract {

    id: mThis

    /**

      Put particles floating in the air in the full window
      used to give an impression of realism in a photo

      */


    property int mNbParticles: 1

    /**
      Launches particles within its boundaries
      */
    Emitter {
        id: mThisEmitter

        width: 1
        height: 1

        system: getpParticleSystem() // always must be a particleSystem - only one system

        lifeSpan: 500   //  duration of life of particle. the higher, the bigger will be the

        maximumEmitted: -1 // 10 // maximum of particles alive (-1 = no maximum limit)

        size: 5 //  size of particles in pixel at the begining of their life

        /*
          the shape inside which the particle will start
          */

        /*
          the initial speed at which the particle will be sent (direction, )
          */

        velocity: AngleDirection {
            angle: 0
            angleVariation: 360
            magnitude: 30
            magnitudeVariation: 10
        }
    }

    /*
      Define the particle
      */
    ImageParticle {
        system: getpParticleSystem()

        anchors.fill: parent

        source: mBasicSource.getSource("Images/white_disc_2.png")

        color: "white"  // Base color
        colorVariation: 0.5  // Allow color to randomly vary ±80%
    }

    function setEmitPos(xPos, yPos) {
        mThisEmitter.x = xPos
        mThisEmitter.y = yPos
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


