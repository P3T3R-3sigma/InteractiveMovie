import QtQuick
import Felgo
import "../../BasicText/v4"
import "../../BasicSubWindow/v3"

Item {

    /*
      Example:
                LNgLockNumbers {
                    id: mThisLockNumbers

                    width: parent.width
                    height: parent.height
                    mArraySolution: [9, 8, 6, 9]

                    mPaddingPercent: 7 / 64
                    mBorderWidthPercent: 0.002

                    mColorCommBackground: "transparent"
                    mColorCommBorder: "transparent"
                    mColorCommText: "black"

                    mIsForceFocusAtStart: true
                }

      */

    id: mThisLockCodeNumbers

    /*
      Signals
      */
    signal success
    signal failure
    signal thisFocusChanged
    /*
      Controls
      */
    property var mArraySolution: []
    /*
      Controls - optional
      */
    property real mPaddingPercent: 0.68
    property real mRatioHeightOnWidth: 1.32
    property real mBorderWidthPercent: 0.002
    property color mColorText: Qt.color("black")
    property color mColorTextIfNotEnabled: Qt.color("grey")
    property color mColorBackground: Qt.color("white")
    property color mColorBorder: Qt.color("black")
    property real mRadiusPercentHeight: 0.10
    property real mHomothetiaComWindow: 0 // when the code is input, then we hide the keys and display a failure/success message. This message has the size of the homothetia and is centered on mThisLockCodeNumbers
    /*
      Communication window
      */
    property color mColorCommText: mColorText
    property color mColorCommTextIfNotEnabled: mColorTextIfNotEnabled
    property color mColorCommBackground: mColorBackground
    property color mColorCommBorder: mColorBorder
    property real mCommPaddingPercentWidth
    property real mCommPaddingPercentHeight
    /*
      Focus (keyboard)
      */
    property bool mIsForceFocusAtStart
    /*
      Variables
      */
    property var mListLNgKeyInput:[]
    property var mListInputs: []

    /*
      Call the resizing of all the LNgKeyInput
      */
    onVisibleChanged: {
        if (visible) {
            reset();    // we dont keep any memory of the inputs
            computeSizePlace()
            focus = mIsForceFocusAtStart
        }
        ////////////////////////
        console.log("focus= " + mThisLockCodeNumbers.activeFocus)
        ////////////////////////
    }
    onXChanged: {
        computeSizePlace()
    }
    onYChanged: {
        computeSizePlace();
    }
    onWidthChanged: {
        computeSizePlace();
    }
    onHeightChanged: {
        computeSizePlace();
    }

    /*
      Case we restart the game
      */
    function reset() {
        mListInputs = [];
        for (let lIdx = 0; lIdx < mListLNgKeyInput.length; lIdx++) {
            mListLNgKeyInput[lIdx].text = " ";
        }
        setmVisibleWindows(true);
        mBasicTextCommWindow.text = "";
        mBasicTextCommWindow.visible = false;
    }

    /*
      Create the graphical keys
      */
    onMArraySolutionChanged: {
        if (mListLNgKeyInput.length != mArraySolution.length) {
            let lComponent = Qt.createComponent("BasicLockNumbersKeyInput.qml")


            // let lComponent = Qt.createComponent("../../../librairies_basic/BasicText/v4/" + "BasicTextFitToWindow.qml")

            for (let lIdx = mListLNgKeyInput.length; lIdx < mArraySolution.length; lIdx++) {
                let lLNKeyInput = lComponent.createObject(mThisLockCodeNumbers);
                mListLNgKeyInput.push(lLNKeyInput);
            }
            computeSizePlace();
        }
    }

    /**
      Place and size + compute the size of each
      */
    function computeSizePlace() {
        let lSize = mListLNgKeyInput.length;
        /**
          Compute the ideal size
          */
        let lHeightWished = height;
        let lWidthWished = lHeightWished / mRatioHeightOnWidth;
        let lTotalWidthWished = lWidthWished * lSize + lWidthWished * mPaddingPercent * (lSize - 1);
        /**
          Ratio to fit to the window
          */
        let lRatioFromHeight = Math.min(1, height / lHeightWished);
        let lRatioFromWidth = Math.min(1, width / lTotalWidthWished);
        let lRatio = Math.min(lRatioFromWidth, lRatioFromHeight);
        /**
          Actual sizes with the correction to fit to the window
          */
        let lHeigth = lHeightWished * lRatio;
        let lWidth = lWidthWished * lRatio;
        let lPadding = lWidth * mPaddingPercent;
        let lTotalWidth = lWidth * lSize + lPadding * (lSize - 1);
        let lX = (width - lTotalWidth) / 2;
        let lY = (height - lHeigth) / 2;
        /**
          Initiate the graphics of KeyInput
          */
        for (let lIdx = 0; lIdx < lSize; lIdx++) {
            let lLNgKeyInput = mListLNgKeyInput[lIdx]
            /*
              Place and size
              */
            lLNgKeyInput.visible = true
            lLNgKeyInput.x = lX;
            lLNgKeyInput.y = lY;
            lLNgKeyInput.width = lWidth;
            lLNgKeyInput.height = lHeigth;
            lX += lWidth + lPadding;
        }
    }


    Keys.onPressed: (event) => {
                        if (!event.isAutoRepeat && !pTimerFailure.running && !pTimerSuccess.running) {
                            if (event.key === Qt.Key_0) {
                                addNewInput(0);
                            } else if (event.key === Qt.Key_1) {
                                addNewInput(1);
                            } else if (event.key === Qt.Key_2) {
                                addNewInput(2);
                            } else if (event.key === Qt.Key_3) {
                                addNewInput(3);
                            } else if (event.key === Qt.Key_4) {
                                addNewInput(4);
                            } else if (event.key === Qt.Key_5) {
                                addNewInput(5);
                            } else if (event.key === Qt.Key_6) {
                                addNewInput(6);
                            } else if (event.key === Qt.Key_7) {
                                addNewInput(7);
                            } else if (event.key === Qt.Key_8) {
                                addNewInput(8);
                            } else if (event.key === Qt.Key_9) {
                                addNewInput(9);
                            } else if (event.key === Qt.Key_Minus) {
                                addNewInput("-");
                            } else if (event.key === Qt.Key_Delete || event.key === Qt.Key_Backspace) {
                                deleteOneNumber();
                            }
                        }
                    }

    function deleteOneNumber() {
        if (mListInputs.length > 0) {
            writeNumber(mListInputs.length - 1, "");
            mListInputs.pop();
        }
    }

    function addNewInput(sInteger) {
        writeNumber(mListInputs.length, "" + sInteger);
        mListInputs.push(sInteger);
        /**
          If we entered all the digits, then we check that it is correct
          */
        if (mListInputs.length == mArraySolution.length) {
            for (let lIdx = 0; lIdx < mListInputs.length; lIdx++) {
                if (mListInputs[lIdx] != mArraySolution[lIdx]) {
                    /**
                      Communication if the user input the wrong number
                      */
                    comIfLose();
                    /**
                      Start timer
                      */
                    pTimerFailure.start();
                    return;
                }
            }
            comIfWin();
            pTimerSuccess.start();
        }
    }

    function writeNumber(sIdxWindow, sTextNumber) {
        let LNgKeyInput = mListLNgKeyInput[sIdxWindow];
        LNgKeyInput.text = sTextNumber;
    }

    MouseArea {
        id: mMouseArea

        anchors.fill: parent
        onClicked: {
            parent.focus = true
        }
    }

    Timer {
        id: pTimerSuccess
        interval: 1000
        onTriggered: {
            mBasicTextCommWindow.text = "";
            mBasicTextCommWindow.visible = false;
            setmVisibleWindows(true)
            success();
        }
    }

    Timer {
        id: pTimerFailure
        interval: 2000
        onTriggered: {
            reset();
            failure();
        }
    }

    /**
      Communication -> we hide the keys and we show a message success/failure
      */
    BasicTextFitToWindow {
        id: mBasicTextCommWindow

        visible: false
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: parent.width * (1 + mHomothetiaComWindow)
        height: parent.height * (1 + mHomothetiaComWindow)

        textIsAlignToCenter: true
        // textFont: mFontLoaderDefault_PlainBold.font
        textColor: parent.mColorCommText
        backgroundColor: parent.mColorCommBackground
        borderColor: parent.mColorCommBorder
        borderWidthPercent: parent.mBorderWidthPercent
        radiusPctHeight: parent.mRadiusPercentHeight
        radiusInteriorPctHeight: radiusPctHeight
        paddingPercentWidth: parent.mCommPaddingPercentWidth
        paddingPercentHeight: parent.mCommPaddingPercentHeight

    }

    function comIfLose() {
        setmVisibleWindows(false);
        mBasicTextCommWindow.visible = true;
        mBasicTextCommWindow.text = "Wrong Code!";
    }

    function comIfWin() {
        setmVisibleWindows(false);
        mBasicTextCommWindow.visible = true;
        mBasicTextCommWindow.text = "Success!";
    }

    function setmVisibleWindows(sVisible) {
        for (let lIdx = 0; lIdx < mListLNgKeyInput.length; lIdx++) {
            mListLNgKeyInput[lIdx].visible = sVisible;
        }
    }

    /*
      Focus is used if we have several code windows
      */
    onFocusChanged: {

        ///////////////
        console.log("<focus= " + mThisLockCodeNumbers.activeFocus)
        ///////////////
        if (enabled) {
            if (focus) {
                for (let lIdx = 0; lIdx < mListLNgKeyInput.length; lIdx++) {
                    mListLNgKeyInput[lIdx].textColor = mColorText;
                }
            } else {
                for (let lIdx = 0; lIdx < mListLNgKeyInput.length; lIdx++) {
                    mListLNgKeyInput[lIdx].textColor = mColorTextIfNotEnabled;
                }
            }
        }
        thisFocusChanged();

        ///////////////
        console.log(">focus= " + mThisLockCodeNumbers.activeFocus)
        ///////////////
    }

    /**
      Getters & Setters
      */
    function getmMouseArea() {
        return mMouseArea;
    }




}



