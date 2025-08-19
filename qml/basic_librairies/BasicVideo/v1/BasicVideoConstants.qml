import QtQuick
import Felgo

Item {

    id: cBasicVideo

    /*
      Zone for the controls
      */
    property real controls_X: 0
    property real controls_Y: 1 - controls_H
    property real controls_W: 1
    property real controls_H: 0.15
    /*
      Controls, start, pause, stop
      */
    property real sps_X: 0
    property real sps_W: 0.15
    property real sps_H: 1 // in % of the zone control
    property real sps_Interval: 0.08
    property real sps_TOP_to_BOTTOM: 0.80       //  the middle will be placced at the ratio TOP_to_BOTTOM; if 1 then middles of sps are placed at the bottom
    property real sps_H_SOUND_BAR: 0.08     // the height of the sound bar in % of its width
    property real sps_H_SOUND_CURSOR: 2.5   //  the heigh of the sound cursor in % of the height of the sound bar (sps_H_SOUND_BAR)
    property color sps_COLOR_SOUND_BAR: Qt.color("grey")
    property color sps_COLOR_SOUND_ACTIVE_BAR: Qt.color("white")
    /*
      Time Bar
      the time bar is placed at the same level as the sound vertically - so that the middles are aligned
      */
    property real time_X: sps_W
    property real time_W: 1 - time_X
    property real time_H: sps_H
    property real time_BAR_H: 0.10 // in % of parent
    property real time_MARGIN: 0.10 // margin left and right in % of the parent (cf 'controls_W')
    property real time_CURSOR_H: 2.5   //  the heigh of the sound cursor in % of the height of the sound bar (sps_H_SOUND_BAR)
    property color time_COLOR_BAR: Qt.color("grey")
    property color time_COLOR_READ_BAR: Qt.color("white")
    property real time_BAR_W: time_W * (1 - 2 *  time_MARGIN)
    /*
      Images to jump to a time spot
      the images are squared, we deduce their size from the height, and we max the size
      */
    property real jump_X: time_X + time_W * time_MARGIN      //  we begin the images where the time bar begins
    property real jump_Y: (1 - sps_H) / 2
    property real jump_W: time_W * time_BAR_W                     //  length of the zone where we place the images
    property real jump_H_MARGIN: 0.10           // the margin vertical that we leave in % of the parent height
    property real jump_H: time_H * sps_TOP_to_BOTTOM - time_H * time_BAR_H / 2 - jump_H_MARGIN     // we use the space available above the time bar
    property real jump_TOP_to_BOTTOM: 0.50      //  how we place the images in the vertical spot ; 1 = at the bottom; 0= at the top
    property real jump_I: 0.10              // interval between images in % of the width of the image
    property real jump_LABEL_H: 0.30       // in % of the height of the jump image
    property real jump_LABEL_OPACITY: 0.30  //  opacity of the background
    property color jump_LABEL_COLOR_TEXT: Qt.color("white")     //  color of the text label
    property color jump_LABEL_COLOR_BACKGROUND: Qt.color("black")
    property color jump_Hover_Border_Color: Qt.color("#8D0C73")
    property real jump_Hover_Resize: 0.10 // in percent of Jump_W











}
