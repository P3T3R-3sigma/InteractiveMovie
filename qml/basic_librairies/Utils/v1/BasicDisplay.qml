import QtQuick
import Felgo

Item {

    id: mBASIC_DISPLAY_V1

    property string pNameBooleanEvent
    property var pMapLoops
    property var pArrayLoopsOpened
    property var mNativeKeys: []

    Component.onCompleted: {
        for (let lKey in mBASIC_DISPLAY_V1) {
            mNativeKeys.push(lKey)
        }
    }


    function title(sTitle) {
        console.log(shadow_title(sTitle, "-"));
    }

    function superTitle(sTitle) {
        //
        //  Compute bordure
        //
        let lElementBordure = "-";
        let lBordure0 = shadow_title(sTitle, lElementBordure)

        let lBordure = "";
        for (let lIdx = 0; lIdx < lBordure0.length; lIdx++) {
            lBordure += lElementBordure;
        }
        //
        console.log();
        console.log(lBordure);
        console.log(lBordure0);
        console.log(lBordure);
    }

    function error(sSender, sMessageError) {
        let lSender;
        let lMessage;
        if (sMessageError === undefined || sMessageError === null) {
            lSender = "?"
            lMessage = sSender;
        } else {
            lSender = mBasicDisplay.getName(sSender);           // why do we need this? What is sSender?
            lMessage = sMessageError;
        }
        console.log();
        console.log();
        let lText = " !!!!!!!! ERROR: " + lSender + " > "  + lMessage;
        console.log(lText);
        console.log();
        console.log();
    }

    function errorCodeLogic(sSender) {
        error(sSender, "This should have never happened in the code");
    }

    function errorOverride(sSender, sNameFunctionOverride) {
        let lMsg = "The function '" + sNameFunctionOverride + "' of the object '" + sSender + "'"
            + " should be overridden."
            + "\nThe function was called so it means it was not coded in the parent. You must code the function in the parent."
        error(sSender, lMsg);
    }

    function com(sSender, sMessage, sIsBreakLineBefore) {
        let lSender;
        let lMessage;
        if (sMessage === undefined) {
            lSender = "?"
            lMessage = sSender;
        } else {
            lSender = getName(sSender);
            lMessage = sMessage;
        }
        let lText = lSender + ": " + lMessage;
        if (sIsBreakLineBefore === true) {
            console.log();
        }
        console.log(lText);
    }

    function comItem(sSender, sMessage) {
        let lSender;
        let lMessage;
        if (sMessage === undefined) {
            lSender = "?"
            lMessage = sSender;
        } else {
            lSender = sSender;
            lMessage = sMessage;
        }
        let lText = lSender + " > " + lMessage;
        console.log(lText);
    }

    function shadow_title(sTitle, sSeparator) {
        let lElementBordure = sSeparator;
        let lBordure0 = "";
        for (let lIdx = 0; lIdx < 20; lIdx++) {
            lBordure0 += lElementBordure;
        }
        let lSpaces0 = " ";
        return (lBordure0 + lSpaces0 + sTitle + lSpaces0 + lBordure0);
    }


    function enterLoop(sObjectContainer, sNameWEvent) {
        /*
          Get value by reflection
          */
        let lValue = Reflect.get(sObjectContainer, sNameWEvent);
        let lNameEvent = sNameWEvent + "= " + lValue;
        /**
          Initiate
          */
        if (pArrayLoopsOpened === undefined) {
            pArrayLoopsOpened = []
        }
        /**
          Withdraw all exisitng even since we replace in any case
          */
        let lIdx = 0;
        while (lIdx < pArrayLoopsOpened.length) {
            let lEvent = pArrayLoopsOpened[lIdx];
            if (lEvent.startsWith(sNameWEvent)) {
                pArrayLoopsOpened.splice(lIdx, 1);
            } else {
                lIdx++;
            }
        }
        /*
          Case the value is 0 --> we exit the loop --> we withdraw all the existing events from the array
          */
        if (lValue === 0) {

        }
        /**
          Case the value > 0 --> then we add a new loop which has just started
          */
        else if (lValue > 0) {
            pArrayLoopsOpened.push(lNameEvent);
        }
        /**
          display
          */
        let lText = "";
        for (let lIdx = 0; lIdx < pArrayLoopsOpened.length; lIdx++) {
            lText += "< " + pArrayLoopsOpened[lIdx] + " ";
        }
        for (let lIdx = 0; lIdx < pArrayLoopsOpened.length; lIdx++) {
            lText += ">"
        }
        if (lText === "") {
            lText = "<>";
        }
        console.log(shadow_title(lText, "-"));
        return 0;
    }

    function display(sTextCom) {
        console.log("pNameBooleanEvent= " + pNameBooleanEvent + " >> " + sTextCom);
    }

    function displayFull(sNameMethod, sTextCom) {
        console.log("pNameBooleanEvent= " + pNameBooleanEvent
                    + "; sNameMethod= " + sNameMethod
                    + " >> " + sTextCom);
    }

    function getpOrCreateLoop(sNameLoop) {
        if (pMapLoops === undefined || pMapLoops === null) {
            pMapLoops = new Map();
        }
        if (!pMapLoops.has(sNameLoop)) {
            pMapLoops.set(sNameLoop, 0);
        }
        return pMapLoops.get(sNameLoop);
    }

    function incMapLoop(sNameLoop) {
        let lValue = getpOrCreateLoop(sNameLoop) + 1;
        pMapLoops.set(sNameLoop, lValue);
        return lValue;
    }

    function getName(sQtObject) {
        let lName = "" + sQtObject;
        let lIdx = lName.indexOf("_");
        let lShortName = lName.substring(0, lIdx);
        return lShortName;
    }

    function displayArray(sArray) {
        let lOutput = "[";
        for (let lIdx = 0; lIdx < sArray.length; lIdx++) {
            let lValue = sArray[lIdx]
            if (lIdx > 0) {
                lOutput += ", ";
            }
            lOutput += sArray[lIdx];
        }
        lOutput += "]";
        return lOutput;
    }

    function displayPercent(sReal, sOptionalNbDigits) {
        if (mBasicNum.isNotNull(sOptionalNbDigits)) {
            let lPow10 = Math.pow(10, sOptionalNbDigits)
            console.log(lPow10)
            return Math.round(sReal * 100 * lPow10) / lPow10 + " %"
        } else {
            return Math.round(sReal * 100) + " %"
        }
    }

    function deprecated(sThisObject) {
        // console.log("@DEPRECATED @" + getName(sThisObject));
    }

    function checkParentHasDimension(sSender) {
        let lParent = sSender.parent
        if (mBasicNum.isNull(lParent)) {
            error(sSender, "The parent is null or undefined\nparent= " + sSender.parent)
        } else if (lParent.width == 0 || lParent.height == 0) {
            error(sSender, "The parent has no dimension:"
                  + "\nparent= " + sSender.parent
                  + "\nparent.width= " + lParent.width
                  + "\nparent.height= " + lParent.height
                  );
        }
    }

    function getType(sItem) {
        let lName = "" + sItem;
        if (lName.search("Animation") >= 0) {
            return "Animation";
        } else if (lName.search("BasicTimer") >= 0) {
            return "BasicTimer"
        } else if (lName.search("Timer") >= 0) {
            return "Timer"
        } else {
            let lType = typeof sItem;
            if (lType === "string" || lType === "boolean" || lType === "number") {   // What is bookan??
                return lType;
            } else {
                return "Unknown"
            }
        }
    }

    /**
      */
    function displayMap(sMap) {
        let lDisplayMap = "["
        if (mBasicNum.isNotNull(sMap)) {
            let lIdx = 0;
            for (let lEntry of sMap.entries()) {
                let lKey = lEntry[0]
                let lValue = lEntry[1]
                lDisplayMap += lKey + "= " + lValue;
                /*
                  Add comma
                  */
                lIdx++
                if (lIdx < sMap.size) {
                    lDisplayMap += ", "
                }
            }
        }
        lDisplayMap += "]";
        return lDisplayMap
    }

    /**
      */
    function getmDimensions(sItem) {
        return "Dimensions: " + getName(sItem)
                + "; visible= " + sItem.visible
                + "; x= " + sItem.x
                + "; y= " + sItem.y
                + "; width= " + sItem.width
                + "; height= " + sItem.height
    }

    /*
      Get time in the  form of HH:MM:SS.sss
      */
    function getmTimeHHMMSSsss(sTime) {
        /*
          Seconds
          */
        let milliseconds = sTime % 1000;
        let totalSeconds = Math.floor(sTime / 1000);
        let seconds = totalSeconds % 60;
        let lSecondsStr = (seconds + "").padStart(2, "0")
        /*
          Minutes
          */
        let totalMinutes = Math.floor(totalSeconds / 60);
        let minutes = totalMinutes % 60;
        let lMinutesStr = (minutes + "").padStart(2, "0")
        /*
          Hours
          */
        let hours = Math.floor(totalMinutes / 60);
        let lHoursStr = (hours + "").padStart(2, "0")
        /*
          */
        return lHoursStr + ":" + lMinutesStr + ":" + lSecondsStr + "." + milliseconds
    }


    /*
      Get time in the  form of HH:MM:SS.sss
      */
    function getmTimeMMSSsss(sTime) {
        /*
          Seconds
          */
        let milliseconds = sTime % 1000;
        let totalSeconds = Math.floor(sTime / 1000);
        let seconds = totalSeconds % 60;
        let lSecondsStr = (seconds + "").padStart(2, "0")
        /*
          Minutes
          */
        let totalMinutes = Math.floor(totalSeconds / 60);
        let lMinutesStr = (totalMinutes + "").padStart(2, "0")
        /*
          Hours
          */
        let minutes = totalMinutes % 60;
        /*
          */
        return lMinutesStr + ":" + lSecondsStr + "." + milliseconds
    }

    /**
      Try to get as many information as possible about the item
      */
    function toConsoleKnowItem(sItem) {
        console.log();
        /*
          Case of an array
          */
        if (Array.isArray(sItem)) {
            console.log("KnowItem: isArray= true")
            console.log("KnowItem: size= " + sItem.length)
            console.log(displayArray(sItem))

        }
        /*
          Case of a function
          */
        else if (typeof sItem === "function") {
            console.log("KnowItem: sITem= " + sItem)
            console.log("KnowItem: typeof sItem= " + (typeof sItem));
        }
        /*
          Case of an object
          */
        else if (typeof sItem === "object") {
            console.log("KnowItem: sITem= " + sItem)
            console.log("KnowItem: typeof sItem= " + (typeof sItem));
            /*
              Write properties
              */
            for (let lPropertyOrFunction in sItem) {
                /*
                  Case the property is derived from the native type ITEM --> we ignore it
                  */
                if (!mNativeKeys.includes(lPropertyOrFunction)) {
                    /*
                      Case of a non-function and non object
                      */
                    let lTypeOf = typeof sItem[lPropertyOrFunction]
                    if (lTypeOf !== "function") {
                        console.log("KnowItem: property= " + lPropertyOrFunction)
                    }
                }
            }
            /*
              Write functions
              */
            for (let lPropertyOrFunction in sItem) {
                /*
                  Case the property is derived from the native type ITEM --> we ignore it
                  */
                if (!mNativeKeys.includes(lPropertyOrFunction)) {
                    /*
                      Case of a function --> we ignore the Felgo added functions
                      */
                    if (typeof sItem[lPropertyOrFunction] === "function"
                            && !(lPropertyOrFunction.startsWith("__felgo_func_"))
                            && !(lPropertyOrFunction.endsWith("Changed"))) {
                        console.log("KnowItem: function= " + lPropertyOrFunction)
                    }
                }
            }
            /*
              Write inside Objects
              */
            if (sItem.children) {
                console.log("KnowItem: Nb child= " + sItem.children.length);
                for (let lIdx = 0; lIdx < sItem.children.length; lIdx++) {
                    let lChild = sItem.children[lIdx]
                    console.log("KnowItem: children[" + lIdx + "]= " + lChild)
                }
            }

        }
        /*
          Other cases
          */
        else {
            console.log("KnowItem: sITem= " + sItem)
            console.log("KnowItem: typeof sItem= " + (typeof sItem));
        }

    }

}
