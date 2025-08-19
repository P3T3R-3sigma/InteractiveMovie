import QtQuick
import Felgo
import "../../Utils"


Item {

    /**
      Allows to call an event by reflecton which is an animation, a boolean or an integer
      */


    id: mTHIS_BASIC_REFLECTION_V2
    property bool mIS_SHOW_COMMUNICATION: false


    /**
      sContainer (QtObject)
      sEventToCall (string) : the variable can be either a double or an integer
                                if the variable is an Animation, then it will start the Animation and put it in the Follower, so that we can be notified when the animation is finished (should use the follower for that)
                                if the variable is a bool --> "!sEventToCall" will put a FALSE, "sEventToCall" will put a TRUE
                                if the variable is an int --> the function will increase the value by 1 of the int
      */
    function callEvent(sContainer, sEventToCall, sSender) {
        /**
          Communication
          */
        if (mIS_SHOW_COMMUNICATION) {
            console.log("mBasicReflection.callEvent: "
                        + "; sContainer= '" + mBasicDisplay.getName(sContainer) + "'"
                        + "; sEventToCall= '" + sEventToCall + "'"
                        + "; sSender= '" + mBasicDisplay.getName(sSender) + "'");
        }
        /**
          Case there is an animation
          */
        if (mBasicDisplay.getName(sContainer).search("Animation") >= 0) {
            mBasicAnimationFollower.startAndFollow(sContainer)
            return true;
        }
        /**
          Check there is indeed an event
          */
        else if (sEventToCall !== "" && sEventToCall !== undefined && sEventToCall !== null) {
            let lIsBoolOrInt;
            let lEventToCall = sEventToCall;
            let lEventValueToSet;
            /**
              If the event begins with "!" then we know it is a boolean
              */
            if (sEventToCall.startsWith("!")) {
                lIsBoolOrInt = true;
                lEventValueToSet = false;
                lEventToCall = sEventToCall.substring(1, sEventToCall.length);
            }
            /**
              Check if the event is a boolean or an integer
              */
            else {
                let lEventValue = Reflect.get(sContainer, sEventToCall);
                let lTypeOf = typeof lEventValue;
                if (lTypeOf === "boolean") {
                    lIsBoolOrInt = true;
                    lEventValueToSet = true;
                } else if (lTypeOf === "number") {
                    lIsBoolOrInt = false;
                    lEventValueToSet = ++lEventValue;
                } else {
                    mBasicDisplay.error(mTHIS_BASIC_REFLECTION_V2, "Unknown type of sEventToCall. I expected bool or int"
                                        + "\nTypeOf= " + lTypeOf
                                        + "\nsContainer= " + mBasicDisplay.getName(sContainer)
                                        + "\nsEventToCall= '" + sEventToCall + "'");
                }

            }
            /**
                Call the reflection
            */
            let lIsReflectSuccess = Reflect.set(sContainer, lEventToCall, lEventValueToSet);
            /**
                Communicaton
            */
            if (!lIsReflectSuccess) {
                mBasicDisplay.error(mTHIS_BASIC_REFLECTION_V2, "Reflection failed"
                                    + "\msContainer= " + sContainer
                                    + "\nsEventToCall= '" + sEventToCall + "'");
            }
        }
    }









}
