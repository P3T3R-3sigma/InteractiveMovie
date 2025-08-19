import QtQuick
import Felgo
import "../../BasicImage/v2"

BasicScrollBar {

    id: mThisBasicScrollBarHorizontal


    BasicImage {
        id: mWindowArrowLeft

        visible: false
        sourceSimple: "librairies_basic/BasicScroll/" + "Scroll_Arrow_Left.png"
        widthPercent: mARROW_SPACE_WIDTH * mARROW_WIDTH_PERCENT
        xPercent: (mARROW_SPACE_WIDTH - widthPercent) * mARROW_LEFT_TO_RIGHT
        yPercent: (1 - heightPercent) / 2
    }

    BasicImage {
        id: mWindowArrowRight

        visible: false
        sourceSimple: "librairies_basic/BasicScroll/" + "Scroll_Arrow_Right.png"
        widthPercent: mARROW_SPACE_WIDTH * mARROW_WIDTH_PERCENT
        xPercent: 1 - mARROW_SPACE_WIDTH + (mARROW_SPACE_WIDTH - widthPercent) * (1 - mARROW_LEFT_TO_RIGHT)
        yPercent: (1 - heightPercent) / 2
    }

    MouseArea {
        id: mMouseAreaArrowLeft

        width: parent.width * mARROW_SPACE_WIDTH
        height: parent.height
        x: 0
        y: 0
        enabled: mWindowArrowLeft.visible
        onClicked: {
            slideLeftOrRight("R");
        }
    }

    MouseArea {
        id: mMouseAreaArrowRight

        width: parent.width * mARROW_SPACE_WIDTH
        height: parent.height
        x: parent.width - width
        y: 0
        enabled: mWindowArrowRight.visible
        onClicked: {
            slideLeftOrRight("L");
        }
    }

    function drawInOneSlot(sIdxSlot, sBasicItemV2) {
        /*
          Compute the width & height maximum
          */
        let lWidthTotalSlotsMax = width * (1 - 2 * mARROW_SPACE_WIDTH);
        let lWidthOneSlotMax = lWidthTotalSlotsMax / (mNUMBER_SLOTS + (mNUMBER_SLOTS - 1) * mPADDING_BETWEEN_SLOTS);
        let lPaddingTop = mBasicNum.chooseNotNull(0, mPADDING_TOP);
        let lHeightOneSlotMax = height * (1 - 2 * lPaddingTop);
        /*
          Compute width & height
          */
        let lWidthOneSlot;
        let lHeightOneSlot;
        if (mSLOT_RATIO_HEIGHT_TO_WIDTH == 0) {
            lWidthOneSlot = lWidthOneSlotMax;
            lHeightOneSlot =lHeightOneSlotMax;
        } else {
            if (mSLOT_RATIO_HEIGHT_TO_WIDTH * lWidthOneSlotMax > lHeightOneSlotMax) {
                lHeightOneSlot = lHeightOneSlotMax;
                lWidthOneSlot = lHeightOneSlot / mSLOT_RATIO_HEIGHT_TO_WIDTH;
            } else {
                lWidthOneSlot = lWidthOneSlotMax;
                lHeightOneSlot = mSLOT_RATIO_HEIGHT_TO_WIDTH * lWidthOneSlot
            }
        }
        let lPaddingBetweenSlot = lWidthOneSlot * mPADDING_BETWEEN_SLOTS;
        /*
          Compute the real coordinates
          */
        let lWidthTotalSlots = mNUMBER_SLOTS * lWidthOneSlot + (mNUMBER_SLOTS - 1) * lPaddingBetweenSlot;
        let lX0 = (width - lWidthTotalSlots) / 2
        let lX = x + lX0 + sIdxSlot * (lWidthOneSlot + lPaddingBetweenSlot);
        let lY = y + (height - lHeightOneSlot) / 2;
        /*
          Transfer to the referential of sBasicItemV2
          */
        let lParent = sBasicItemV2.parent
        sBasicItemV2.widthPercent = lWidthOneSlot / lParent.width
        sBasicItemV2.xPercent = (lX - lParent.x) / lParent.width
        sBasicItemV2.heightPercent = lHeightOneSlot / lParent.height
        sBasicItemV2.yPercent = (lY - lParent.y) / lParent.height
    }

    function setmIsVisibleBegintArrow(sIsVisible) {
        mWindowArrowLeft.visible = sIsVisible;
    }
    function setmIsVisibleEndtArrow(sIsVisible) {
        mWindowArrowRight.visible = sIsVisible;
    }

}
