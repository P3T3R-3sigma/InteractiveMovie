import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v1"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_IMAGE_V1

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

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    onWStartChanged: {
        console.log("mAppImage.paintedWidth= " + mAppImage.paintedWidth)
        console.log("mAppImage.sourceSize.width= " + mAppImage.sourceSize.width)
        console.log("mAppImage.paintedHeight= " + mAppImage.paintedHeight)
        console.log("mAppImage.sourceSize.height= " + mAppImage.sourceSize.height)
        console.log("mAppImage.width= " + mAppImage.width)
        console.log("mAppImage.height= " + mAppImage.height)
        console.log("mAppImage.x= " + mAppImage.x)
        console.log("mAppImage.y= " + mAppImage.y)
        console.log(mD1.vString());
        console.log(mD2.vString());
        console.log(mD3.vString());
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

                AppImage {
                    id: mAppImage

                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    BasicSubWindowImage {
                        mX0Y0W0H0: [396, 364, 436, 243]
                        sourceSimple: "basic_librairies/Angel/Angel_001.jpg"
                    }
                }
            }

            Rectangle {
                color: "lightyellow"
                width: 400
                height: width

                AppImage {
                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop

                    BasicSubWindowImage {
                        mX0Y0W0H0: [396, 364, 436, 243]
                        sourceSimple: "basic_librairies/Angel/Angel_001.jpg"
                    }
                }
            }

            Rectangle {
                color: "lightyellow"
                width: 400
                height: width / 2

                AppImage {
                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.Stretch

                    BasicSubWindowImage {
                        mX0Y0W0H0: [396, 364, 436, 243]
                        sourceSimple: "basic_librairies/Angel/Angel_001.jpg"
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

                AppImage {
                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    BasicSubWindowGlow {
                        id: mSubImage
                        mX0Y0W0H0: [251, 21, 581, 360]
                        sourceSimple: "basic_librairies/Angel/Angel_001_Crop_251_21_581_360.png"
                        sourceGlowSimple: "basic_librairies/Angel/Angel_001_Crop_251_21_581_360_Glow.png"
                        onClicked: (sMouseX, sMouseY) => {
                            console.log("MouseX= " + sMouseX + "; MouseY= " + sMouseY);
                        }
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
                            if (mSubImage.sourceGlowSimple === "basic_librairies/Angel/Angel_001.jpg") {
                                mSubImage.sourceGlowSimple = "basic_librairies/Angel/Angel_001_Crop_251_21_581_360_Glow.png"
                            } else {
                                mSubImage.sourceGlowSimple = "basic_librairies/Angel/Angel_001.jpg"
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

            Rectangle {
                color: "lightyellow"
                width: 400
                height: width

                AppImage {
                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop

                    BasicSubWindowImage {
                        id: mSubImage2
                        mX0Y0W0H0: [251, 21, 581, 360]
                        sourceSimple: "basic_librairies/Angel/Angel_001_Crop_251_21_581_360.png"
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
                            if (mSubImage2.sourceSimple === "basic_librairies/Angel/Angel_001.jpg") {
                                mSubImage2.sourceSimple = "basic_librairies/Angel/Angel_001_Crop_251_21_581_360.png"
                            } else {
                                mSubImage2.sourceSimple = "basic_librairies/Angel/Angel_001.jpg"
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

                AppImage {
                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
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

                AppImage {
                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
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

                AppImage {
                    source: "../../../../assets/Images/basic_librairies/Angel/" + "Angel_001.jpg"
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

