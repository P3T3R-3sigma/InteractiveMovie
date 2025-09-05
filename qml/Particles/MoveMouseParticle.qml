import QtQuick
import Felgo
import QtQuick.Particles


OneParticleAbstract {

    id: mThis

    /**

      Put particles floating in the air in the full window
      used to give an impression of realism in a photo

      */


    property int mNbParticles: 10

    /**
      Launches particles within its boundaries
      */
    Emitter {
        id: mThisEmitter

        system: getpParticleSystem() // always must be a particleSystem - only one system

        emitRate: mNbParticles * 10 // Number of particles emitted per second, default is 10

        lifeSpan: 500   //  duration of life of particle. the higher, the bigger will be the
        lifeSpanVariation: 300 // add random to the 'lifeSpan'

        maximumEmitted: -1 // 10 // maximum of particles alive (-1 = no maximum limit)

        size: 5 //  size of particles in pixel at the begining of their life

        /*
          the shape inside which the particle will start
          */
        anchors.fill: parent

        /*
          the initial speed at which the particle will be sent (direction, )
          */

        velocity: PointDirection {
            id: iTarget
            x: width/2
            y: width/2
            xVariation: 100
            yVariation: 100
        }
    }

    Timer {
        id: iParticleTimer
        interval: 100

        onTriggered: {
            mThis.stop()
        }
    }


    /*
      Define the particle
      */
    ImageParticle {
        system: getpParticleSystem()

        source: mBasicSource.getSource("Images/white_disc_2.png")

        color: "white"  // Base color
        colorVariation: 1  // Allow color to randomly vary ±80%
    }

    function setEmitPos(xPos, yPos) {
        iTarget.x = width/2-xPos
        iTarget.y = height/2-yPos
    }

    function start() {
        mThisEmitter.enabled = true;
        getpParticleSystem().running = true
        if (iParticleTimer.running) {
            iParticleTimer.stop()
        }
        iParticleTimer.start()
    }

    function clear() {
        getpParticleSystem().restart();
    }

    function stop() {
        mThisEmitter.enabled = false
    }
}


