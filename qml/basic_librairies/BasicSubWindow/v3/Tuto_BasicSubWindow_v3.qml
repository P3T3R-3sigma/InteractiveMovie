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
        return [p01, p02, p03, p04, p05, p06, p07, p08, p09, p10, p11, p12]
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
            p02.visible = true
            p03.visible = true
            p04.visible = true
            p05.visible = true
            p06.visible = true
            p07.visible = true
            p08.visible = true
            p09.visible = true
            p10.visible = true
            p11.visible = true
            p12.visible = true
        }
    }


    Column {
        spacing: 20

        AppText {
            color: "white"
            width: 800
            height: 100
            text: "Rectangles are cropped to the item, even if they are bigger in the original file"
            + "\nClick on the green rectangles to interact"
        }

        Row {
            spacing: 30
            Rectangle {
                color: "lightyellow"
                width: 400
                height: width

                BasicImageSource {
                    id: p01

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    BasicSubWindowImage {
                        mX0Y0W0H0: [396, 364, 436, 243]
                        sourceSimple: "librairies_basic/Angel/Angel_001.jpg"
                    }
                }
            }

            Rectangle {
                color: "lightyellow"
                width: 400
                height: width

                BasicImageSource {
                    id: p02

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop

                    BasicSubWindowImage {
                        id: p03

                        visible: false

                        mX0Y0W0H0: [396, 364, 436, 243]
                        sourceSimple: "librairies_basic/Angel/Angel_001.jpg"
                    }
                }
            }

            Rectangle {
                color: "lightyellow"
                width: 400
                height: width / 2

                BasicImageSource {
                    id: p04

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.Stretch

                    BasicSubWindowImage {
                        id: p05

                        visible: false

                        mX0Y0W0H0: [396, 364, 436, 243]
                        sourceSimple: "librairies_basic/Angel/Angel_001.jpg"
                    }
                }
            }
        }

        Row {
            spacing: 30

            Rectangle {
                color: "lightyellow"
                width: 400
                height: width

                BasicImageSource {
                    id: p06

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    BasicSubWindowGlowClickChange {
                        id: p07

                        visible: false

                        mX0Y0W0H0_Glow: [251, 21, 581, 360]
                        sourceSimple_Change: "librairies_basic/Angel/Angel_001.jpg"
                        sourceSimple_Glow: "Ada journal.png" // "librairies_basic/Angel/Angel_001_Crop_251_21_581_360_Glow.png"
                        onClicked: (sMouseX, sMouseY) => {
                                       // if (mSubImage.sourceGlowSimple === "librairies_basic/Angel/Angel_001.jpg") {
                                       //     mSubImage.sourceGlowSimple = "librairies_basic/Angel/Angel_001_Crop_251_21_581_360_Glow.png"
                                       // } else {
                                       //     mSubImage.sourceGlowSimple = "librairies_basic/Angel/Angel_001.jpg"
                                       // }
                        }
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [70, 971, 546, 291]
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [31, 11, 159, 1245]
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [251, 21, 581, 360]
                        Rectangle {
                            anchors.fill: parent
                            border.width: 5
                            border.color: "green"
                            color: "transparent"
                            z: 1000
                        }
                    }
                }
            }

            Rectangle {
                color: "lightyellow"
                width: 400
                height: width

                BasicImageSource {
                    id: p08

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop

                    BasicSubWindowImage {
                        id: p09

                        visible: false

                        mX0Y0W0H0: [251, 21, 581, 360]
                        sourceSimple: "librairies_basic/Angel/Angel_001_Crop_251_21_581_360.png"
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [70, 971, 546, 291]
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [31, 11, 159, 1245]
                    }
                    BasicSubWindowMouseArea {
                        mX0Y0W0H0: [251, 21, 581, 360]
                        onClicked: {
                            if (p09.sourceSimple === "librairies_basic/Angel/Angel_001.jpg") {
                                p09.sourceSimple = "librairies_basic/Angel/Angel_001_Crop_251_21_581_360.png"
                            } else {
                                p09.sourceSimple = "librairies_basic/Angel/Angel_001.jpg"
                            }
                        }
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [251, 21, 581, 360]
                        Rectangle {
                            anchors.fill: parent
                            border.width: 5
                            border.color: "green"
                            color: "transparent"
                            z: 1000
                        }
                    }
                }
            }


        }

        Row {
            spacing: 30

            Rectangle {
                color: "lightyellow"
                width: 400
                height: 200

                BasicImageSource {
                    id: p10

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    BasicSubWindow {
                        id: mD1
                        mX0Y0W0H0: [278, 20, 551, 300]
                    }
                    BasicSubWindow {
                        id: mD2
                        mX0Y0W0H0: [70, 971, 546, 291]
                    }
                    BasicSubWindow {
                        id: mD3
                        mX0Y0W0H0: [31, 11, 159, 1245]
                    }
                }
            }

            Rectangle {
                color: "lightyellow"
                width: 400
                height: 200

                BasicImageSource {
                    id: p11

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop

                    BasicSubWindow {
                        mX0Y0W0H0: [278, 20, 551, 300]
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [70, 971, 546, 291]
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [31, 11, 159, 1245]
                    }
                }
            }

            Rectangle {
                color: "lightyellow"
                width: 400
                height: 200

                BasicImageSource {
                    id: p12

                    visible: false

                    sourceSimple: "librairies_basic/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.Stretch

                    BasicSubWindow {
                        mX0Y0W0H0: [278, 20, 551, 300]
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [70, 971, 546, 291]
                    }
                    BasicSubWindow {
                        mX0Y0W0H0: [31, 11, 159, 1245]
                    }
                }
            }

        }

    }


}

