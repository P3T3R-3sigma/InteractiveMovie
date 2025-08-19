import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImage/v2"
import "../../BasicImageSource/v2"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_SCROLL_V1

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
    BasicImageSourceManager {
        id: mBasicImageSourceManager
    }
    BasicSource {
        id: mBasicSource
    }
    BIScBasicImageSourceConstants {
        id: cBIS
    }

    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    onWStartChanged: {


    }


    BasicScrollBarHorizontal {
        id: pBasicScrollBarHorizontal

        mNUMBER_SLOTS: 6
        mSOURCE_SIMPLE_EMPTY_SLOTS: "librairies_basic/Video_lock_plain.png"
        mPADDING_BETWEEN_SLOTS: 0.10

        xPercent: 0.05
        yPercent: 0.05
        widthPercent: 0.4
        heightPercent: 0.2

    }

    BasicScrollBarHorizontal {
        id: pBasicScrollBarHorizontalNoEmpty

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

        mNUMBER_SLOTS: 6
        mPADDING_BETWEEN_SLOTS: 0.10
        mPADDING_TOP: 0.10
        mSOURCE_SIMPLE_EMPTY_SLOTS: "librairies_basic/Scroll_items_empty.png"

        x: 100
        y: pBasicScrollBarHorizontalNoEmpty.y + pBasicScrollBarHorizontalNoEmpty.height * 1.3
        width: 355
        height: 41
    }

    BasicScrollBarVertical {
        id: pBasicScrollBarVertical

        mNUMBER_SLOTS: 4
        mSOURCE_SIMPLE_EMPTY_SLOTS: "librairies_basic/Video_lock_plain.png"
        mPADDING_BETWEEN_SLOTS: 0.20

        xPercent: 0.50
        yPercent: 0.05
        widthPercent: 0.2
        heightPercent: 0.5

    }

    BasicScrollBarVertical {
        id: pBasicScrollBarVerticalNoEmpty

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

        mNUMBER_SLOTS: 6
        mPADDING_BETWEEN_SLOTS: 0.10
        mPADDING_TOP: 0.10
        mSOURCE_SIMPLE_EMPTY_SLOTS: "librairies_basic/Picto_character_unknown.png"

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
            addNewElements(pNbElements, pBasicScrollBarHorizontal);
            addNewElements(pNbElements, pBasicScrollBarVertical);
            addNewElements(pNbElements, pBasicScrollBarHorizontalNoEmpty);
            addNewElements(pNbElements, pBasicScrollBarVerticalNoEmpty);
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

    function addNewElements(sNbElementsToAdd, sBasicScrollBar) {
        let lComponent = Qt.createComponent("../../BasicImage/v2/" + "BasicImage.qml")
        for (let lIdx = 0; lIdx < sNbElementsToAdd; lIdx++) {
            let lBasicAppImageV2 = lComponent.createObject(sBasicScrollBar);       //  note that BasicAppImageV2 is a BasicItem
            /*
              Make an object with big border and nothing in the middle
              */
            lBasicAppImageV2.borderWidthPct = 0.20
            /*
              Random color
              */
            var r = Math.floor(Math.random() * 256)
            var g = Math.floor(Math.random() * 256)
            var b = Math.floor(Math.random() * 256)
            lBasicAppImageV2.borderColor = Qt.rgba(r / 255, g / 255, b / 255, 1)
            /*
              Add to the scroll
              */
            sBasicScrollBar.addNewBasicItemToScrollBar(lBasicAppImageV2);
        }
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
