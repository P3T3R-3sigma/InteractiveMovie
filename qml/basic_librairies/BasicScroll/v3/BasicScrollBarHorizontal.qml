import QtQuick
import Felgo
import "../../BasicImageSource/v4"

BasicScrollBar {

    id: mThisBasicScrollBarHorizontal


    Row {
        spacing: width * (1 - 2 * mARROW_SPACE_WIDTH) / (mNUMBER_SLOTS + (mNUMBER_SLOTS - 1) * mPADDING_BETWEEN_SLOTS) * mPADDING_TOP
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        BasicImageSource {
            id: mWindowArrowLeft

            opacity: getmIsCanSlide("R") ? 1 : 0
            visible: true
            sourceSimple: "librairies_basic/BasicScroll/" + "Scroll_Arrow_Left.png"
            widthPercent: mARROW_SPACE_WIDTH * mARROW_WIDTH_PERCENT
            xPercent: (mARROW_SPACE_WIDTH - widthPercent) * mARROW_LEFT_TO_RIGHT
            yPercent: (1 - heightPercent) / 2

            MouseArea {
                id: mMouseAreaArrowLeft

                anchors.fill: parent

                enabled: getmIsCanSlide("R")
                onClicked: {
                    slideLeftOrRight("R");
                }
            }
        }

        Repeater {
            id: slotRepeater
            model: mNUMBER_SLOTS

            delegate: BasicImageSource {
                id: slotItem

                sourceSimple: mSOURCE_SIMPLE_EMPTY_SLOTS
                fillMode: Image.Stretch

                // Sizing logic based on ratio
                property real lWidthTotalSlotsMax: mThisBasicScrollBarHorizontal.width * (1 - 2 * mARROW_SPACE_WIDTH)
                property real lWidthOneSlotMax: lWidthTotalSlotsMax / (mNUMBER_SLOTS + (mNUMBER_SLOTS - 1) * mPADDING_BETWEEN_SLOTS)
                property real lPaddingTop: mPADDING_TOP
                property real lHeightOneSlotMax: mThisBasicScrollBarHorizontal.height * (1 - 2 * lPaddingTop)

                property real slotWidth: {
                    if (mSLOT_RATIO_HEIGHT_TO_WIDTH === 0) return lWidthOneSlotMax;
                    let h = lHeightOneSlotMax;
                    let w = h / mSLOT_RATIO_HEIGHT_TO_WIDTH;
                    return (w > lWidthOneSlotMax) ? lWidthOneSlotMax : w;
                }

                property real slotHeight: {
                    return (mSLOT_RATIO_HEIGHT_TO_WIDTH === 0)
                        ? lHeightOneSlotMax
                        : slotWidth * mSLOT_RATIO_HEIGHT_TO_WIDTH;
                }

                width: slotWidth
                height: slotHeight
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        BasicImageSource {
            id: mWindowArrowRight

            opacity: getmIsCanSlide("L") ? 1 : 0
            visible: true
            sourceSimple: "librairies_basic/BasicScroll/" + "Scroll_Arrow_Right.png"
            widthPercent: mARROW_SPACE_WIDTH * mARROW_WIDTH_PERCENT
            xPercent: 1 - mARROW_SPACE_WIDTH + (mARROW_SPACE_WIDTH - widthPercent) * (1 - mARROW_LEFT_TO_RIGHT)
            yPercent: (1 - heightPercent) / 2

            MouseArea {
                id: mMouseAreaArrowRight

                anchors.fill: parent
                enabled: getmIsCanSlide("L")
                onClicked: {
                    slideLeftOrRight("L");
                }
            }
        }
    }

    // function drawInOneSlot(sIdxSlot, sBasicItemV2) {

    //     /*
    //       Compute the width & height maximum
    //       */
    //     let lWidthTotalSlotsMax = width * (1 - 2 * mARROW_SPACE_WIDTH);
    //     let lWidthOneSlotMax = lWidthTotalSlotsMax / (mNUMBER_SLOTS + (mNUMBER_SLOTS - 1) * mPADDING_BETWEEN_SLOTS);
    //     let lPaddingTop = mBasicNum.chooseNotNull(0, mPADDING_TOP);
    //     let lHeightOneSlotMax = height * (1 - 2 * lPaddingTop);
    //     /*
    //       Compute width & height
    //       */
    //     let lWidthOneSlot;
    //     let lHeightOneSlot;
    //     if (mSLOT_RATIO_HEIGHT_TO_WIDTH == 0) {
    //         lWidthOneSlot = lWidthOneSlotMax;
    //         lHeightOneSlot =lHeightOneSlotMax;
    //     } else {
    //         if (mSLOT_RATIO_HEIGHT_TO_WIDTH * lWidthOneSlotMax > lHeightOneSlotMax) {
    //             lHeightOneSlot = lHeightOneSlotMax;
    //             lWidthOneSlot = lHeightOneSlot / mSLOT_RATIO_HEIGHT_TO_WIDTH;
    //         } else {
    //             lWidthOneSlot = lWidthOneSlotMax;
    //             lHeightOneSlot = mSLOT_RATIO_HEIGHT_TO_WIDTH * lWidthOneSlot
    //         }
    //     }
    //     let lPaddingBetweenSlot = lWidthOneSlot * mPADDING_BETWEEN_SLOTS;
    //     /*
    //       Compute the real coordinates
    //       */
    //     let lWidthTotalSlots = mNUMBER_SLOTS * lWidthOneSlot + (mNUMBER_SLOTS - 1) * lPaddingBetweenSlot;
    //     let lX0 = (width - lWidthTotalSlots) / 2
    //     let lX = x + lX0 + sIdxSlot * (lWidthOneSlot + lPaddingBetweenSlot);
    //     let lY = y + (height - lHeightOneSlot) / 2;
    //     /*
    //       Transfer to the referential of sBasicItemV2
    //       */
    //     let lParent = sBasicItemV2.parent
    //     sBasicItemV2.widthPercent = lWidthOneSlot / lParent.width
    //     sBasicItemV2.xPercent = (lX - lParent.x) / lParent.width
    //     sBasicItemV2.heightPercent = lHeightOneSlot / lParent.height
    //     sBasicItemV2.yPercent = (lY - lParent.y) / lParent.height
    // }

    function setmIsVisibleBegintArrow(sIsVisible) {
       mWindowArrowLeft.opacity = sIsVisible ? 1 : 0
    }
    function setmIsVisibleEndtArrow(sIsVisible) {
        mWindowArrowRight.opacity = sIsVisible ? 1 : 0
    }


    /*
      Getters & Setters
      */
    function getmWindowArrowLeft() {
        return mWindowArrowLeft
    }
    function getmWindowArrowRight() {
        return mWindowArrowRight
    }
}
