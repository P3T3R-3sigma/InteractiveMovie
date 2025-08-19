import QtQuick
import Felgo

Item {

    id: mThisSampleScene

    /*
      Event
      */
    property int wStart: 0
    /*
      Constants
      */
    property real mZOOM: 0.40
    property int mDURATION: 3000


    visible: false
    enabled: false
    width: parent.width
    height: parent.height

    function startTuto() {
        visible = true;
        enabled = true;
        console.log("Tuto started; Tuto.width= " + width + "; Tuto.height= " + height);
        console.log();
        wStart++;
        /*
          Launch the animation to simulat a resizing of the window
          */
        mThisResize.start()
    }

    ParallelAnimation {
        id: mThisResize

        NumberAnimation {
            target: mThisSampleScene
            property: "height"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.height
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.height * mZOOM
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: mThisSampleScene
            property: "width"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.width
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.width * mZOOM
            easing.type: Easing.InOutQuad
        }

        onRunningChanged: {
            if (!running) {
                mThisResizeIncreaseBack.start()
            }
        }
    }

    ParallelAnimation {
        id: mThisResizeIncreaseBack

        NumberAnimation {
            target: mThisSampleScene
            property: "height"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.height * mZOOM
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.height
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: mThisSampleScene
            property: "width"
            duration: mDURATION
            from: mGAME_WINDOW_BASIC_LIBRAIRIES.width * mZOOM
            to: mGAME_WINDOW_BASIC_LIBRAIRIES.width
            easing.type: Easing.InOutQuad
        }
    }

}
