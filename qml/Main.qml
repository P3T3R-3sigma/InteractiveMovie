import Felgo
import QtQuick
import QtMultimedia

import "abstract"
import "basic_librairies/Utils/v1"
import "basic_librairies/BasicItem/v3"
import "basic_librairies/BasicGlobalFollower/v2"
import "basic_librairies/BasicImage/v3"
import "basic_librairies/BasicImageSource/v4"
import "basic_librairies/BasicImageHover/v1"
import "basic_librairies/BasicImageMulti/v1"
import "basic_librairies/BasicLoader/v1"
import "basic_librairies/BasicVideo/v1"
import "basic_librairies/BasicVideoSource/v1"
import "basic_librairies/BasicText/v4"
import "basic_librairies/BasicSprites/v3"
import "basic_librairies/BasicReflection/v3"
import "basic_librairies/BasicScroll/v2"
import "basic_librairies/BasicSubWindow/v3"
import "basic_librairies/BasicDebug/v1"
import "Choice"






GameWindow {
    id: iGameWindow

    BasicConst {
        id: mBasicConst
    }

    BasicList {
        id: mBasicList
    }
    BasicNum {
        id: mBasicNum
    }
    BasicDisplay {
        id: mBasicDisplay
    }
    BasicSource {
        id: mBasicSource
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicLoaderManager {
        id: mBasicLoaderManager
    }
    BasicVideoConstants {
        id: cBasicVideo
    }
    BasicSpriteManager {
        id: mBasicSpriteManager
    }
    BasicReflection {
        id: mBasicReflection
    }

    /*
      Constants
      */
    CHc {
        id: mCHc
    }

    CHsChoiceContainer {
        id: ch0
        pTitle: qsTr("Title 0")
        pQuestion: qsTr("question 0")

        pTerminateAfterPlay: true
        pTextBeforeChoosing: ""
        pVideoBeforeChoiceSource: "Videos/VideoReduite.mp4"
        pVideoWhileChoiceSource: "Videos/VideoReduite.mp4"
        pImageWhileChoiceSource: "BasicSubWindow/IViewSimpleCupboardRight.jpg"
        pTime: 0
        pDefaultChoice: null
        pListChoices: [ch1, ch2, ch3, ch4]
    }



    CHsChoiceContainer {
        id: ch1
        pTitle: qsTr("Title 1")
        pQuestion: qsTr("question 1")

        pTextBeforeChoosing: qsTr("Choice 1, Choice 1, Choice 1, Choice 1, Choice1, Choice 1, Choice 1, Choice")
        pVideoBeforeChoiceSource: "Videos/VideoReduite.mp4"
        pVideoWhileChoiceSource: ""
        pImageWhileChoiceSource: "Angel/Angel_001.jpg"
        pTime: 0
        pDefaultChoice: null
        pListChoices: [ch2, ch3]
    }
    CHsChoiceContainer {
        id: ch2
        pTitle: qsTr("Title 2")
        pQuestion: qsTr("question 2")

        pTextBeforeChoosing: qsTr("Choice 2")
        pVideoBeforeChoiceSource: ""
        pVideoWhileChoiceSource: ""
        pImageWhileChoiceSource: "Angel/Angel_002.jpg"
        pTime: 0
        pDefaultChoice: null
        pListChoices: []
    }
    CHsChoiceContainer {
        id: ch3
        pTitle: qsTr("Title 3")
        pQuestion: qsTr("question 3")

        pTextBeforeChoosing: qsTr("Choice 3")
        pVideoBeforeChoiceSource: ""
        pVideoWhileChoiceSource: ""
        pImageWhileChoiceSource: "Angel/Angel_003.jpg"
        pTime: 0
        pDefaultChoice: null
        pListChoices: []
    }
    CHsChoiceContainer {
        id: ch4
        pTitle: qsTr("Title 4")
        pQuestion: qsTr("question 4")

        pTextBeforeChoosing: qsTr("Choice 4")
        pVideoBeforeChoiceSource: ""
        pVideoWhileChoiceSource: ""
        pImageWhileChoiceSource: ""
        pTime: 0
        pDefaultChoice: null
        pListChoices: []
    }
    AppButton {
        id: downloadButtton
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: width * 0.70
        y: parent.height - height * 1.5
        z: 20
        text: "Download sources"
        onClicked: {
            console.log("------- launch loader -----------")
            /*
              Set sources
              */

            /*
              Start loaded
              */
            mBasicLoaderManager.startCheck(iGameWindow, "loadedSuccess");
        }
    }


    function loadedSuccess() {
        console.log("Loaded successfully all choices")
        ch0.visible = true
        downloadButtton.visible = false
        /*
          Communication
          */
        mBasicLoaderManager.toConsole();
    }


    function getmListItemToCheckIfLoaded() {
        return [ch0];
    }

}
