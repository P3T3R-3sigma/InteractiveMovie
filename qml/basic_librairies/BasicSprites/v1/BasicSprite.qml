import QtQuick
import Felgo

AnimatedSprite {

    id: mThisBasicSprite

    /*
      Controls
      */
    property string mSubFolder: mBasicSpriteManager.mSubFolder
    property string sourceSimple
    property bool mIS_DEBUG: false
    property real widthPercent
    property real heightPercent
    property real xPercent
    property real yPercent

    source: "../../../../assets/" + mSubFolder + ((mBasicNum.isNotNull(mSubFolder) && mSubFolder !== "" && !mSubFolder.endsWith("/")) ? "/" : "") + sourceSimple

    Component.onCompleted: {
        mBasicSpriteManager.declareNewBasicSprite(mThisBasicSprite)
    }

    /*
      Can be overriden - no longer works if overriden
      */
    width: parent.width * widthPercent
    height: parent.height * heightPercent
    x: parent.width * xPercent
    y: parent.height * yPercent

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mThisBasicSprite.frameHeight > 0 && mThisBasicSprite.frameWidth > 0 && heightPercent > 0) {
            heightPercent
                * parent.height / parent.width
                * mThisBasicSprite.frameWidth / mThisBasicSprite.frameHeight
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (mThisBasicSprite.frameHeight > 0 && mThisBasicSprite.frameWidth > 0 && widthPercent > 0) {
            widthPercent
                * parent.width / parent.height
                * mThisBasicSprite.frameHeight / mThisBasicSprite.frameWidth
        } else {
            0
        }
    }

    /**
      Deduce from the name of the file the parameters
      */
    onSourceSimpleChanged: {
        let lFrameCountStr = "FrameCount"
        let lXYWHStr = "XYWH"
        if (sourceSimple.includes(lXYWHStr) && sourceSimple.includes(lFrameCountStr)) {
            let lWords = sourceSimple.split("_");
            /*
              Get the frame count
              */
            let lIdxFrameCount = lWords.indexOf(lFrameCountStr)
            frameCount = parseInt(lWords[lIdxFrameCount + 1]);
            /*
              Get the size of a frame
              */
            let lIdxXYWH = lWords.indexOf(lXYWHStr)
            frameWidth = parseInt(lWords[lIdxXYWH + 3]);
            frameHeight = parseInt(lWords[lIdxXYWH + 4]);
            /////////////////////////////////////////////////////////////
            if (mIS_DEBUG) {
                console.log();
                console.log("sourceSimple= " + sourceSimple)
                console.log("frameCount= " + frameCount)
                console.log("frameWidth= " + frameWidth)
                console.log("frameHeight= " + frameHeight)
            }
            /////////////////////////////////////////////////////////////
        }
    }

















}
