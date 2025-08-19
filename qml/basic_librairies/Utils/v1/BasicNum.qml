import QtQuick
import Felgo

Item {

    id: mBASIC_NUM_V1

    function chooseNotNull(sValueCurrent, sValueWished) {
        if (sValueWished === null || sValueWished === undefined) {
            return sValueCurrent
        } else {
            return sValueWished
        }
    }

    function ifNotNull(sObject, sValue) {                               // why do we give sObject??
        if (mBasicNum.isNull(sObject) || mBasicNum.isNull(sValue)) {
            return 0;
        } else {
            return sValue;
        }
    }

    /**
      Numbers will be included
      generates a random integer between [sIntMin; sIntMax]
      */
    function getRandomInt(sIntMin, sIntMax) {
        return Math.floor(Math.random() * (sIntMax - sIntMin + 1)) + sIntMin;
    }

    /**
        generates a random real between [sRealMin; sRealMax[
     */
    function getRandomReal(sRealMin, sRealMax) {
        return Math.random() * (sRealMax - sRealMin) + sRealMin;
    }

    /**
      Treat the case of not null and not undefined
      */
    function isNotNull(sObject) {                                   // why cant we go (!isNull(sObject)) ??
        return sObject !== null && sObject !== undefined
    }

    /**
      Treat the case of not null and not undefined
      */
    function isNull(sObject) {
        return sObject === null || sObject === undefined
    }

    function isSameSignOrZero(sReal0, sReal1) {
        return (sReal0 <= 0 && sReal1 <= 0) || (sReal0 >= 0 && sReal1 >= 0); // return (sReal0*sReal1 >= 0);
    }

    function isOppositeSignOrZero(sReal0, sReal1) {
        return (sReal0 <= 0 && sReal1 >= 0) || (sReal0 >= 0 && sReal1 <= 0); // return (sReal0*sReal1 <= 0);
    }
}
