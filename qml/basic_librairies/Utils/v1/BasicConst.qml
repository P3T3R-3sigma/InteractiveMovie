import QtQuick
import Felgo

Item {

    /**
      CONSTANTS
      */
    property int mDEFAULT_DURATION: 750
    property int mDEFAULT_EASING_TYPE: Easing.InOutQuad
    property int mDEFAULT_DURATION_FLIP: 1500
    property int mDEFAULT_SCENE_FADE: 2000



    /**
      Getters & Setters
      */
    function getmDEFAULT_DURATION() {
        return mDEFAULT_DURATION;
    }
    function getmDEFAULT_EASING_TYPE() {
        return mDEFAULT_EASING_TYPE;
    }
    function getmDEFAULT_DURATION_FLIP() {
        return mDEFAULT_DURATION_FLIP;
    }
    function getmDEFAULT_SCENE_FADE() {
        return mDEFAULT_SCENE_FADE;
    }
}
