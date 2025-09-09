import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicLoader/v1"
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicDebug/v1"

Item {

    id: iChoices

    anchors.fill: parent

    z: 250

    CHgFiveChoice {
        id: iFiveChoice
        visible: false

        pListScenes: mShadowListChoices
    }
    CHgFourChoice {
        id: iFourChoice
        visible: false

        pListScenes: mShadowListChoices
    }
    CHgThreeChoice {
        id: iThreeChoice
        visible: false

        pListScenes: mShadowListChoices
    }
    CHgTwoChoice {
        id: iTwoChoice
        visible: false

        pListScenes: mShadowListChoices
    }

    CHgChoiceTimer {
        id: mChoiceTimer
        xPercent: 0.5 -widthPercent/2
        yPercent: 0.82466
        widthPercent: 0.58288
        heightPercent: 0.00707
    }

    onVisibleChanged: {
        if (visible) {
            iChoices.opacity = 1
            if (mDisplay !== mDisplayEnum.IMAGE) {
                switch (mShadowListChoices.length) {
                    case 2: iTwoChoice.visible = true; break
                    case 3: iThreeChoice.visible = true; break
                    case 4: iFourChoice.visible = true; break
                    case 5: iFiveChoice.visible = true; break
                    default: console.log("ERROR: WRONG NUMBER OF CHOICES"); break
                }
            }

        } else {
            iTwoChoice.visible = false;
            iThreeChoice.visible = false;
            iFourChoice.visible = false;
            iFiveChoice.visible = false;
        }
    }

    function stopTimer() {
        mChoiceTimer.stopTimer()
    }
    function pauseTimer() {
        mChoiceTimer.pauseTimer()
    }
}
