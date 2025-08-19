import QtQuick
import Felgo

ShadowOneReflectionManager {

    /**
        l'interet d'utiliser ca est de pouvoir arreter tous les timers en meme temps (CompleteAll) et d'avoir la reflection qui se lance automatiquement quand le Timer est fini (sEventToCall)

        sInterval: (milliseconds) : time after which the timer is triggered

        sObjectContainer: (QtObject) : object containing the event which will be called by reflection
        sEventToCall: (string) : name of the variable in sObjectContainer which will be changed by the trigger once the event is called // value should be an integer. We will add 1 to it
        sIsEndIfClick: (bool) (optional, default= true): if yes, then when we call the reflection if we call the method "CompleteAll"

        sObjectContainingTimer (QtObject) : object calling the method and using the BasicTimer  (in case we call an event outside of the object or if we have 2 different BasicTimer triggering the same event)

        this function uses getmOrCreate to get or create the BasicTimer
      */
    function startBasicTimer(sInterval, sObjectContainingEvent, sEventToCall, sIsEndIfClick, sObjectContainingTimer) {
        /**
          Check which object contains the caller of the BasicTimer
          */
        let lObjectContainingTimer = sObjectContainingTimer === undefined ? sObjectContainingEvent : sObjectContainingTimer
        /**
          Get or create the shadowReflection and assign with BasicTimer one to another
          */
        let lComponent = Qt.createComponent("BasicTimer.qml");
        let lBasicTimer = lComponent.createObject();
        let lShadowOneReflection = shadow_createShadowOneReflection(lBasicTimer);
        lBasicTimer.mShadowOneReflection = lShadowOneReflection;
        /**
          Initiate
          */
        lBasicTimer.interval = sInterval;
        lShadowOneReflection.shadow_initiate(sObjectContainingEvent, sEventToCall, sIsEndIfClick);
        /**
          If the timer is already running then we need to finish it before restarting it
          */
        shadow_start(lShadowOneReflection);
        /**
          Return the timer
          */
        return lBasicTimer;
    }

    function completeAll() {
        shadow_completeAll();
    }

    function getmIsAtLeastOneRunning() {
        return shadow_isAtLeastOneRunning();
    }

    function launchBasicTimer(sInterval, sObjectContainingEvent, sEventToCall, sIsEndIfClick, sObjectContainingTimer) {
        startBasicTimer(sInterval, sObjectContainingEvent, sEventToCall, sIsEndIfClick, sObjectContainingTimer);
    }


}
