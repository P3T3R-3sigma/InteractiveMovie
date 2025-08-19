import QtQuick
import Felgo

ShadowOneReflectionManager {

    /**
        sObjectContainer: (QtObject) : object containing the event which will be called by reflection
        sEventToCall: (string) : name of the variable in sObjectContainer which will be changed by the trigger once the event is called // value should be an integer. We will add 1 to it        
        sIsEndIfClick: (bool) (optional, default= true): if yes, then when we call the reflection when the method "CompleteAll" is called
      */
    function startAndFollow(sAnimation, sIsEndIfClick, sObjectContainer, sEventToCall) {
        let lShadowOneReflection = shadow_createShadowOneReflection(sAnimation);
        lShadowOneReflection.shadow_initiate(sObjectContainer, sEventToCall, sIsEndIfClick);
        shadow_start(lShadowOneReflection);
    }

    /**
      will call the event when no more animation is running
      if there is no animation, then will call the event right away, without waiting time
      frequency of the check is 50ms
      */
    function watchAnimationsToCallEvent(sContainer, sEventToCall) {
        shadow_callEventWhenNoMoreAnimationRunning(sContainer, sEventToCall);
    }

    /**
      End all animations and call all events
      */
    function completeAll() {
        shadow_completeAll();
    }

    /**
      return true if there is one animation running
      */
    function getmIsAtLeastOneRunning() {
        return shadow_isAtLeastOneRunning();
    }



}
