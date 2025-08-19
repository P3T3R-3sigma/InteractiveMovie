import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v4"
import "../../BasicLoader/v1"

SceneAbstract {

    id: mThisScene

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

        mMODE_SOURCE: "HotReload"
    }
    BasicLoaderManager {
        id: mBasicLoaderManager

        mIS_DEBUG: false
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    mDURATION: 0

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [p01, p02, p03]
    }

    AppButton {
        id: pButtonDownload

        width: parent.width * 0.10
        height: parent.height * 0.10
        y: parent.height * 0.50
        x: parent.width - width * 1.8
        text: "Download Images"

        onClicked: {
            mBasicLoaderManager.startCheck(mThisScene, "success", pButtonDownload)
        }

        function success() {
            console.log("-------- Download successful ------------")
            mBasicLoaderManager.toConsole();
            p01.visible = true
        }
    }

    BasicImageSource {
        id: p01

        visible: false
        anchors.fill: parent
        sourceSimple: "door_view_no_items.jpg"
        fillMode: Image.PreserveAspectFit

        BasicSubWindowGlowClickHide {
            id: p02

            sourceSimple_Glow: "flashlight_purple_glow.png"
            sourceSimple_Item: "flashlight_with_shadow.png"
            mX0Y0W0H0_MouseArea: [1392, 997, 82, 44]
        }

        BasicSubWindowGlowClickHide {
            id: p03

            sourceSimple_Glow: "drill_purple_glow.png"
            sourceSimple_Item: "drill_with_shadow.png"
            mX0Y0W0H0_MouseArea: [1664, 889, 140, 97]
        }
    }


























}
