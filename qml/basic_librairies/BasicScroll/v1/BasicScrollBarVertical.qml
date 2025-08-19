import QtQuick
import Felgo
import "../../BasicImage/v2"

BasicScrollBar {

    id: mThisBasicScrollBarVertical

    BasicImage {
        id: mWindowArrowTop

        visible: false
        sourceSimple: "librairies_basic/BasicScroll/" + "Scroll_Arrow_Up.png"
        heightPercent: mARROW_SPACE_WIDTH * mARROW_WIDTH_PERCENT
        yPercent: (mARROW_SPACE_WIDTH - heightPercent) * mARROW_LEFT_TO_RIGHT
        xPercent: (1 - widthPercent) / 2
    }

    BasicImage {
        id: mWindowArrowBottom

        visible: false
        sourceSimple: "librairies_basic/BasicScroll/" + "Scroll_Arrow_Down.png"
        heightPercent: mARROW_SPACE_WIDTH * mARROW_WIDTH_PERCENT
        yPercent: 1 - mARROW_SPACE_WIDTH + (mARROW_SPACE_WIDTH - heightPercent) * (1 - mARROW_LEFT_TO_RIGHT)
        xPercent: (1 - widthPercent) / 2
    }

    MouseArea {
        id: mMouseAreaArrowTop
        width: parent.width
        height: parent.height * mARROW_SPACE_WIDTH
        x: 0
        y: 0
        enabled: mWindowArrowTop.visible
        onClicked: {
            slideLeftOrRight("R");
        }
    }

    MouseArea {
        id: mMouseAreaArrowBottom
        width: parent.width
        height: parent.height * mARROW_SPACE_WIDTH
        x: 0
        y: parent.height - height
        enabled: mWindowArrowBottom.visible
        onClicked: {
            slideLeftOrRight("L");
        }
    }

    function drawInOneSlot(sIdxSlot, sBasicItemV2) {
        // /*
        //   Compute height
        //   */
        // let lLengthSlots = height * (1 - 2 * mARROW_SPACE_WIDTH);
        // let lHeightOneSlot = lLengthSlots / (mNUMBER_SLOTS + (mNUMBER_SLOTS - 1) * mPADDING_BETWEEN_SLOTS);
        // /*
        //   Compute width
        //   */
        // let lWidthOneSlot
        // if (mSLOT_RATIO_HEIGHT_TO_WIDTH > 0) {
        //     lWidthOneSlot = lHeightOneSlot / mSLOT_RATIO_HEIGHT_TO_WIDTH;
        // } else {
        //     lWidthOneSlot = width * (1 - 2 * mPADDING_TOP);
        // }
        // /*
        //   Compute the real coordinates
        //   */
        // let lY = y + height * mARROW_SPACE_WIDTH + sIdxSlot * lHeightOneSlot * (1 + mPADDING_BETWEEN_SLOTS);
        // let lX = x + (width - lWidthOneSlot) / 2;


        /*
          Compute the width & height maximum
          */
        let lHeightTotalSlotsMax = height * (1 - 2 * mARROW_SPACE_WIDTH);
        let lHeightOneSlotMax = lHeightTotalSlotsMax / (mNUMBER_SLOTS + (mNUMBER_SLOTS - 1) * mPADDING_BETWEEN_SLOTS);
        let lPaddingTop = mBasicNum.chooseNotNull(0, mPADDING_TOP);
        let lWidthOneSlotMax = width * (1 - 2 * lPaddingTop);
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
        let lPaddingBetweenSlot = lHeightOneSlot * mPADDING_BETWEEN_SLOTS;
        /*
          Compute the real coordinates
          */
        let lHeightTotalSlots = mNUMBER_SLOTS * lHeightOneSlot + (mNUMBER_SLOTS - 1) * lPaddingBetweenSlot;
        let lY0 = (height - lHeightTotalSlots) / 2
        let lX = x + (width - lWidthOneSlot) / 2;
        let lY = y + lY0 + sIdxSlot * (lHeightOneSlot + lPaddingBetweenSlot);
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
        mWindowArrowTop.visible = sIsVisible;
    }
    function setmIsVisibleEndtArrow(sIsVisible) {
        mWindowArrowBottom.visible = sIsVisible;
    }

}
