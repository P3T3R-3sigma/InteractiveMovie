import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicGlobalFollower/v1"

SceneAbstract {

    id: mTHIS_TUTO_REFLECTION_V2

    /////////////////////////////////////////////////////////////
    //      OTHER LIBRAIRIES NEEDED
    /////////////////////////////////////////////////////////////
    BasicDisplay {
        id: mBasicDisplay
    }
    BasicNum {
        id: mBasicNum
    }
    BasicConst {
        id: mBasicConst
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicAnimationFollower {
        id: mBasicAnimationFollower
    }
    BasicTimerManager {
        id: mBasicTimerManager
    }
    BasicItemManager {
        id: mBasicItemManager
    }
    BasicReflection {
        id: mBasicReflection
    }

    /////////////////////////////////////////////////////////////
    //      TUTO
    /////////////////////////////////////////////////////////////


    onWStartChanged: {
        mBasicReflection.mIS_SHOW_COMMUNICATION = true;
    }

    property int mCount;
    property bool mBool

    AppButton {
        id: mSimpleButtonInteger

        width: parent.width * 0.10
        height: parent.height * 0.10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click to add 1 by reflection\nmCount= " + mCount
        onClicked: {
            mBasicReflection.callEvent(mTHIS_TUTO_REFLECTION_V2, "mCount", mSimpleButtonInteger);
        }
    }

    AppButton {
        id: mSimpleButtonBoolean

        width: parent.width * 0.10
        height: parent.height * 0.10
        y: mSimpleButtonInteger.y + mSimpleButtonInteger.height * 2
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click to switch boolean\nmBool= " + mBool
        onClicked: {
            let lInstruction = mBool ? "!mBool" : "mBool"
            mBasicReflection.callEvent(mTHIS_TUTO_REFLECTION_V2, lInstruction, mSimpleButtonInteger);
        }
    }


}
