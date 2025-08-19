import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicLoader/v1"
import "../../BasicText/v4"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_IMAGE_V2

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
    BasicReflection {
        id: mBasicReflection
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicSource {
        id: mBasicSource
    }
    BasicLoaderManager {
        id: mBasicLoaderManager

        mIS_DEBUG: false
    }


    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////

    mDURATION: 0

    onWStartChanged: {
        mBasicDisplay.toConsoleKnowItem(0)
        mBasicDisplay.toConsoleKnowItem("Hello")
        mBasicDisplay.toConsoleKnowItem(true)
        mBasicDisplay.toConsoleKnowItem(undefined)
        mBasicDisplay.toConsoleKnowItem([])
        mBasicDisplay.toConsoleKnowItem(["aa", 0, 2, pItem])
        mBasicDisplay.toConsoleKnowItem({})
        mBasicDisplay.toConsoleKnowItem(pItem.bonjour)
        mBasicDisplay.toConsoleKnowItem(pItem)
    }


    Item {
        id: pItem

        property int mInt
        property var mVar
        property real pReal
        property MouseArea pMouseArea
        property var mArray: [2, 4 , 6, "kko"]


        function bonjour() {
            console.log("Bonjour")
        }

        function aurevoir() {

        }

        Rectangle {

        }

    }

}
