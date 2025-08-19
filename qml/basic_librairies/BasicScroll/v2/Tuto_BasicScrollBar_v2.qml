import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImage/v3"
import "../../BasicImageSource/v4"
import "../../BasicImageHover/v1"
import "../../BasicImageSourceHover/v2"
import "../../BasicLoader/v1"
import "../../BasicDebug/v1"

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
    BasicList {
        id: mBasicList
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

    /**
      Click on the button "Download Images" to start the tuto
      */
    onWStartChanged: {
        addNewElements(10, pBasicScrollBarHorizontal)
    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [pBasicScrollBarHorizontal,
                pBasicScrollBarHorizontalNoEmpty,
                pBasicScrollBarHorizontalItems,
                pBasicScrollBarVertical,
                pBasicScrollBarVerticalNoEmpty,
                pBasicScrollBarVerticalItems
                ]
    }

    AppButton {
        id: pButtonDownload

        width: parent.width * 0.10
        height: parent.height * 0.10
        y: parent.height * 0.60
        x: parent.width - width * 1.8
        text: "Download Images"

        onClicked: {
            mBasicLoaderManager.startCheck(mThisScene, "success", pButtonDownload)
        }

        function success() {
            console.log("-------- Download successful ------------")
            // mBasicLoaderManager.toConsole();
            pBasicScrollBarHorizontal.visible = true
            pBasicScrollBarHorizontalNoEmpty.visible = true
            pBasicScrollBarHorizontalItems.visible = true
            pBasicScrollBarVertical.visible = true
            pBasicScrollBarVerticalNoEmpty.visible = true
            pBasicScrollBarVerticalItems.visible = true
            /*
              Debug
              */
        }
    }


    /*
      Scrolls
      */
    BasicScrollBarHorizontal {
        id: pBasicScrollBarHorizontal
        visible: false

        mNUMBER_SLOTS: 6
        mSOURCE_SIMPLE_EMPTY_SLOTS: "scrolls/Scroll_items_empty.png"
        mPADDING_BETWEEN_SLOTS: 0.10

        xPercent: 0.05
        yPercent: 0.05
        widthPercent: 0.4
        heightPercent: 0.2

    }

    BasicScrollBarHorizontal {
        id: pBasicScrollBarHorizontalNoEmpty

        visible: false

        mNUMBER_SLOTS: 6
        mPADDING_BETWEEN_SLOTS: 0.10
        mPADDING_TOP: 0.15

        xPercent: 0.05
        yPercent: 0.30
        widthPercent: 0.4
        heightPercent: 0.2

    }

    BasicScrollBarHorizontal {
        id: pBasicScrollBarHorizontalItems
        visible: false

        mNUMBER_SLOTS: 6
        mPADDING_BETWEEN_SLOTS: 0.10
        mPADDING_TOP: 0.10
        mSOURCE_SIMPLE_EMPTY_SLOTS: "scrolls/Scroll_items_empty.png"

        x: 100
        y: pBasicScrollBarHorizontalNoEmpty.y + pBasicScrollBarHorizontalNoEmpty.height * 1.3
        width: 355
        height: 41
    }

    BasicScrollBarVertical {
        id: pBasicScrollBarVertical
        visible: false

        mNUMBER_SLOTS: 4
        mSOURCE_SIMPLE_EMPTY_SLOTS: "scrolls/Scroll_items_empty.png"
        mPADDING_BETWEEN_SLOTS: 0.20

        xPercent: 0.50
        yPercent: 0.05
        widthPercent: 0.2
        heightPercent: 0.5

    }

    BasicScrollBarVertical {
        id: pBasicScrollBarVerticalNoEmpty
        visible: false

        mNUMBER_SLOTS: 4
        mPADDING_BETWEEN_SLOTS: 0.20
        mPADDING_TOP: 0.20

        xPercent: 0.75
        yPercent: 0.05
        widthPercent: 0.2
        heightPercent: 0.5

    }

    BasicScrollBarVertical {
        id: pBasicScrollBarVerticalItems
        visible: false

        mNUMBER_SLOTS: 6
        mPADDING_BETWEEN_SLOTS: 0.10
        mPADDING_TOP: 0.10
        mSOURCE_SIMPLE_EMPTY_SLOTS: "scrolls/Picto_character_unknown.png"

        x: 500
        y: pBasicScrollBarHorizontalItems.y - 50
        width: 41
        height: 355
    }

    /*

      We create elements to put in the scroll

      */

    AppButton {
        id: mThisAppButton
        property int pNbElements: 2
        text: "Create " + pNbElements + " new elements"
        width: 200
        height: 50
        y: 700
        x: 100
        onClicked: {
            /*
              Angel
              */
            addNewElements(pNbElements, pBasicScrollBarHorizontal);
            addNewElements(pNbElements, pBasicScrollBarVertical);
            addNewElements(pNbElements, pBasicScrollBarHorizontalNoEmpty);
            addNewElements(pNbElements, pBasicScrollBarVerticalNoEmpty);
            /*
              Battery
              */
            addNewElements(pNbElements, pBasicScrollBarVerticalNoEmpty, true)
            addNewElements(pNbElements, pBasicScrollBarVerticalItems, true)
        }
    }

    property bool mIsShowFirst

    AppButton {

        text: mIsShowFirst ? "show first element" : "show last element"
        width: 200
        height: 50
        y: 700
        x: 700
        onClicked: {
            if (mIsShowFirst) {
                pBasicScrollBarHorizontal.scrollToLastBasicItem();
                pBasicScrollBarVertical.scrollToLastBasicItem();
                pBasicScrollBarHorizontalNoEmpty.scrollToLastBasicItem();
                pBasicScrollBarVerticalNoEmpty.scrollToLastBasicItem();
            } else {
                pBasicScrollBarHorizontal.scrollToFirstBasicItem();
                pBasicScrollBarVertical.scrollToFirstBasicItem();
                pBasicScrollBarHorizontalNoEmpty.scrollToFirstBasicItem();
                pBasicScrollBarVerticalNoEmpty.scrollToFirstBasicItem();
            }
            mIsShowFirst = !mIsShowFirst
        }
    }

    Component {
        id: pComponentBattery

        BasicImageSourceHover {
            mSourceMain: "Images/BasicScroll/battery_from_boxes_main.png"
            mSourceHover: "Images/BasicScroll/battery_from_boxes_hover.png"
            mX0Y0: [26, 26]
            mIsBumpIfClick: true
            onClicked: {
                console.log("CLICK")
            }
        }
    }

    /*
      Make an object with big border and nothing in the middle
      Add an image
      Random color
      */
    Component {
        id: pComponentAngel

        BasicImage {
            source: "Images/BasicScroll/Angel_002.jpg"
            borderWidthPct: 0.20
            borderColor: Qt.rgba(Math.floor(Math.random() * 256) / 255, Math.floor(Math.random() * 256) / 255, Math.floor(Math.random() * 256) / 255, 1)
        }
    }

    /**
      Add images to the scrolls
      */
    function addNewElements(sNbElementsToAdd, sBasicScrollBar, mIsBatteryOrAngel) {
        for (let lIdx = 0; lIdx < sNbElementsToAdd; lIdx++) {
            /*
              Create the image
              */
            let lImage;
            if (mIsBatteryOrAngel) {
                lImage = pComponentBattery.createObject(sBasicScrollBar);
            } else {
                lImage = pComponentAngel.createObject(sBasicScrollBar);
            }
            /*
              Add to the scroll
              */
            sBasicScrollBar.addNewBasicItemToScrollBar(lImage);
        }
        /*
          Download images
          */
        mBasicLoaderManager.startCheck(mThisScene)
    }

    AppButton {

        text: "Withdraw 2nd element"
        width: 200
        height: 50
        y: 700
        x: 1100
        onClicked: {
            pBasicScrollBarHorizontal.withdrawElement(1);
            pBasicScrollBarVertical.withdrawElement(pBasicScrollBarVertical.getmListBasicItemInScroll()[1]);
            pBasicScrollBarHorizontalNoEmpty.withdrawElement(pBasicScrollBarHorizontalNoEmpty.getmListBasicItemInScroll()[1]);
            pBasicScrollBarVerticalNoEmpty.withdrawElement(1);
        }
    }

    AppButton {
        text: "Empty scrolls"
        width: 200
        height: 50
        y: 600
        x: 1100
        onClicked: {
            pBasicScrollBarHorizontal.emptyScroll();
            pBasicScrollBarVertical.emptyScroll();
            pBasicScrollBarHorizontalNoEmpty.emptyScroll();
            pBasicScrollBarVerticalNoEmpty.emptyScroll();
        }
    }



















}
