import QtQuick
import Felgo

Timer {

    id: mThisBasicTimer

    property QtObject mShadowOneReflection

    onTriggered: {
        mShadowOneReflection.callEvent(mThisBasicTimer);
    }

    /**
      Start the BasicTimer. If the BasicTimer is already running, then put complete it, call the event, and start a new round
      */
    function completeAndRestart() {
        mBasicTimerManager.shadow_start(mShadowOneReflection);
    }

    /**
      Deactivate the Timer & Call the reflection
      */
    function complete() {
        stop();
    }

    /**
      Getters & Setters
      */
    function setInterval(sInterval) {
        interval = sinterval;
    }
    function getmIsRunning() {
        return running;
    }

}
