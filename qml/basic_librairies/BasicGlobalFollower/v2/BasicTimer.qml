import QtQuick
import Felgo

Item {

    /**
      BasicTimer only exists because the function 'complete()' does not exist in Timer
      'complete()' allows the BasicGlobalFollower to stop the BasicTimer is 'Esc' is pressed
      */

    id: mTHIS_BASIC_TIMER_V2

    signal triggered
    property bool running
    property int interval

    /**
      if the Timer is already running, then this method has no effect, the timer will continue
      */
    function start() {
        mTIMER_QML.start();
    }

    /**
      Start the Time from the beginning
      if the timer is not running, then just start it
      */
    function restart() {
        mTIMER_QML.restart();
    }

    /**
      stop the timer but does not call the triggered
      */
    function stop() {
        mTIMER_QML.stop();
    }

    /**
      stop the timer and call the triggered
      */
    function complete() {
        stop();
        triggered();
    }

    onIntervalChanged: {
        mTIMER_QML.interval = interval
    }

    Timer {
        id: mTIMER_QML

        onTriggered: {
            mTHIS_BASIC_TIMER_V2.triggered();
        }
        onRunningChanged: {
            mTHIS_BASIC_TIMER_V2.running = running
        }
    }

}
