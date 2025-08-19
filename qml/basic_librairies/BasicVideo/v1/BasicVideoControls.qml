import QtQuick
import Felgo
import "../../BasicDebug/v1"

Item {

    id: mThisBasicVideoControls


    /////////////////////////////////////////////////////
    // BasicDebugRectangle {visible: true; opacity: 0.10}
    /////////////////////////////////////////////////////

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mThisBasicVideoStartPauseStop, mThisBasicVideoJumpManager]
    }

    /**
      */
    BasicVideoStartPauseStop {
        id: mThisBasicVideoStartPauseStop

        visible: false
    }

    /**
      */
    BasicVideoTimeBar {
        id: mThisBasicVideoTimeBar

        visible: false
    }

    BasicVideoJumpManager {
        id: mThisBasicVideoJumpManager

        visible: false
    }

    /**
      */
    function showFull() {
        /*
          Stop timer
          */
        mThisTimerHideAfterIdle.stop()
        /*
          Show the BasicVideoJumps and the SPS and the timeline
          */
        mThisBasicVideoJumpManager.visible = true
        mThisBasicVideoStartPauseStop.visible = true
        mThisBasicVideoTimeBar.visible = true;
    }

    /**
      */
    function showLight() {
        mThisTimerHideAfterIdle.start();
        /*
          Hide the BasicVideoJumps and the SPS, but show the timeline
          */
        mThisBasicVideoJumpManager.visible = false
        mThisBasicVideoStartPauseStop.visible = false
        mThisBasicVideoTimeBar.visible = true;
        /*
          Launch a timer to Hide
          */
        mThisTimerHideAfterIdle.start();
    }

    /**
      */
    function hideControls() {
        /*
          Hide the BasicVideoJumps and the SPS and the timeline
          */
        mThisBasicVideoJumpManager.visible = false
        mThisBasicVideoStartPauseStop.visible = false
        mThisBasicVideoTimeBar.visible = false;
    }

    Timer {
        id: mThisTimerHideAfterIdle

        interval: 1000
        onTriggered: {
            hideControls()
        }
    }

    /*
      Getters & Setters
      */
    function getmListBasicVideoJump() {
        return mThisBasicVideoJumpManager.getmListBasicVideoJump();
    }
    function getmVolume() {
        return parent.getmVolume()
    }
    function setmVolume(sVolume) {
        parent.setmVolume(sVolume)
    }
    function getmThisBasicVideoStartPauseStop() {
        return mThisBasicVideoStartPauseStop;
    }
    function setmPosition(sPosition) {
        parent.jumpTo(sPosition)
    }
    function setmPositionPct(sPositionPct) {
        parent.setmPositionPct(sPositionPct)
    }
    function getmPosition() {
        parent.getmPosition();
    }
    function updateTimeBar(sPositionPct) {
        mThisBasicVideoTimeBar.updateTimeBar(sPositionPct)
    }
    function getmDuration() {
        return parent.getmDuration();
    }
    function getmThisBasicVideoJumpManager() {
        return mThisBasicVideoJumpManager;
    }
}
