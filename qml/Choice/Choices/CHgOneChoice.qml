import QtQuick
import Felgo
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicDebug/v1"

Item {
    id: iOneChoice
    anchors.fill: parent
    z: parent.z


    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent
    property real textSizePercent
    property real radiusPercent: 0.012
    property real borderWidthPercent: 0.0008

    property var pNextScene: null

    property var pParent: parent


    Rectangle {
        id: iBackground

        color: "#779161"
        opacity: 0.95
        z: parent.z

        x: (xPercent-borderWidthPercent) * pParent.width
        y: (yPercent-borderWidthPercent) * pParent.height
        width: (widthPercent-borderWidthPercent*2) * pParent.width
        height: (heightPercent-borderWidthPercent*2) * pParent.height

        radius: pParent.height * radiusPercent

        border.color: "#E5E5E5"
        border.width: pParent.width * borderWidthPercent

        Text {
            id: iText
            anchors.centerIn: parent
            z: parent.z

            text: {
                if (pNextScene) {
                    return pNextScene.mTextBeforeChoosing
                }
                return ""
            }

            color: "#E5E5E5"
            font.family: "Century Gothic Pro"
            font.pixelSize: pParent.height * textSizePercent
        }

        MouseArea {
            id: iMouseArea
            anchors.fill: parent

            hoverEnabled: true

            enabled: {
                if (pNextScene) {
                    return pNextScene.mStatus === mStatusEnum.ACCESSIBLE
                }
                return false
            }

            onEntered: {
                iBackground.color = "#77c668"
            }
            onExited: {
                iBackground.color = "#779161"
            }

            onPressed: {
                iBackground.color = "#b2cdaa"
                iText.font.bold = true
                startFadeOut(pNextScene)
            }
        }
    }

    onVisibleChanged: {
        if (visible){
            iBackground.color = "#779161"
            iText.font.bold = false
        }
    }
}



