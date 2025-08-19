import QtQuick
import Felgo
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

        mIS_DEBUG: true
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    mDURATION: 0

    Item {
        id: pAllImages

        function getmListItemToCheckIfLoaded() {
            return [pThisBasicImageSourceHover,
                    pThisBasicImageSourceHover2,
                    pThisBasicImageSourceHover3,
                    pThisBasicImageSourceHover4]
        }

        anchors.fill: parent
        visible: false

        property real pOneWidthPercent: 0.20
        property real pOneIntervalPercent: 0.05

        BasicDebugRectangle{visible: true}

        BasicImageSourceHover {
            id: pThisBasicImageSourceHover

            sourceSimpleMain: "BasicImageSourceHover/Angel_002.jpg"

            mSourceHover: "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"

            mIsBumpIfClick: true


            widthPercent: pAllImages.pOneWidthPercent
            xPercent: 0

            onClicked: {
                pThisRectangle.opacity = Math.min(1, pThisRectangle.opacity + 0.10)
                console.log("CLicked")
            }
            onEntered: {
                console.log("Entered")
            }
            onExited: {
                console.log("Exited")
            }

            Rectangle {
                id: pThisRectangle
                anchors.fill: parent
                color:"yellow"
                opacity: 0
            }

        }

        BasicImageSourceHover {
            id: pThisBasicImageSourceHover2

            sourceSimpleMain: "BasicImageSourceHover/Angel_002.jpg"

            mSourceHover: "https://www.3sigma-studios.com/escapes/assets/Images/InteractViewSimple/Assistant desk closeup.jpg"

            mIsBumpIfClick: true
            mIsBumpIfHover: true

            widthPercent: pAllImages.pOneWidthPercent
            xPercent:  pThisBasicImageSourceHover.widthPercent + pAllImages.pOneIntervalPercent

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

        BasicImageSourceHover {
            id: pThisBasicImageSourceHover3

            sourceSimpleMain: "BasicImageSourceHover/Angel_002.jpg"

            mIsBumpIfClick: true
            mIsBumpIfHover: true

            widthPercent: pAllImages.pOneWidthPercent
            xPercent:  pThisBasicImageSourceHover2.xPercent + pThisBasicImageSourceHover2.widthPercent + pAllImages.pOneIntervalPercent

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

        BasicImageSourceHover {
            id: pThisBasicImageSourceHover4

            sourceSimpleMain: "BasicImageSourceHover/battery_from_boxes_main.png"
            sourceSimpleHover: "BasicImageSourceHover/battery_from_boxes_hover.png"

            widthPercent: pAllImages.pOneWidthPercent
            xPercent:  pThisBasicImageSourceHover3.xPercent + pThisBasicImageSourceHover3.widthPercent + pAllImages.pOneIntervalPercent

            mIsBumpIfClick: true

            onClicked: {
                console.log("CLicked 4")
            }
            onEntered: {
                console.log("Entered 4")
            }
            onExited: {
                console.log("Exited 4")
            }

            mX0Y0: [26, 26]

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
        id: pAppText1

        height: parent.height * 0.10
        width: parent.width * pAllImages.pOneWidthPercent
        y: parent.height * 0.05
        text: "ImageHover + Bump if click"
        color: "green"
    }
    AppText {
        id: pAppText2

        height: parent.height * 0.10
        width: parent.width * pAllImages.pOneWidthPercent
        y: parent.height * 0.05
        x: parent.width * (pAllImages.pOneWidthPercent + pAllImages.pOneIntervalPercent)
        text: "ImageHover + Bump if click or hover"
        color: "green"
    }
    AppText {
        id: pAppText3

        height: parent.height * 0.10
        width: parent.width * pAllImages.pOneWidthPercent
        y: parent.height * 0.05
        x: parent.width * (pAllImages.pOneWidthPercent + pAllImages.pOneIntervalPercent) * 2
        text: "No ImageHover + Bump if click or hover"
        color: "green"
    }
    AppText {
        id: pAppText4

        height: parent.height * 0.10
        width: parent.width * pAllImages.pOneWidthPercent
        y: parent.height * 0.05
        x: parent.width * (pAllImages.pOneWidthPercent + pAllImages.pOneIntervalPercent) * 3
        text: "ImageHover of different size + bump if click"
        color: "green"
    }

}
