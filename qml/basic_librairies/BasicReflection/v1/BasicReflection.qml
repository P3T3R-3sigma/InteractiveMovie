import QtQuick
import Felgo
import "../../Utils"


Item {

    id: mTHIS_BASIC_REFLECTION_V1

    /**
      sContainer (QtObject)
      sEventToCall (string) : the variable can be either a double or an integer
                                if the variable is an Animation, then it will start the Animation and puyt it in the Follower, so that we can be notified when the animation is finished (should use the follower for that)
                                if the variable is a bool --> "!sEventToCall" will put a FALSE, "sEventToCall" will put a TRUE
                                if the variable is an int --> the function will increase the value by 1 of the int
      */
    function callEvent(sContainer, sEventToCall, sSender) {
//        /////////////////////////////////////////////////////////
       // console.log("mBasicReflection.callEvent: "
       //             + "; sContainer= '" + mBasicDisplay.getName(sContainer) + "'"
       //             + "; sEventToCall= '" + sEventToCall + "'"
       //             + "; sSender= '" + mBasicDisplay.getName(sSender) + "'");
//        /////////////////////////////////////////////////////////
        if (mBasicDisplay.getName(sContainer).search("Animation") >= 0) {
            mBasicAnimationFollower.startAndFollow(sContainer)
            return true;
        } else if (sEventToCall !== "" && sEventToCall !== undefined && sEventToCall !== null) {
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
                    mBasicDisplay.error(mTHIS_BASIC_REFLECTION_V1, "Unknown type of sEventToCall. I expected bool or int"
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
                mBasicDisplay.error(mTHIS_BASIC_REFLECTION_V1, "Reflection failed"
                                    + "\msContainer= " + sContainer
                                    + "\nsEventToCall= '" + sEventToCall + "'");
            }
        }
    }



    /**
      Treat the case the sEventStringBool has a '!' in front of him
      Return true in case of success, false if not a success
      */
    function callBool(sObjectContainer, sEventStringBool) {
        if (sObjectContainer !== undefined && sObjectContainer !== null && sEventStringBool !== "") {
            let lEventToTrigger = sEventStringBool
            let lEventValue;
            if (lEventToTrigger.startsWith("!")) {
                lEventToTrigger = lEventToTrigger.slice(1, lEventToTrigger.length);
                lEventValue = false;
            } else {
                lEventValue = true;
            }

            /////////////////////////////////////////////////////////////
            //            let lFrom = "BasicReflection"
            //            console.log(">>> Reflect from " + lFrom
            //                    + "; sObjectContainer= " + sObjectContainer
            //                    + "; sEventStringBool= '" + sEventStringBool + "'")
            /////////////////////////////////////////////////////////////


            let lIsReflectSuccess = Reflect.set(sObjectContainer, lEventToTrigger, lEventValue);
            if (!lIsReflectSuccess) {
                mBasicDisplay.error("Reflection failed"
                                    + "\nsObjectContainer= " + sObjectContainer
                                    + "\nsEventStringBool= '" + sEventStringBool + "'");
            }
            return lIsReflectSuccess;
        } else {
            return false;
        }
    }






}
