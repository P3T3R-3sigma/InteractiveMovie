import QtQuick
import Felgo
import "../../BasicDebug/v1"

Item {

    id: mThisBasicVideoJumpManager

    /*
      Property
      */
    property bool mIS_DEBUG: false
    property var mListBasicVideoJump: []

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return mListBasicVideoJump;
    }

    /*
      Place the area for the images
      */
    x: parent.width * (cBasicVideo.jump_X)
    y: parent.height * (cBasicVideo.jump_Y + cBasicVideo.jump_H_MARGIN * cBasicVideo.jump_TOP_to_BOTTOM)
    width: parent.width * (cBasicVideo.jump_W)
    height: parent.height * (cBasicVideo.jump_H)

    /*
      Place images each time that we resize
      */
    onWidthChanged: {
        placeBasicVideoJump();
    }
    onHeightChanged: {
        placeBasicVideoJump();
    }
    onVisibleChanged: {
        placeBasicVideoJump();
    }

    /**
      Create the BasicVideoJump and store them into the list
      */
    function initiateBasicVideoJumps(sListSources, sSubFolder) {
        if (sListSources) {
            mListBasicVideoJump = []
            let lComponent = Qt.createComponent("BasicVideoJump.qml");
            for (let lIdx = 0; lIdx < sListSources.length; lIdx++) {
                let lBasicVideoJump = lComponent.createObject(mThisBasicVideoJumpManager);
                /*
                  Identify the source of the image
                  */
                let lNameFile = sListSources[lIdx]
                /*
                  Pass data
                  */
                lBasicVideoJump.initiateBasicVideoJump(lNameFile, sSubFolder)
                /*
                  Add to list
                  */
                mListBasicVideoJump.push(lBasicVideoJump)
                if (mIS_DEBUG) {
                    console.log("created BasicVideoJump; source= " + lNameFile + "; Jump= " + lBasicVideoJump.getmJumpToMilliseconds())
                }
            }
            /*
              Sort the list of BasicVideoJump according to the time
              */
            mListBasicVideoJump.sort(function (sJump0, sJump1) {return sJump0.getmJumpToMilliseconds() - sJump1.getmJumpToMilliseconds()})
            /*
              Fill the rank in the list
              */
            for (let lIdx = 0; lIdx < sListSources.length; lIdx++) {
                let lBasicVideoJump = lComponent.createObject(mThisBasicVideoJumpManager);
                lBasicVideoJump.mIdx = lIdx
            }
            /*
              Debug
              */
            if (mIS_DEBUG) {
                for (let lIdx = 0; lIdx < mListBasicVideoJump.length; lIdx++) {
                    let lBasicVideoJump = mListBasicVideoJump[lIdx]
                    console.log("BasicVideoJump; " + lBasicVideoJump.vString())
                }
            }
        }
    }

    /**

      */
    function placeBasicVideoJump() {
        if (width > 0 && height > 0 && getmDuration() > 0 && visible && mListBasicVideoJump.length > 0) {
            /*
              The size of the image fits into the height of this manager
              */
            let lHeight = height
            let lWidthPercent = lHeight / width
            /*
              We reduce the size of the images so that they fit into the bar, including the intervals between the images
              */
            let lN = mListBasicVideoJump.length
            if (lN > 1) {
                let lWidthPercentMax = 1 / (lN - 1) / (1 + cBasicVideo.jump_I)
                lWidthPercent = Math.min(lWidthPercent, lWidthPercentMax);
            }
            /*
              Slot = width + interval between
              */
            let lSlot = lWidthPercent * (1 + cBasicVideo.jump_I)
            /*
              Debug
              */
            if (mIS_DEBUG) {
                console.log();
                console.log("lWidthPercent= " + lWidthPercent);
                console.log("lSlot= " + lSlot);
            }
            /*
              Initiate the position at the ideal place + create a list of partition singleton
              */
            let lListPartition = []
            for (let lIdx = 0; lIdx < mListBasicVideoJump.length; lIdx++) {
                let lBasicVideoJump = mListBasicVideoJump[lIdx];
                let lXPercent = Math.min(1, Math.max(0, lBasicVideoJump.getmJumpToMilliseconds() / getmDuration())) - lWidthPercent / 2
                /*
                  Store
                  */
                lBasicVideoJump.setXPercentCompute(lXPercent)
                lBasicVideoJump.setXPercentIdeal(lXPercent)
                lBasicVideoJump.widthPercent = lWidthPercent
                /*
                  Partition
                  */
                lListPartition.push([lBasicVideoJump])
                /*
                  Debug
                  */
                if (mIS_DEBUG) {
                    console.log("lIdx= " + lIdx
                                + "; x%= " + lBasicVideoJump.getXPercentCompute()
                                + "; x%Ideal= " + lBasicVideoJump.getXPercentIdeal()
                                + "; vString= " + lBasicVideoJump.vString())
                }
            }
            /*

              */
            let lDistanceError = 1 / 1980 / 10
            let lNbLoops = 0
            while (true) {
                if (++lNbLoops > 100) {
                    mBasicDisplay.error(mThisBasicVideoJumpManager, "ERROR - infinite looping")
                    break;
                }
                /*
                  Initiate
                  */
                let lListPartitionMerged = []
                let lPartitionCurrent = lListPartition[0]
                /*
                  Loop over the partitions
                  */
                for (let lIdx = 1; lIdx < lListPartition.length; lIdx++) {
                    let lPartitionNext = lListPartition[lIdx];
                    /*
                          2 partitions overlap if the last element and the first overlap (since the elements are sorted in ascending order)
                      */
                    let lLastElement = lPartitionCurrent[lPartitionCurrent.length - 1]
                    let lFirstElement = lPartitionNext[0]
                    /*
                          Check if there is an overlap between the partition
                          */
                    let lDistance = lFirstElement.getXPercentCompute() - lLastElement.getXPercentCompute();
                    /*
                          if overlap -> we merge the partitions and we continue
                          */
                    if (lDistance < lSlot - lDistanceError) {
                        lPartitionCurrent = lPartitionCurrent.concat(lPartitionNext)
                    }
                    /*
                          If not overlap --> we store the current partition, and we move on from the next partition (which begins the new current partition)
                          */
                    else {
                        lListPartitionMerged.push(lPartitionCurrent);
                        lPartitionCurrent = lPartitionNext;
                    }
                }
                lListPartitionMerged.push(lPartitionCurrent)
                /*
                  Debug
                  */
                if (mIS_DEBUG) {
                    console.log()
                    for (let lIdx = 0; lIdx < lListPartition.length; lIdx++) {
                        let lPartition = lListPartition[lIdx];
                        for (let lKdx = 0; lKdx < lPartition.length; lKdx++) {
                            console.log("Partition " + lIdx + " --> x%= " + lPartition[lKdx].xPercentCompute)
                        }
                    }
                    for (let lIdx = 0; lIdx < lListPartitionMerged.length; lIdx++) {
                        let lPartition = lListPartitionMerged[lIdx];
                        for (let lKdx = 0; lKdx < lPartition.length; lKdx++) {
                            console.log("Partition Merged " + lIdx + " --> x%= " + lPartition[lKdx].xPercentCompute)
                        }
                    }
                }
                /*
                  We exit if there was no change of partitions
                  */
                if (lListPartitionMerged.length === lListPartition.length) {
                    break;
                }
                /*
                  if there was a change in partition, we recenter all the partition to the minimum distance to the ideal
                  */
                else {
                    lListPartition = lListPartitionMerged;
                    for (let lIdx = 0; lIdx < lListPartition.length; lIdx++) {
                        let lPartition = lListPartition[lIdx];
                        /*
                          Compute the average of the ideal position --> this will be the position
                          */
                        let lAvg = 0
                        let lNb = lPartition.length
                        for (let lKdx = 0; lKdx < lPartition.length; lKdx++) {
                            let lBasicVideoJump = lPartition[lKdx]
                            lAvg += lBasicVideoJump.getXPercentIdeal()
                        }
                        lAvg = lAvg / lNb
                        /*
                          Compute the start position to place all the images
                          */
                        let lX0 = lAvg - lSlot * (lNb - 1) / 2
                        lX0 = Math.max(lX0, -lWidthPercent / 2)
                        lX0 = Math.min(lX0, 1 -lWidthPercent / 2 -(lPartition.length - 1) * lSlot)
                        /*
                          Debug
                          */
                        if (mIS_DEBUG) {
                            console.log("lAvg= " + lAvg + "; lX0= " + lX0)
                        }
                        /*
                          Place all images next to another starting at position lX0 (this is the optimum)
                          */
                        for (let lKdx = 0; lKdx < lPartition.length; lKdx++) {
                            let lBasicVideoJump = lPartition[lKdx]
                            let lXPercent = lX0 + lKdx * lSlot
                            lBasicVideoJump.setXPercentCompute(lXPercent)
                            if (mIS_DEBUG) {
                                console.log("lKdx= " + lKdx + "; Final xPercent= " + lXPercent)
                            }
                        }
                    }
                }
            }
            /*
              Copy the xPercentCompute into the xPercent
              */
            for (let lIdx = 0; lIdx < mListBasicVideoJump.length; lIdx++) {
                let lBasicVideoJump = mListBasicVideoJump[lIdx];
                lBasicVideoJump.setXPercent(lBasicVideoJump.getXPercentCompute())
            }
        }
    }

    /*
      Getters & Setters
      */
    function getmListBasicVideoJump() {
        return mListBasicVideoJump;
    }
    function setmPosition(sPosition) {
        parent.setmPosition(sPosition)
    }
    function getmDuration() {
        return parent ? parent.getmDuration() : 0;
    }

}
