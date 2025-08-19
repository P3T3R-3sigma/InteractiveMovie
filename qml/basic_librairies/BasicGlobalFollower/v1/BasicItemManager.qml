import QtQuick
import Felgo

Item {

    id: mThisBasicItemManager


    property var mListBasicItemDeclared: []
    property bool mIsAtLeastOneBasicItemMoving
    property var mListBasicItemMoving: []

    function declareBasicItem(sBasicItem) {
        if (!mListBasicItemDeclared.includes(sBasicItem)) {
            mListBasicItemDeclared.push(sBasicItem);
        }
    }

    function declareMoving(sBasicItem) {
        if (!mListBasicItemMoving.includes(sBasicItem)) {
            mListBasicItemMoving.push(sBasicItem);
            return true;
        } else {
            return false;
        }
    }

    function declareStopMoving(sBasicItem) {
        let lIdx = mListBasicItemMoving.indexOf(sBasicItem);
        if (lIdx >= 0) {
            mListBasicItemMoving.splice(lIdx, 1);
            return false;
        } else {
            return true;
        }
    }

    function getmIsAtLeastOneMoving() {
        return mListBasicItemMoving.length > 0;
    }

    /**
      Getters & Setters
      */
    function getmListBasicItemDeclared() {
        return mListBasicItemDeclared;
    }
}
