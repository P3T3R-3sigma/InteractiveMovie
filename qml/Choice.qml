import QtQuick
import Felgo

import "basic_librairies/BasicImageHover/v1"
import "basic_librairies/BasicImageSource/v4"

Item {

    id: iChoice

    anchors.fill: parent

    property var pStatusEnum: {
        "ACCESSIBLE": 0,
        "HIDDEN": 1,
        "TERMINATED": 2
    }



    property int pStatus: pStatusEnum.ACCESSIBLE
    property string pTextBeforeChoosing
    property string pTitle
    property string pQuestion

    property string pVideoBeforeChoiceSource
    property string pVideoWhileChoiceSource
    property string pImageWhileChoiceSource
    property int pTimer
    property var pDefaultChoice
    property var pChoices: []

    visible: false

    BasicImageSource {
        heightPercent: 1

        sourceSimple: pImageWhileChoiceSource

        Text {
            id: iTitle

            anchors.horizontalCenter: parent.horizontalCenter

            text: pTitle
        }
        Text {
            id: iQestion

            anchors.top: iTitle.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            text: pQuestion
        }

        Row {
            id: choiceRow
            spacing: 10
            anchors.centerIn: parent

            Repeater {
                id: iRepeater
                model: pChoices.length

                Rectangle {
                    id: iChoiceRect

                    width: 150
                    height: 200

                    color: "blue"

                    Text {
                        anchors.centerIn: parent
                        text: pChoices[model.index].pTextBeforeChoosing
                    }

                    MouseArea {
                        id: areaM
                        anchors.fill: parent

                        hoverEnabled: true

                        onEntered: {
                            iChoiceRect.color = "purple"
                        }
                        onExited: {
                            iChoiceRect.color = "blue"
                        }

                        onClicked: {
                            iChoice.visible = false
                            pChoices[model.index].visible = true
                        }
                    }
                }
            }
        }
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
}
