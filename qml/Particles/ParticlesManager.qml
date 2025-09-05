import QtQuick
import Felgo

Item {

    id: mThis

    property var mListParticles: []

    function declareNewParticle(sOneParticleAbstract) {
        mListParticles.push(sOneParticleAbstract)
        sOneParticleAbstract.stop()
    }

    /*
      Getters & Setters
      */
    function getmListParticles() {
        return mListParticles;
    }

    function showSpecific(sOneParticle) {
        let lListOneParticleAbstract = getmListParticles();
        for (let lIdx = 0; lIdx < lListOneParticleAbstract.length; lIdx++) {
            let lOneParticle_01 = lListOneParticleAbstract[lIdx];
            if (lOneParticle_01 === sOneParticle && mParticleOverall) {
                lOneParticle_01.visible = true
                lOneParticle_01.start();
            } else {
                lOneParticle_01.visible = false;
                lOneParticle_01.stop()
            }
        }
    }
}
