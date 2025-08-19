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

        mMODE_SOURCE: "WebAssembly"
    }
    BasicLoaderManager {
        id: mBasicLoaderManager

        mIS_DEBUG: true
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////

    mDURATION: 0

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [p01, p02]
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
        sourceSimple: "librairies_basic/BasicSubWindow/" + "IViewSimpleCupboardRight.jpg"
        fillMode: Image.PreserveAspectFit

        BasicSubWindowGlowClick {
            id: p02

            mX0Y0W0H0_MouseArea: [777, 843, 586, 233]
            sourceSimple_Glow: "Drill.png"
            onClicked: (sMouseX, sMouseY) => {
                console.log("You clicked on the glow image. This signal can be used in the dev"
                            + "; MouseX= " + sMouseX + "; MouseY= " + sMouseY)
            }
        }
    }


}
