import QtQuick
import Felgo
import Qt5Compat.GraphicalEffects
import "../../BasicImageHover/v1"
import "../../BasicText/v4"
import "../../BasicDebug/v1"

BasicImageHover {

    id: mThisBasicVideoJump

    /*
      Properties
      */
    property bool mIS_DEBUG: true
    property string mNameFile
    property string mLabel
    property int mJumpToMilliseconds
    property int mIdx
    property real mYPercentFromBottom
    property real xPercentIdeal
    property real xPercentCompute // so that we dont move the image while we are solving the optimaztion problem of positioning

    /*
      We mage the image square
      */
    height: width

    /**
      We make the image square
      */
    // y: parent.height - height * mYPercentFromBottom - height

    /*
      Set the border for hover
      */
    borderWidthPctMain: 0.02
    borderWidthPctHover: borderWidthPctMain
    radiusPct: 0.10
    borderColorMain: Qt.color("lightgrey")
    borderColorHover: borderColorMain
    borderColorHoverGlow: Qt.color("#8D0C73")

    /*
      Animation when we click
      */
    mIsBumpIfClick: true

    /**
      */
    onClicked: {
        parent.setmPosition(mJumpToMilliseconds)
    }

    /*
      Label
      */
    Item {
        id: mThisBackground

        width: parent.width - mParentBorder * 2
        height: parent.height * cBasicVideo.jump_LABEL_H + mRadius
        x: mParentBorder
        y: parent.height - height - mParentBorder
        opacity: cBasicVideo.jump_LABEL_OPACITY
        property real mParentBorder: mThisBasicVideoJump.borderWidthPctMain * Math.min(mThisBasicVideoJump.height, mThisBasicVideoJump.width)
        property real mRadius: mThisBasicVideoJump.radiusPct * mThisBasicVideoJump.height

        Rectangle {
            y: parent.mRadius
            x: 0
            width: parent.width
            height: parent.height - y
            color: cBasicVideo.jump_LABEL_COLOR_BACKGROUND
        }
        Rectangle {
            id: mThisMask

            visible: false
            anchors.fill: parent
            color: "green"
            radius: mThisBasicVideoJump.radiusPct * mThisBasicVideoJump.height
        }

        /*
          Mask
          */
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mThisMask
        }

    }
    BasicTextFitToWindowHeight {
        text: parent.mLabel
        heightPercent: cBasicVideo.jump_LABEL_H
        yPercent: 1 - heightPercent
        textColor: cBasicVideo.jump_LABEL_COLOR_TEXT
        textIsAlignToCenterH: true
        textIsAlignToTop: true
        textFontPixelSizePercent: 0.16
    }

    /**

      */
    function initiateBasicVideoJump(sNameFile, sSubFolder) {
        mNameFile = sNameFile;
        /*
          Parse the name of the file to get the timestamp where we should jump
          */
        let lNameShort = mNameFile;
        lNameShort = sNameFile.substring(0, sNameFile.length - ".jpg".length)
        let lArray = lNameShort.split("_")
        /*
          Check array
          */
        if (!lArray.includes("LABEL") || !lArray.includes("MMSS")) {
            mBasicDisplay.error(mThisBasicVideoJump, "The name of the file should contain LABEL and MMSS"
                                + "\nmNameFile= " + mNameFile)
        }
        /*
          Extract label
          */
        mLabel = lArray[lArray.indexOf("LABEL") + 1];
        /*
          Extract the time stamp
          */
        let lMMSS = lArray[lArray.indexOf("MMSS") + 1];
        let lMM = +lMMSS.substring(0, 2)
        let lSS = +lMMSS.substring(2, 4)
        mJumpToMilliseconds = ((lMM * 60) + lSS) * 1000
        /*
          Set the source of the image
          */
        mSourceMain = sSubFolder + mNameFile;
    }

    /*
      */
    function vString() {
        return "mNameFile= " + mNameFile
                + "; mJumpToMilliseconds= " + mJumpToMilliseconds
                + "; mLabel= " + mLabel
    }

    /*
      Getters & Setters
      */
    function getmJumpToMilliseconds() {
        return mJumpToMilliseconds;
    }
    function getXPercent() {
        return xPercent
    }
    function setXPercent(sXPercent) {
        xPercent = sXPercent;
    }
    function getXPercentIdeal() {
        return xPercentIdeal
    }
    function setXPercentIdeal(sXPercentIdeal) {
        xPercentIdeal = sXPercentIdeal;
    }
    function getXPercentCompute() {
        return xPercentCompute
    }
    function setXPercentCompute(sXPercentCompute) {
        xPercentCompute = sXPercentCompute;
    }
}

