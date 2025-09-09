import QtQuick
import Felgo
import Qt5Compat.GraphicalEffects

import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicDebug/v1"
import "../../basic_librairies/BasicImageSource/v4"
import "../../Particles"

Item {
    id: item

    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent
    property real xPercentImage: 0.1
    property real yPercentImage: 0
    property real widthPercentImage: 0.8
    property real heightPercentImage: 0.8

    property var pNextScene: null

    property var pFunctionToDo: startFadeOut
    property string pSource
    property bool pVisited: false
    property bool pHadSex: false

    anchors.fill: parent

    BasicImageSource {
        id: iOneChoiceCensored

        xPercent: xPercentImage
        yPercent: yPercentImage
        widthPercent: widthPercentImage
        heightPercent: widthPercentImage

        visible: !pVisited

        z: 2

        sourceSimple: pSource + "Censored.png"
        fillMode: Image.PreserveAspectFit
    }
    BasicImageSource {
        id: iOneChoiceWithClothes

        xPercent: xPercentImage
        yPercent: yPercentImage
        widthPercent: widthPercentImage
        heightPercent: widthPercentImage

        visible: pVisited && !pHadSex

        z: 2

        sourceSimple: pSource + "WithClothes.png"
        fillMode: Image.PreserveAspectFit
    }
    BasicImageSource {
        id: iOneChoiceImageWithoutClothes

        xPercent: xPercentImage
        yPercent: yPercentImage
        widthPercent: widthPercentImage
        heightPercent: widthPercentImage

        visible: pVisited && pHadSex
        z: 2

        sourceSimple: pSource + "WithoutClothes.png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: iAreaRect

        color: "transparent"

        x: parent.width * (xPercent - widthPercent/2)
        y: parent.height * (yPercent - heightPercent/2)
        width: parent.width * widthPercent
        height: parent.height * heightPercent

        z: 1

        MouseArea {
            id: iMouseArea
            anchors.fill: parent

            hoverEnabled: true

            enabled: {
                if (pNextScene) {
                    return pNextScene.mStatus === mCHc.mStatusEnum.ACCESSIBLE && pOpacity
                }
                return false
            }
            onPositionChanged: function(mouse) {
                iMoveMouseParticle.setEmitPos(mouse.x + iAreaRect.x, mouse.y + iAreaRect.y)
                mParticleManager.showParticle(iMoveMouseParticle)
            }

            onEntered: {
                setStartBumpAnimation(0.85, 250)
                iChoiceGlow.visible = true
            }
            onExited: {
                setStartBumpAnimation(0.8, 250)
                iChoiceGlow.visible = false
            }

            onPressed: {
                setStartBumpAnimation(0.9, 100)
                mParticleManager.showParticle(iChoiceParticle)
                pFunctionToDo(pNextScene)
            }
        }

        ChoiceSelectedParticle {
            id: iChoiceParticle
        }
        RectangularGlow {
            id: iChoiceGlow

            visible: false
            anchors.fill: parent

            glowRadius: parent.width*0.1
            color: "purple"
            cornerRadius: parent.width/2
        }
    }
    ParallelAnimation {
        id: mThisAnimationBump

        NumberAnimation {
            id: mThisNumberAnimationWidth

            target: item
            property: "widthPercentImage"
            duration: 250
        }

        NumberAnimation {
            id: mThisNumberAnimationHeight

            target: item
            property: "heightPercentImage"
            duration: 250
        }
        NumberAnimation {
            id: mThisNumberAnimationX

            target: item
            property: "xPercentImage"
            duration: 250
        }

        NumberAnimation {
            id: mThisNumberAnimationY

            target: item
            property: "yPercentImage"
            duration: 250
        }
        onFinished: {
            if (iChoiceManager.opacity !== 1 && widthPercentImage > 0) {
                setStartBumpAnimation(0, 1000)
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            xPercentImage = 0.1
            yPercentImage = 0
            widthPercentImage = 0.8
            heightPercentImage = 0.8
        } else {
            mThisAnimationBump.stop()
        }
    }

    function setStartBumpAnimation(lTo, lDuration) {
        mThisAnimationBump.stop()
        if (lDuration) {
            mThisNumberAnimationWidth.duration = lDuration
            mThisNumberAnimationHeight.duration = lDuration
            mThisNumberAnimationX.duration = lDuration
            mThisNumberAnimationY.duration = lDuration
        }
        mThisNumberAnimationWidth.to = lTo
        mThisNumberAnimationHeight.to = lTo
        mThisNumberAnimationX.to = xPercentImage - (xPercent - xPercentImage) * (lTo/widthPercentImage - 1)
        mThisNumberAnimationY.to = yPercentImage - (yPercent - yPercentImage) * (lTo/widthPercentImage - 1)
        mThisAnimationBump.start()
    }
}



