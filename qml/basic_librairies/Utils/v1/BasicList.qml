import QtQuick
import Felgo

Item {

    /*
      sIdxStart = [0, List.length - 1]

      example:  List= [Banana,Orange,Apple,Mango]
                Splice(List, 2, 1, Lemon) = [Banana,Orange,Lemon,Mango]
                Splice(List, 2, 0, Lemon) = [Banana,Orange,Lemon,Apple,Mango]
      */
    function splice(sList, sIdxStart, sQtyRemove, sElementToAdd) {
        mBasicDisplay.deprecated(mBasicList)
        if (sIdxStart < 0) {
            return;
        }
        /*
          Case we want to add an element
          */
        if (mBasicNum.isNotNull(sElementToAdd)) {
            if (sIdxStart >= sList.length) {
                sList.push(sElementToAdd);
                return;
            }
            sList.push(sList[sList.length - 1]);
            for (let lIdx = sList.length - 2; lIdx > sIdxStart; lIdx--) {
                sList[lIdx] = sList[lIdx - 1];
            }
            sList[sIdxStart] = sElementToAdd;
            sIdxStart++;
        }
        /*
          Case we want to remove some elements
          */
        if (sQtyRemove > 0) {
            for (let lIdx = sIdxStart; lIdx < sList.length - sQtyRemove; lIdx++) {
                sList[lIdx] = sList[lIdx + sQtyRemove];
            }
            sList.length = sList.length - sQtyRemove;
        }
    }


    function indexOf(sList, sElementToFind) {
        mBasicDisplay.deprecated(mBasicList)
        for (let lIdx = 0; lIdx < sList.length; lIdx++) {
            if (sList[lIdx] === sElementToFind) {
                return lIdx;
            }
        }
        return -1;
    }


    function includes(sList, sElementToTest) {
        mBasicDisplay.deprecated(mBasicList)
        for (let lIdx = 0; lIdx < sList.length; lIdx++) {
            if (sList[lIdx] === sElementToTest) {
                return true;
            }
        }
        return false;
    }

    function vString(sList) {
        mBasicDisplay.deprecated(mBasicList)
        let lVString = "length= " + sList.length + "; + List= [";
        for (let lIdx = 0; lIdx < sList.length; lIdx++) {
            lVString += sList[lIdx]
            if (lIdx < sList.length - 1) {
                lVString += ", ";
            }
        }
        lVString += "]"
        return lVString
    }













}
