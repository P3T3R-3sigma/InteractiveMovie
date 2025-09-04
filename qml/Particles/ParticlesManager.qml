import QtQuick
import Felgo

Item {

    id: mThis

    property var mListParticles: []

    function declareNewParticle(sOneParticleAbstract) {
        mListParticles.push(sOneParticleAbstract)
    }

    /*
      Getters & Setters
      */
    function getmListParticles() {
        return mListParticles;
    }
}
