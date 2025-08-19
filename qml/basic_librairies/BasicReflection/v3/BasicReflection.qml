import QtQuick
import Felgo
import "../../Utils"


Item {

    /**
      Allows to call an event by reflecton which is an animation, a boolean or an integer
      */


    id: mTHIS_BASIC_REFLECTION_V3
    property bool mIS_SHOW_COMMUNICATION: false


    /**
      sContainer (QtObject)
      sEventToCall (string) : the variable can be either a double or an integer
                                if the variable is an Animation, then it will start the Animation and put it in the Follower,
                                    so that we can be notified when the animation is finished (should use the follower for that)
                                    in this case, there is no sContainer
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
        /*
          Case there is no event --> we exit
          */
        if (mBasicNum.isNull(sEventToCall) || sEventToCall === "") {
            return;
        }
        /*
          Case of an animation, timer or basictimer --> we call the global follower
          */
        let lType = mBasicDisplay.getType(sEventToCall);
        if (mBasicGlobalFollower.mSUPPORTED_TYPES.includes(lType)) {
            mBasicGlobalFollower.startAndFollow(sEventToCall, lType);
        }
        /*
          Case of a bool or an int
          */
        else {
            if (mBasicNum.isNull(sContainer)) {
                return;
            }
            let lEventToCall = sEventToCall;
            let lEventValueToSet;
            /**
              If the event begins with "!" then we know it is a boolean
              */
            if (sEventToCall.startsWith("!")) {
                lEventValueToSet = false;
                lEventToCall = sEventToCall.substring(1, sEventToCall.length);
            }
            /*
              Identify the type
              */
            let lEventValue = Reflect.get(sContainer, sEventToCall);
            let lTypeOf = typeof lEventValue;
            if (lTypeOf === "boolean") {
                lEventValueToSet = true;
            } else if (lTypeOf === "number") {
                lEventValueToSet = ++lEventValue;
            } else {
                mBasicDisplay.error(mTHIS_BASIC_REFLECTION_V3, "Unknown type of sEventToCall. I expected bool or int"
                                    + "\nTypeOf= " + lTypeOf
                                    + "\nsContainer= " + mBasicDisplay.getName(sContainer)
                                    + "\nsEventToCall= '" + sEventToCall + "'");
            }
            /**
                Call the reflection
            */
            let lIsReflectSuccess = Reflect.set(sContainer, lEventToCall, lEventValueToSet);
            /**
                Communicaton
            */
            if (!lIsReflectSuccess) {
                mBasicDisplay.error(mTHIS_BASIC_REFLECTION_V3, "Reflection failed"
                                    + "\msContainer= " + sContainer
                                    + "\nsEventToCall= '" + sEventToCall + "'");
            }
        }

    }

    /**
      returns true if the function exists in the item 'sContainer'
      sContainer: Item
      sStrFunction: String, name of the function which is supposed to be inside the sContainer
      */
    function getmIsFunctionExist(sContainer, sStrFunction) {
        return typeof sContainer[sStrFunction] === "function"
    }






}
