import QtQuick
import Felgo
import "../../BasicItem/v3"
import "../../BasicImage/v2"



BasicItem {

    id: mTHIS_BASICSCROLLBAR_V1

    /**
        The elements of the scroll are BasicItem, we add them with the function 'addNewElements'

        The elements (BasicItem) should have mTHIS_BASICSCROLLBAR_V1 as parent

        if we use mSOURCE_SIMPLE_EMPTY_SLOTS, then the size of the slots will be bound to the ratio of the image (preserve Image)
        if mSOURCE_SIMPLE_EMPTY_SLOTS === undefined, then the image will be distorted
      */

    /*
        Parameters - Slots
      */
    property int mNUMBER_SLOTS
    property real mPADDING_BETWEEN_SLOTS: 0.10      //  as a % of the slot width
    property real mPADDING_TOP: 0.10                //  Method 2: as a % of the slot height
    property real mPADDING_TOP_TO_BOTTOM: 0.50
    property real mSLOT_RATIO_HEIGHT_TO_WIDTH: 0    //  Method 1: we need to know height/width which we want for the BasicItem
    property string mSOURCE_SIMPLE_EMPTY_SLOTS
    /*
        Parameters - Background
        */
    property real mBACKGROUND_RADIUS_PCT: 0.3
    property color mBACKGROUND_COLOR: Qt.color("#371831")
    property real mBACKGROUND_OPACITY: 0.8
    property string mBACKGROUND_SOURCE_SIMPLE
    property color mBACKGROUND_BORDER_COLOR
    property real mBACKGROUND_BORDER_WIDTH_PCT
    /*
      Parameters - Arrows
      */
    property real mARROW_SPACE_WIDTH: 0.10
    property real mARROW_WIDTH_PERCENT: 0.25
    property real mARROW_LEFT_TO_RIGHT: 0.70
    /*
        Variables
      */
    property list<BasicItem> mListBasicItemEmptySlot
    property list<BasicItem> mListBasicItemInScroll
    property int mIdxStartView


    Component.onCompleted: {
        createEmptySlots();
    }

    onMNUMBER_SLOTSChanged: {
        if (mBasicNum.isNotNull(parent)) {
            createEmptySlots();
        }
    }

    onMSOURCE_SIMPLE_EMPTY_SLOTSChanged: {
        if (mBasicNum.isNotNull(parent)) {
            createEmptySlots()
        }
    }

    BasicImage {
        id: mAppImageBackground

        anchors.fill:parent
        backgroundColor: mBACKGROUND_COLOR
        backgroundOpacity: mBACKGROUND_OPACITY
        radiusPct: mBACKGROUND_RADIUS_PCT
        sourceSimple: mBACKGROUND_SOURCE_SIMPLE
        borderWidthPct: mBACKGROUND_BORDER_WIDTH_PCT
        borderColor: mBACKGROUND_BORDER_COLOR
    }

    /**
      Add a new element to the scroll
      */
    function addNewBasicItemToScrollBar(sBasicItem, sIdx) {
        if (sBasicItem.parent !== mTHIS_BASICSCROLLBAR_V1) {
            mBasicDisplay.error(mTHIS_BASICSCROLLBAR_V1, "The BasicItem's parent should be the scroll bar"
                                + "; Actual parent= " + mBasicDisplay.getName(sBasicItem.parent)
                                + "; Expected parent= " + mBasicDisplay.getName(mTHIS_BASICSCROLLBAR_V1))
        }
        if (mBasicNum.isNull(sIdx)) {
            mListBasicItemInScroll.push(sBasicItem);
        } else {
            mBasicList.splice(mListBasicItemInScroll, sIdx, 0, sBasicItem);
        }
        drawScroll();
    }

    /**
      Withdraw an element from the scroll
      */
    function withdrawElement(sIdxOrBasicItem) {
        let lIdx
        if (typeof sIdxOrBasicItem === "number") {
            lIdx = sIdxOrBasicItem;
        } else {
            lIdx = mBasicList.indexOf(mListBasicItemInScroll, sIdxOrBasicItem);
            if (lIdx < 0) {
                mBasicDisplay.error(mTHIS_BASICSCROLLBAR_V1, "The BasicItem is not in the list"
                                    + "\nBasicItem= " + sIdxOrBasicItem
                                    + "\nList= " + mBasicList.vString(mListBasicItemInScroll));
            }
        }
        if (lIdx < 0 || lIdx >= mListBasicItemInScroll.length) {
            return
        } else {
            let lBasicItem = mListBasicItemInScroll[lIdx]
            lBasicItem.visible = false;
            mBasicList.splice(mListBasicItemInScroll, lIdx, 1);
            drawScroll();
        }
    }

    /**
      Empty all the slots (reset)
      */
    function emptyScroll() {
        for (let lIdx = 0; lIdx < mListBasicItemInScroll.length; lIdx++) {
            let lBasicItem = mListBasicItemInScroll[lIdx]
            lBasicItem.visible = false;
        }
        mListBasicItemInScroll = [];
        drawScroll();
    }

    /**
      Will shift until we see the last element
      */
    function scrollToLastBasicItem() {
        mIdxStartView = Math.max(0, mListBasicItemInScroll.length - mNUMBER_SLOTS);
        drawScroll();
    }

    function scrollToFirstBasicItem() {
        mIdxStartView = 0;
        drawScroll();
    }

    function createEmptySlots() {
        if (mNUMBER_SLOTS > 0 && mSOURCE_SIMPLE_EMPTY_SLOTS != "" && mNUMBER_SLOTS != mListBasicItemEmptySlot.length
                && width != 0 && height != 0) {
            let lComponent = Qt.createComponent("../../BasicImage/v2/" + "BasicImage.qml");
            while (mListBasicItemEmptySlot.length < mNUMBER_SLOTS) {
                let lBasicImage = lComponent.createObject(mTHIS_BASICSCROLLBAR_V1);
                /*
                  Initiate
                  */
                lBasicImage.sourceSimple = mSOURCE_SIMPLE_EMPTY_SLOTS;
                lBasicImage.visible = false;
                lBasicImage.fillMode = Image.Stretch
                /*
                  Add to list of empty slots
                  */
                mListBasicItemEmptySlot.push(lBasicImage)
                /*
                  Case ratio was not filled
                  */
                if (mSLOT_RATIO_HEIGHT_TO_WIDTH <= 0) {
                    mSLOT_RATIO_HEIGHT_TO_WIDTH = lBasicImage.getmSourceSizeHeight() / lBasicImage.getSourceSizeWidth();
                }
            }
            drawScroll();
        }
    }

    function drawScroll() {
        mBasicDisplay.checkParentHasDimension(mTHIS_BASICSCROLLBAR_V1);
        /*
          Draw empty slots
          */
        let lIdxSlot = mListBasicItemInScroll.length - mIdxStartView;
        for (let lIdx = 0; lIdx < mNUMBER_SLOTS; lIdx++) {
            let lBasicItemEmptySlot = mListBasicItemEmptySlot[lIdx];
            if (mBasicNum.isNotNull(lBasicItemEmptySlot)) {
                drawInOneSlot(lIdx, lBasicItemEmptySlot);
                lBasicItemEmptySlot.visible = true;
            }
        }
        /*
          Make the pictos outside of the slots invisible and the ones in the slots visible
          */
        for (let lIdx = 0; lIdx < mListBasicItemInScroll.length; lIdx++) {
            let lBasicItem = mListBasicItemInScroll[lIdx]
            if (mIdxStartView <= lIdx && lIdx < mIdxStartView + mNUMBER_SLOTS) {
                drawInOneSlot(lIdx - mIdxStartView, lBasicItem);
                lBasicItem.visible = true;
                lBasicItem.z = 1
            } else {
                lBasicItem.visible = false;
            }
        }
        /*
          Decide to show or hide the arrows
          */
        setmIsVisibleBegintArrow(getmIsCanSlide("R"));
        setmIsVisibleEndtArrow(getmIsCanSlide("L"));
    }

    /**
      We can slide left if the last icon is after the first place
      */
    function getmIsCanSlide(sLorR) {
        if (mListBasicItemInScroll.length === 0) {
            return false;
        }
        if (sLorR == "L") {
            return mIdxStartView < mListBasicItemInScroll.length - mNUMBER_SLOTS;
        } else if (sLorR == "R") {
            return mIdxStartView > 0;
        }
        return false;
    }

    /**
      Slide by one slot
      */
    function slideLeftOrRight(sLorR) {
        /*
          Exit if we cannot shift
          */
        if (!getmIsCanSlide(sLorR)) {
            return;
        }
        /**
          Compute the slide
          */
        let lSlide = 0;
        if (sLorR == "L") {
            lSlide = -1;
        } else if (sLorR == "R") {
            lSlide = 1;
        }
        if (lSlide == 0) {
            return;
        }
        /*
          Slide
          */
        mIdxStartView += -lSlide;
        drawScroll();
    }

    /*
      Getters & Setters
      */
    function getmListBasicItemInScroll() {
        return mListBasicItemInScroll;
    }




















}
