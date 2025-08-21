import QtQuick
import Felgo
import QtMultimedia

import "../basic_librairies/BasicImageHover/v1"
import "../basic_librairies/BasicImageSource/v4"
import "../basic_librairies/BasicLoader/v1"
import "../basic_librairies/BasicText/v4"
import "../basic_librairies/BasicDebug/v1"

Item {

    id: iChoiceContainer

    anchors.fill: parent

    property var pStatusEnum: {
        "ACCESSIBLE": 0,
        "LOCKED": 1,
        "HIDDEN": 2,
        "TERMINATED": 3
    }

    property int pStatus: pStatusEnum.ACCESSIBLE
    property bool pTerminateAfterPlay: true

    property string pTextBeforeChoosing
    property string pTitle
    property string pQuestion

    property string pVideoBeforeChoiceSource
    property string pVideoWhileChoiceSource
    property string pImageWhileChoiceSource
    property int pTime: 0
    property int pVideoVolume: 0
    property var pDefaultChoice
    property var pListChoices: []

    visible: false

    CHgVideoBeforeChoice {
        id: mVideoBeforeChoice

        pImageNext: iImageWhileChoice
        pVideoNext: mVideoWhileChoice
    }

    CHgVideoWhileChoice {
        id: mVideoWhileChoice
    }


    BasicImageSource {
        id: iImageWhileChoice

        visible: false

        anchors.fill: parent
        fillMode: Image.PreserveAspectFit

        sourceSimple: pImageWhileChoiceSource


        function getmListItemToCheckIfLoaded() {
            if (pImageWhileChoiceSource) {
                return [iImageWhileChoice];
            }
            return []
        }
    }

    CHgChoices {
        id: mCHgChoices

        z: 10

        visible: false

        pXPercent: 0.2
        pYPercent: 0.2
        pWidthPercent: 0.55
    }

    onVisibleChanged: {
        if (visible) {
            mVideoBeforeChoice.visible = true
            if (pTerminateAfterPlay) {
                pStatus = pStatusEnum.TERMINATED
            }
        }
    }
    Component.onCompleted: {
        mCHgChoices.recalibratePositions()
    }

    // onPListChoicesChanged: {
    //     console.error("Invalid input: choices is not an array");
    //     pListChoices = shadow_getChoices(pListChoices)
    // }



    function shadow_getChoices(choices) {
        return choices.filter(choice =>
                choice.pStatus === pStatusEnum.ACCESSIBLE ||
                choice.pStatus === pStatusEnum.LOCKED
            );
    }


    function hide() {
        pStatus = pStatusEnum.HIDDEN
    }
    function terminate() {
        pStatus = pStatusEnum.TERMINATED
    }
    function makeAccessible() {
        pStatus = pStatusEnum.ACCESSIBLE
    }
    function lock() {
        pStatus = pStatusEnum.LOCKED
    }


    function getmListItemToCheckIfLoaded() {
        let getListToCheck = [  ...mVideoBeforeChoice.getmListItemToCheckIfLoaded(),
                                ...mVideoWhileChoice.getmListItemToCheckIfLoaded(),
                                ...iImageWhileChoice.getmListItemToCheckIfLoaded()
                            ]
        return [...getListToCheck, ...pListChoices];
    }


}
