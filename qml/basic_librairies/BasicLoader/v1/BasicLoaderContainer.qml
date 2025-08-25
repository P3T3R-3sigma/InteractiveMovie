import QtQuick
import Felgo

Item {

    id: mTHIS_BASICLOADER_CONTAINER

    /**
        Use to contain an item which needs a download (Image, Sprite, etc.)

        Defining the source will trigger a download. We keep the source in mSource until we call the forceDownload function
      */

    /*
      Controls
      */
    property bool mIS_DEBUG: false
    property var mItemWithSource        //  the item to which we should set the source
    property string mFolderRoot: ""
    property string mSource             // should be set at start
    property string sourceSimple        // should be set at start
    property int mPriorityToDownload: -1     // -1 --> at the end // the lower the number, the quicker the image will be in the list of download. By default, it will be changed to max priority
    /*
      Variables
      */
    property string mName
    property int mRetryInterval: 10000
    property int mTimeElapsedDownload: -1
    property var shadow_timerStartTime
    property var shadow_timerTimeOut
    /*
      Signal given by the ItemWithSource
      */
    property bool mIsReady
    /*
      Override - compulsory
      */
    function checkForReady() { // should return a bool: true if ready, false if not ready
        mBasicDisplay.errorOverride(mTHIS_BASICLOADER_CONTAINER, "checkForReady")
    }
    function vStringErrorDownload() {
        mBasicDisplay.errorOverride(mTHIS_BASICLOADER_CONTAINER, "vStringErrorMsg")
    }

    /*
      Signal sent by the ItemWithSource
      */
    onMIsReadyChanged: {
        if (mIsReady) {
            if (mTimeElapsedDownload < 0) {
                if (!shadow_timerStartTime) {
                    mTimeElapsedDownload = 0
                } else {
                    mTimeElapsedDownload = new Date().getTime() - shadow_timerStartTime
                }
            }
        }
    }


    onMSourceChanged: {
        if (mSource) {
            /*
              Store name and priority
                */
            setNameFromSource(mSource)
            checkPriorityVersusPath(mSource)
            /*
                Case that we change the source while the loader is already ready --> we should force the download on the spot
                  */
            if (getmIsReady()) {
                forceDownload();
            }
        }
    }

    onSourceSimpleChanged: {
        if (sourceSimple) {
            mSource = mFolderRoot + sourceSimple
        }
    }


    /**
      Force the download of the image (unless it has already been enforced)
      */
    function forceDownload() {
        /*
          Com
          */
        if (mIS_DEBUG) {
            console.log("Force download  for " + mName)
        }

        // mTimer_ScheduleRestartDownload.start()
        /*
          checkForReady
          */
        mIsReady = checkForReady();
        /*
          set the source and Start timer
          */
        let lWishSource = mBasicSource.getSource(mSource)
        if (!mIsReady && lWishSource && lWishSource !== mItemWithSource.source) {
            /*
          Set source
          */
            mItemWithSource.source = lWishSource
            /*
          Start timer
          */
            shadow_timerStartTime = new Date().getTime();
            /*
          Com
          */
            if (mIS_DEBUG) {
                console.log("Force download > mItemWithSource= " + mName)
            }

        }
        if (mIsReady || !lWishSource) {
            mTimer_ScheduleRestartDownload.stop()
        }
    }

    /**
      */
    function cancelDownload() {
        /*
          Debug
          */
        if (mIS_DEBUG) {
            console.log("Cancel download for " + mName)
        }
        /*
          Cancel by setting the source at null
          */
        mItemWithSource.source = ""
        mIsReady = false
        /*
          Reset timer
          */
        shadow_timerStartTime = -1
        mTimeElapsedDownload = -1
    }

    /*
      sDelayBeforeRetry in milliseconds
      */
    function cancelAndRetry() {
        /*
          Cancel
          */
        cancelDownload()
        /*
          Schedule retry
          */
        forceDownload()
    }

    /*
      Can be overriden
      */
    function setNameFromSource(sSource) {
        if (mBasicNum.isNotNull(sSource) && sSource !== "") {
            let lArrayWords = ("" + sSource).split("/");
            if (lArrayWords.length > 0) {
                mName = lArrayWords[lArrayWords.length - 1];
            }
        }
    }

    /*
      */
    function scheduleRestart(sInterval) {
        mTimer_ScheduleRestartDownload.interval = sInterval
        mTimer_ScheduleRestartDownload.start();
    }

    /*
      Timer to wait in case of time out, so we can retry the download
      */
    Timer {
        id: mTimer_ScheduleRestartDownload

        interval: mRetryInterval

        onTriggered: {
            mTimer_ScheduleRestartDownload.start()
            cancelAndRetry()
        }
    }

    /*
      Check the priority versus the map of folders // the manual priority prevails
      */
    function checkPriorityVersusPath(sSource) {
        if (mPriorityToDownload == -1) {
            // for (let lEntries of cBIS.mMAP_PATH_TO_PRIORITY.entries()) {
            //     let lSubFolder = lEntries[0]
            //     let lPriority = lEntries[1]
            //     if (sSource.startsWith(lSubFolder)) {
            //         mPriorityToDownload = lPriority;
            //     }
            // }
        }
    }

    /*
      Getters & Setters
      */
    function getmListItemToCheckIfLoaded() {
        return []
    }
    function getmName() {
        return mName;
    }
    function getmIsReady() {
        return mIsReady;
    }
    function setmIsReady(sIsReady) {
        mIsReady = sIsReady;
    }
}
