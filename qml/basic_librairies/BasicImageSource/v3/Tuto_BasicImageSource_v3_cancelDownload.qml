import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"

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
    BasicImageSourceManager {
        id: mBasicImageSourceManager

        mIS_AUTO_LOAD_COMM: true
    }
    BasicSource {
        id: mBasicSource

        mMODE_SOURCE: "WebAssembly"
    }
    BIScBasicImageSourceConstants {
        id: cBIS
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    mDURATION: 0

    BasicImageSource {
        id: p00

        property int mIdx: 00

        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1

        onVisibleAndReady: {
            console.log()
            console.log(mName + " is ready")
        }

    }


    BasicImageSource {
        id: p01

        property int mIdx: 01

        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1

        onVisibleAndReady: {
            console.log()
            console.log(mName + " is ready")
        }

    }


    BasicImageSource {
        id: p02

        property int mIdx: 02

        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1

        onVisibleAndReady: {
            console.log()
            console.log(mName + " is ready")
        }

    }


    BasicImageSource {
        id: p03

        property int mIdx: 03

        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1

        onVisibleAndReady: {
            console.log()
            console.log(mName + " is ready")
        }

    }

    BasicImageSource {
        id: p04

        property int mIdx: 04

        widthPercent: 0.15
        xPercent: mIdx * widthPercent * 1.1

        onVisibleAndReady: {
            console.log()
            console.log(mName + " is ready")
        }

    }


    /*
      Display button
      */
    AppButton {
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: parent.width * 0.45
        y: parent.height - height * 1.5
        text: "Console"
        onClicked: {
            console.log("------ To console ----------")
            console.log(p00.vStringDebug())
            console.log(p01.vStringDebug())
            console.log(p02.vStringDebug())
            console.log(p03.vStringDebug())
            console.log(p04.vStringDebug())
            console.log("----------------------------")
        }
    }


    /*
      Download button
      */
    AppButton {
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: width * 0.70
        y: parent.height - height * 1.5
        text: "Download sources"
        onClicked: {
            console.log("------- sourceSimple set -----------")
            p00.sourceSimple = "Videos_photos/sex_Blacky/0N0A1540.JPG"
            p01.sourceSimple = "Videos_photos/sex_Blacky/0N0A1564.JPG"
            p02.sourceSimple = "Videos_photos/sex_Blacky/0N0A1597.JPG"
            p03.sourceSimple = "Videos_photos/sex_Blacky/0N0A1610.JPG"
            p04.sourceSimple = "Videos_photos/sex_Blacky/0N0A1636.JPG"
        }
    }


    /*
      Cancel Button
      */
    AppButton {
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: parent.width - width * 1.5
        y: parent.height - height * 1.5
        text: "cancel sources"
        onClicked: {
            console.log("------- all sources canceled -----------")
            p00.cancelDownload()
            p01.cancelDownload()
            p02.cancelDownload()
            p03.cancelDownload()
            p04.cancelDownload()
        }
    }










}
