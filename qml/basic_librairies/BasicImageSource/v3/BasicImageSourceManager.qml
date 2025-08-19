import QtQuick
import Felgo

Item {

    id: mTHIS_BASICIMAGE_SOURCE_MANAGER_V3

    /*
      Signal
      */
    signal timeOut(string sMsg)
    /*
      Constants
      */
    property bool mIS_COMMUNICATION: false
    property bool mIS_AUTO_LOAD: true
    property bool mIS_AUTO_LOAD_COMM: true
    property int mTIME_OUT: 10 * 1000 // in milliseconds. If the image takes more than TIME_OUT to download, we issue an error message
    property int mTIME_BEFORE_NEXT_TRY_DOWNLOAD: 1000
    /*
      Variables
      */
    property var mListBasicImageSource:[] // can be any image - but need the function
    property var mBasicImageSourceLoading
    property var mBasicImageSourceLoadingTimeOut
    property int mTimeDownloadMax
    property int mTimeDownloadAverage
    property int mTimeDownloadCount


    Component.onCompleted: {
        startTimerIfAutoLoad();
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
                        /*
                          Check for time out
                          */
                        if (lBasicImageSource.getmIsTimerOut()) {
                            /*
                              Console
                              */
                            let lText = "Time out"
                            + "\nlBasicImageSource= " + lBasicImageSource.getmName()
                            + "\nTime elapsed= " + mBasicDisplay.getmTimeHHMMSSsss(lBasicImageSource.getmTimeSinceStartDownlad())
                            + "\nTime_out limit= " + mBasicDisplay.getmTimeHHMMSSsss(mTIME_OUT)
                            mBasicDisplay.error(mTHIS_BASICIMAGE_SOURCE_MANAGER_V3, lText)
                            /*
                              Signal
                              */
                            let lMsg = "Time out. Please check your internet connection, time to load images is too long. Relaunching requests"
                                + "\nTime waited= " + mBasicDisplay.getmTimeHHMMSSsss(lBasicImageSource.getmTimeSinceStartDownlad())
                            timeOut(lMsg)
                            /*
                              Cancel download and retry after the delay
                              */
                            lBasicImageSource.cancelAndRetry(mTIME_BEFORE_NEXT_TRY_DOWNLOAD)
                        }
                    }
                    /*
                        We look for the first image not loaded and not started
                        */
                    if (!lBasicImageSource.getmIsImageLoaded()
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
            if (lBasicImageSourceToLoadIfFreeTime) {
                lBasicImageSourceToLoadIfFreeTime.forceDownload();
                if (mIS_AUTO_LOAD_COMM) {
                    // console.log();
                    // console.log("lBasicImageSourceToLoadIfFreeTime= " + lBasicImageSourceToLoadIfFreeTime.vStringStatus())
                    // console.log("lBasicImageSourceToLoadIfFreeTime= " + lBasicImageSourceToLoadIfFreeTime + "; .parent= " + lBasicImageSourceToLoadIfFreeTime.parent)
                    // console.log("lBasicImageSourceToLoadIfFreeTime.source= " + lBasicImageSourceToLoadIfFreeTime.getmSource());
                }
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
                        if (!lBasicImageSource.getmIsImageLoaded()) {
                            lQtyVisibleNotLoaded++;
                        }
                    }
                    if (lBasicImageSource.getmIsSourceDefined()) {
                        if (lBasicImageSource.getmIsImageLoaded()) {
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
                        + "; Time avg= " + mBasicDisplay.getmTimeMMSSsss(mTimeDownloadAverage)
                        + "; Time max= " + mBasicDisplay.getmTimeMMSSsss(mTimeDownloadMax)
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
                        + "; Name= " + sBasicImageSource.getmName());
        }
        /*
          Auto load (when we have spare time, we download one random image not loaded)
          */
        startTimerIfAutoLoad();
    }

    /*
      Start timer to auto-load
      */
    function startTimerIfAutoLoad() {
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
      Update data of download, in case we want to display
      */
    function storeTimeDownload(sBasicImageSource) {
        if (mIS_AUTO_LOAD_COMM) {
            let lTimeElapsedDownload = sBasicImageSource.getmTimeElapsedDownload()
            mTimeDownloadMax = Math.max(mTimeDownloadMax, lTimeElapsedDownload)
            mTimeDownloadAverage = (mTimeDownloadAverage * mTimeDownloadCount + lTimeElapsedDownload) / (mTimeDownloadCount + 1)
            mTimeDownloadCount++;
        }
    }

    /*
      Getters & Setters
      */
    function getmListBasicImageSource() {
        return mListBasicImageSource
    }
    function getmTIME_OUT() {
        return mTIME_OUT;
    }
}

