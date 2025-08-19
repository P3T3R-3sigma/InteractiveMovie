import QtQuick
import Felgo

Item {

    id: mTHIS_BASICIMAGE_SOURCE_MANAGER_V2

    /*
      Constants
      */
    property bool mIS_COMMUNICATION: false
    property bool mIS_AUTO_LOAD: true
    property bool mIS_AUTO_LOAD_COMM: true
    /*
      Variables
      */
    property var mListBasicImageSource:[] // can be any image - but need the function

    Component.onCompleted: {
        if (mIS_AUTO_LOAD) {
            mTIMER_AUTO_LOAD.start()
        }
    }

    /**
      Check if we need to load a new image
      We cannot load all the images together because it freezes the process
      this timer allows to have a sleep time (the interval of the timer) bewteen 2 downloads
      */
    Timer {
        id: mTIMER_AUTO_LOAD

        interval: 60

        onTriggered: {
            /*
              Chekc for the next image to download or stop if there is one pending
              */
            let lIsBasicImageFound = false
            let lPriorityDownloadCurrent = -1;
            let lBasicImageSourceToLoadIfFreeTime
            for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
                let lBasicImageSource = mListBasicImageSource[lIdx];
                if (!lIsBasicImageFound) {
                    /*
                        Case we have one image pending --> we stop the search, and we exit
                        */
                    if (lBasicImageSource.getmIsLoading()) {
                        lBasicImageSourceToLoadIfFreeTime = null
                        lIsBasicImageFound = true
                    }
                    /*
                        We look for the first image not loaded and not started
                        */
                    if (!lBasicImageSource.getmIsReady()
                            && lBasicImageSource.getmIsInStartingBlocks()
                            && isMorePriority(lBasicImageSource.getmPriorityToDownload(), lPriorityDownloadCurrent)) {
                        lBasicImageSourceToLoadIfFreeTime = lBasicImageSource
                        lPriorityDownloadCurrent = lBasicImageSourceToLoadIfFreeTime.getmPriorityToDownload()
                    }
                }
            }
            /*
             Load the first image encountered since we have spare time
             */
            if (mBasicNum.isNotNull(lBasicImageSourceToLoadIfFreeTime)) {
                lBasicImageSourceToLoadIfFreeTime.forceDownload();
            }
            //////////////////////////////////////////////////////////////////////////////////////////
            if (mIS_AUTO_LOAD_COMM) {
                /*
                  Initiate for com
                  */
                let lQtyVisible = 0
                let lQtyNotStarted = 0
                let lQtyLoading = 0
                let lQtyLoaded = 0
                let lQtyVisibleNotLoaded = 0
                let lMapPriorityToQtyLoaded = new Map()
                let lMapPriorityToQtyNotStarted = new Map()
                let lPriorityMax = -1
                /*
                 Counts various metrics for the communication
                 */
                for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
                    let lBasicImageSource = mListBasicImageSource[lIdx];
                    /*
                     Count for com
                     */
                    let lPriority = lBasicImageSource.getmPriorityToDownload()
                    lPriorityMax = Math.max(lPriority, lPriorityMax)
                    if (lBasicImageSource.visible) {
                        lQtyVisible++;
                        if (!lBasicImageSource.getmIsReady()) {
                            lQtyVisibleNotLoaded++;
                        }
                    }
                    if (lBasicImageSource.getmIsSourceDefined()) {
                        if (lBasicImageSource.getmIsReady()) {
                            lQtyLoaded++;
                            let lPriorityQtyLoaded = lMapPriorityToQtyLoaded.get(lPriority)
                            if (mBasicNum.isNull(lPriorityQtyLoaded)) {
                                lPriorityQtyLoaded = 0;
                            }
                            lPriorityQtyLoaded++;
                            lMapPriorityToQtyLoaded.set(lPriority, lPriorityQtyLoaded);
                        } else {
                            lQtyLoading++;
                        }
                    } else {
                        lQtyNotStarted++;
                        let lPriorityQtyNotStarted = lMapPriorityToQtyNotStarted.get(lPriority)
                        if (mBasicNum.isNull(lPriorityQtyNotStarted)) {
                            lPriorityQtyNotStarted = 0;
                        }
                        lPriorityQtyNotStarted++;
                        lMapPriorityToQtyNotStarted.set(lPriority, lPriorityQtyNotStarted);
                    }
                }
                /*
                    Display progress
                */
                let lTotalSize = mListBasicImageSource.length
                if (mIS_AUTO_LOAD_COMM) {
                    let lText = "BasicSourceManager >> Qty Images= " + lTotalSize
                        + "; Visible= " + lQtyVisible
                        + "; Visible not loaded= " + lQtyVisibleNotLoaded
                        + "; Not started= " + lQtyNotStarted
                        + "; Loading= " + lQtyLoading
                        + "; Loaded= " + lQtyLoaded
                        + "; Loaded= " + mBasicDisplay.displayPercent(lQtyLoaded / lTotalSize)
                        + "; Not started= " + displayMap(lMapPriorityToQtyNotStarted, lPriorityMax)
                        + "; Loaded= " + displayMap(lMapPriorityToQtyLoaded, lPriorityMax)
                        + "; "
                    console.log(lText)
                }
            }
            //////////////////////////////////////////////////////////////////////////////////////////
            /*
              Restart only if there is at least one image not loaded
              */
            if (lIsBasicImageFound || mBasicNum.isNotNull(lBasicImageSourceToLoadIfFreeTime)) {
                mTIMER_AUTO_LOAD.start();
            }
        }
    }

    /*
      */
    function isMorePriority(sInt1, sInt2) {
        if (sInt1 == -1) {
            if (sInt2 == -1) {
                return true;
            } else {
                return false
            }
        } else {
            if (sInt2 == -1) {
                return true
            } else {
                return sInt1 < sInt2
            }
        }
    }

    /*
      For display only
      */
    function displayMap(sMap, sPriorityMax) {
        let lDisplay = "["
        for (let lIdx = -1; lIdx <= sPriorityMax; lIdx++) {
            let lValue = sMap.get(lIdx);
            if (mBasicNum.isNull(lValue)) {
                lValue = 0
            }
            lDisplay += "p" + lIdx + "= " + lValue
            if (lIdx < sPriorityMax) {
                lDisplay += ", ";
            }
        }
        lDisplay += "]"
        return lDisplay
    }

    /**
      Store the BasicImageSource in a list and start the auto loader
      */
    function declareImage(sBasicImageSource) {
        /*
          Check if IMage is already in the list
          */
        for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
            let lBasicImageSource = mListBasicImageSource[lIdx];
            if (lBasicImageSource === sBasicImageSource) {
                return;
            }
        }
        /**
          Add new image to the list
          */
        mListBasicImageSource.push(sBasicImageSource);
        /**
          Communication
          */
        if (mIS_AUTO_LOAD_COMM) {
            console.log("Image added to the watch list= "
                        + sBasicImageSource
                        + "; Name= " + sBasicImageSource.getName());
        }
        /*
          Auto load (when we have spare time, we download one random image not loaded)
          */
        if (mIS_AUTO_LOAD && !mTIMER_AUTO_LOAD.running) {
            mTIMER_AUTO_LOAD.running = true;
        }
    }

    /**
      Create and return BasicImageSource
      */
    function createImage(sParent, sSource) {
        let lComponent = Qt.createComponent("BasicImageSource.qml");
        let lBasicImageSource = lComponent.createObject(sParent);
        lBasicImageSource.mSource = sSource
        return lBasicImageSource;
    }

    /*
      Getters & Setters
      */
    function getmListBasicImageSource() {
        return mListBasicImageSource
    }

}

