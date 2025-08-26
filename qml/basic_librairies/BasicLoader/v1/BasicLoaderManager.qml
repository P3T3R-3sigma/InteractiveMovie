import QtQuick
import Felgo
import "../../BasicSprites/v3"
import "../../BasicText/v4"

Item {

    /*
        an Item contains a method getmListItemToCheckIfLoaded() of items to check and which contains this function 'getmListItemToCheckIfLoaded'

      */

    id: mTHIS_BASIC_LOADER

    /*
      Controls
      */
    property int mCheckInterval: 1000
    property int mNumOfRetry: 0
    property int mNUMBER_OF_RETRY_FOR_TIMEOUT_ERROR: 100
    property int mNUMBER_OF_RETRY_FOR_LOADING_SCREEN_SPRITE: 10
    property int mTIME_OUT: 10 * 1000 // in milliseconds. If the image takes more than TIME_OUT to download, we issue an error message
    property int mLoaderSpriteStartime: 1000
    property bool mIS_DEBUG: true
    property bool mIS_DEBUG_INITIAL_LIST: false
    property string mSOURCE_SIMPLE_SPRITE: mBasicSource.getSource("Sprites/Timer/sandglass.jpg")
    /*
      Variables
      */
    property var mItemToLoad
    property var mItemReflection
    property string mFunctionReflection
    property var mListItemToCheckIfLoaded           // each item to check must have a "forceDownload()" and "CancelDownload()" and "getmIsReady()" and a list "mListItemToCheckIfLoaded" (if the list is empty, then we chekc the item itself)

    visible: false
    z: 10000000
    anchors.fill: parent

    /*
      Controls - we should call this function
      */
    function startCheck(sItemToLoad, sFunctionReflection, sItemReflection) {
        mItemToLoad = sItemToLoad;
        if (sItemReflection) {
            mItemReflection = sItemReflection;
        } else {
            mItemReflection = sItemToLoad
        }
        mFunctionReflection = sFunctionReflection ? sFunctionReflection : ""
        /*
          Check if the items are loaded
          */
        mListItemToCheckIfLoaded = []
        buildmListItemToCheckIfLoaded(sItemToLoad, sItemToLoad);
        /*
          Communication
          */
        if (mIS_DEBUG) {
            console.log();
            console.log("List items to check:")
            for (let lIdx = 0; lIdx < mListItemToCheckIfLoaded.length; lIdx++) {
                let lItemToCheck = mListItemToCheckIfLoaded[lIdx];
                console.log(">>" + lItemToCheck)
            }
        }
        /*
          */
        if (getmIsReady()) {
            callRelflection();
        } else {
            /*
              Show the screen 'loading'
              */
            visible = true
            /*
              Launch timer
              */
            mTIMER_CALL_CHECK.start()
            /*
              Force download of all sources
              */
            forceDownload();
        }
    }

    /**
        @DEPRECATED
        Check the functions are existing in the item which we are supposed to load
      */
    function check(sItemToLoad) {
        let lNameFunction = "getmName"
        if (typeof sItemToLoad[lNameFunction] !== "function") {
            mBasicDisplay.error(mTHIS_BASIC_LOADER, "The function '" + lNameFunction + "' is missing in the item '" + sItemToLoad + "'")
        }
        lNameFunction = "getmIsReady"
        if (typeof sItemToLoad[lNameFunction] !== "function") {
            mBasicDisplay.error(mTHIS_BASIC_LOADER, "The function '" + lNameFunction + "' is missing in the item '" + sItemToLoad + "'")
        }
        lNameFunction = "forceDownload"
        if (typeof sItemToLoad[lNameFunction] !== "function") {
            mBasicDisplay.error(mTHIS_BASIC_LOADER, "The function '" + lNameFunction + "' is missing in the item '" + sItemToLoad + "'")
        }
        lNameFunction = "cancelDownload"
        if (typeof sItemToLoad[lNameFunction] !== "function") {
            mBasicDisplay.error(mTHIS_BASIC_LOADER, "The function '" + lNameFunction + "' is missing in the item '" + sItemToLoad + "'")
        }
    }

    /*
      Build a list of all the items to check
      */
    function buildmListItemToCheckIfLoaded(sItemToCheck, sSender) {
        /*
          Check exisiting functions
          */
        let lNameFunction = "getmListItemToCheckIfLoaded"
        if (typeof sItemToCheck[lNameFunction] !== "function") {
            mBasicDisplay.error(mTHIS_BASIC_LOADER, "The function '" + lNameFunction + "' is missing in the item '" + sItemToCheck + "'"
                                + "\nmItemToLoad= " + mItemToLoad
                                + "\nmItemReflection= " + mItemReflection
                                + "\nmFunctionReflection= " + mFunctionReflection
                                + "\nmListItemToCheckIfLoaded= " + (mListItemToCheckIfLoaded ? mListItemToCheckIfLoaded.length : mListItemToCheckIfLoaded))
            mBasicDisplay.toConsoleKnowItem(sItemToCheck)
            mBasicDisplay.toConsoleKnowItem(sSender)
        }
        /*
          Check all functions are here
          */
        let lIsItemToCheckLoadingOrContainer = true
        if (typeof sItemToCheck["getmName"] !== "function") {
            lIsItemToCheckLoadingOrContainer = false;
        } else if (typeof sItemToCheck["getmIsReady"] !== "function") {
            lIsItemToCheckLoadingOrContainer = false;
        } else if (typeof sItemToCheck["forceDownload"] !== "function") {
            lIsItemToCheckLoadingOrContainer = false;
        } else if (typeof sItemToCheck["cancelDownload"] !== "function") {
            lIsItemToCheckLoadingOrContainer = false;
        }
        /*
          Add to list
          */
        if (lIsItemToCheckLoadingOrContainer && !mListItemToCheckIfLoaded.includes(sItemToCheck)) {
            if (mIS_DEBUG) {
                console.log("ADD: ", sItemToCheck)
            }

            mListItemToCheckIfLoaded.push(sItemToCheck)
            /*

              */
            let lListItemToCheckIfLoaded = sItemToCheck.getmListItemToCheckIfLoaded();
            /*
              Recursivity: Case there is a list (the item contains several items to check --> we call them recursively
              */
            for (let lIdx = 0; lIdx < lListItemToCheckIfLoaded.length; lIdx++) {
                let lItemToCheck = lListItemToCheckIfLoaded[lIdx]
                if (lItemToCheck) {
                    if (lItemToCheck !== sItemToCheck) {
                        buildmListItemToCheckIfLoaded(lItemToCheck, sItemToCheck);
                    }
                }
            }
        }
        /*
          */
        if (mIS_DEBUG || mIS_DEBUG_INITIAL_LIST) {
            console.log()
            console.log("mListItemToCheckIfLoaded.length= " + mListItemToCheckIfLoaded.length)
            console.log("mListItemToCheckIfLoaded.includes(sItemToCheck)= " + mListItemToCheckIfLoaded.includes(sItemToCheck))
            console.log("sItemToCheck= " + sItemToCheck);
            console.log("List items to check:")
            for (let lIdx = 0; lIdx < mListItemToCheckIfLoaded.length; lIdx++) {
                let lItemToCheck = mListItemToCheckIfLoaded[lIdx];
                if (typeof lItemToCheck["getmSource"] === "function") {
                    console.log(">" + lItemToCheck + "; mSource= " + lItemToCheck.getmSource())
                } else {
                    console.log(">" + lItemToCheck)
                }
            }
        }
    }

    /*
      We call in loop the timer until the assets are loaded
      */
    Timer {
        id: mTIMER_CALL_CHECK

        interval: mCheckInterval
        onTriggered: {
            mNumOfRetry++
            /*
              DEBUG
              */
            if (mIS_DEBUG) {
                toConsole()
            }
            /*
              Check if all sources have been downloaded
              */
            checkForReady();
            /*

              */
            if (getmIsReady()) {
                callRelflection();
            } else {
                if (mNumOfRetry === mNUMBER_OF_RETRY_FOR_LOADING_SCREEN_SPRITE) {
                    mSPRITE_SANDGLASS.visible = true
                    mSPRITE_SANDGLASS.running = true
                } else if (mNumOfRetry === mNUMBER_OF_RETRY_FOR_TIMEOUT_ERROR) {
                    timeoutErrorMessage.visible = true
                }
                mTIMER_CALL_CHECK.start();
            }
        }
    }

    Item {
        anchors.fill: parent
        BasicTextFitToWindowWidth {
            id: timeoutErrorMessage
            yPercent: 0.15
            widthPercent: 0.20
            text: "Time out error.\nPlease check your internet connection."
            backgroundColor: "red"
            textColor: "black"
            textIsAlignToCenterH: true
            paddingPercentHeight: 0.02
            paddingPercentWidth: 0.02
            borderColor: "white"
            borderWidthPercent: 0.02
            textFontPixelSizePercent: 0.02
            textIsWrapped: true
            visible: false
        }
    }

    /**
      Loading sprite to let know the Gamer that we are loading assets
      */
    AnimatedSprite {
        id: mSPRITE_SANDGLASS

        source: "../../../../assets/wait_download_492_38_12_1.png"
        frameCount: 12
        frameWidth: 41 // 305 / 5
        frameHeight: 38 // 164 / 2

        width: parent.width * 0.10
        height: frameHeight / frameWidth * width

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        interpolate: false
        running: false
        visible: false

    }

    /*
      Check if the item is loaded
      */
    function checkForReady() {
        for (let lIdx = 0; lIdx < mListItemToCheckIfLoaded.length; lIdx++) {
            let lItemToCheck = mListItemToCheckIfLoaded[lIdx]
            lItemToCheck.setmIsReady(lItemToCheck.checkForReady())
        }
    }

    /**
      We are ready when there is not any sub item which are not ready
      */
    function getmIsReady() {
        /*
          Check if they are ready
          */
        for (let lIdx = 0; lIdx < mListItemToCheckIfLoaded.length; lIdx++) {
            let lItemToCheck = mListItemToCheckIfLoaded[lIdx]
            if (!lItemToCheck.getmIsReady()) {
                return false;
            }
        }
        return true
    }

    /**
      */
    function forceDownload() {
        for (let lIdx = 0; lIdx < mListItemToCheckIfLoaded.length; lIdx++) {
            let lItemToCheck = mListItemToCheckIfLoaded[lIdx]
            lItemToCheck.forceDownload();
            /*
              Communication
              */
            if (mIS_DEBUG) {
                console.log("Force download for " + lItemToCheck)
            }
        }
    }

    /*
      Hide the previous item, this waiting screen, and show the new item
      */
    function callRelflection() {
        /*
          Communication
          */
        if (mIS_DEBUG) {
            console.log()
            console.log("Successfully loaded " + mItemToLoad)
        }
        /*
          Hide the loading screen
          */
        visible = false;
        mSPRITE_SANDGLASS.running = false
        mSPRITE_SANDGLASS.visible = false
        timeoutErrorMessage.visible = false
        mNumOfRetry = 0
        /*
          Call reflection
          */
        if (mItemReflection && mFunctionReflection) {
            if (mFunctionReflection === "visible") {
                mItemReflection.visible = true
            } else {
                let lIsReflectSuccess = mItemReflection[mFunctionReflection].apply(mItemReflection);
            }
        }
    }

    /*
      Display status in console
      */
    function toConsole() {
        console.log()
        for (let lIdx = 0; lIdx < mListItemToCheckIfLoaded.length; lIdx++) {
            let lItemToCheck = mListItemToCheckIfLoaded[lIdx]
            let lText = "\n"
                + lItemToCheck
                + "\nname= " + lItemToCheck.getmName()
                + "\nmIsReady= " + lItemToCheck.getmIsReady();
            if (!lItemToCheck.getmIsReady()) {
                lText += "\n"
                if (typeof lItemToCheck["vStringErrorDownload"] === "function") {
                    lText += lItemToCheck.vStringErrorDownload()
                } else {
                    lText += "No function 'vStringErrorDownload()' present in the item"
                }
            }
            console.log(lText)
        }
    }

    /*
      Getters & Setters
      */
    function getmTIME_OUT() {
        return mTIME_OUT
    }

}
