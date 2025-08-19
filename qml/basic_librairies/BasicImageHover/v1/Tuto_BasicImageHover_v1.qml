import QtQuick
import Felgo
import Qt5Compat.GraphicalEffects
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v4"
import "../../BasicLoader/v1"
import "../../BasicDebug/v1"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_IMAGE_HOVER_V2

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

    Item {
        id: pAllImages

        function getmListItemToCheckIfLoaded() {
            return [pThisBasicImageHover, pThisBasicImageHover2, pThisBasicImageHover3]
        }

        anchors.fill: parent
        visible: false

        BasicImageHover {
            id: pThisBasicImageHover

            sourceSimpleMain: "BasicImageHover/Angel_002.jpg"

            mSourceHover: "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"

            mIsBumpIfClick: true

            heightPercent: 0.5
            xPercent: 0

            radiusPct: 0.10
            borderWidthPctHover: 0.01
            borderColorHover: "pink"

            onClicked: {
                console.log("CLicked")
            }
            onEntered: {
                console.log("Entered")
            }
            onExited: {
                console.log("Exited")
            }
        }

        BasicImageHover {
            id: pThisBasicImageHover2

            sourceSimpleMain: "BasicImageHover/Angel_002.jpg"

            mSourceHover: "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"

            mIsBumpIfClick: true
            mIsBumpIfHover: true

            heightPercent: 0.9

            radiusPct: 0.10

            onClicked: {
                console.log("CLicked 2")
            }
            onEntered: {
                console.log("Entered 2")
            }
            onExited: {
                console.log("Exited 2")
            }
        }

        BasicImageHover {
            id: pThisBasicImageHover3

            sourceSimpleMain: "BasicImageHover/Angel_002.jpg"

            mIsBumpIfClick: true
            mIsBumpIfHover: false

            heightPercent: 0.40
            xPercent: 1 - widthPercent

            /*
              We round corners
              */
            radiusPct: 0.10

            /*
              Borders
              */
            borderWidthPctMain: 0.02
            borderWidthPctHover: 0.02
            borderColorMain: "yellow"
            borderColorHover: "pink"

            /*
              Glow effect if hover
              */
            radiusPctHoverGlow: 0.08
            spreadHoverGlow: 0.35

            /*
              Mouse effects
              */
            onClicked: {
                console.log("CLicked 3")
            }
            onEntered: {
                console.log("Entered 3")
            }
            onExited: {
                console.log("Exited 3")
            }
        }

    }

    AppButton {
        id: pAppButton

        text: "Click to show image"
        x: (parent.width - width) / 2
        y: parent.height * 0.90
        width: parent.width * 0.10
        height: parent.height * 0.05
        /*
          Wait that all are loaded + launch video
          */
        onClicked: {
            mBasicLoaderManager.startCheck(pAllImages, "visible")
        }
    }

    AppText {
        height: parent.height * 0.10
        width: parent.width * 0.30
        y: parent.height * 0.05
        text: "ImageHover + Bump if click"
        color: "green"
    }
    AppText {
        height: parent.height * 0.10
        width: parent.width * 0.30
        x: parent.width * 0.40
        y: parent.height * 0.05
        text: "ImageHover + Bump if click or hover"
        color: "green"
    }
    AppText {
        height: parent.height * 0.10
        width: parent.width * 0.30
        x: parent.width * 0.75
        y: parent.height * 0.05
        text: "No ImageHover + Bump if click or hover"
        color: "green"
    }



}
