import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v1"
import "../../BasicDebug/v1"
import "../../BasicLoader/v1"
import "../../BasicText/v4"

SceneAbstract {

    id: mThisSampleScene

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
    BasicImageSourceManager {
        id: mBasicImageSourceManager
    }
    BasicSource {
        id: mBasicSource

        mMODE_SOURCE: "HotReload"
    }
    BasicLoaderManager {
        id: mBasicLoaderManager

        mIS_DEBUG: false
    }
    BasicVideoConstants {
        id: cBasicVideo
    }


    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    mDURATION: 0

    onWStartChanged: {

    }

    //////////////////////////////////
    BasicDebugRectangle{visible: true}
    //////////////////////////////////


    BasicVideo {
        id: pThisVideo

        width: parent.width
        height: width * 9 / 16
        anchors.centerIn: parent
        mSourceSimple: "VideoReduite.mp4"

        ////////////////////////////////////////////
        // BasicDebugRectangle {visible: true}
        ////////////////////////////////////////////

        mListSourcesImagesToJumpTo: [
            // "start_LABEL_Start_MMSS_0000.jpg",
            "JomereLesbi_LABEL_The each_MMSS_0041.jpg",
            "JomereLesbi_Gun_LABEL_Gun down_MMSS_0115.jpg",
            "JomereLesbi_Cunni_LABEL_Cuni_MMSS_0150.jpg",
            "JomereLesbi_Cunni_Doggy_LABEL_Doggy_MMSS_0439.jpg",
            // "end_LABEL_End_MMSS_9999.jpg",
        ]

        onTerminated: {
            pAppButton.visible = true
        }
    }


    AppButton {
        id: pAppButton

        text: "Click to start video"
        x: (parent.width - width) / 2
        y: parent.height * 0.90
        width: parent.width * 0.10
        height: parent.height * 0.05
        /*
          Wait that all are loaded + launch video
          */
        onClicked: {
            mBasicLoaderManager.startCheck(pThisVideo, "startVideo")
            pAppButton.visible = false
        }
    }
}
