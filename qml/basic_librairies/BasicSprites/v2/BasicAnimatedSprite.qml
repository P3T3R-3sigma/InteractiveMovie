import QtQuick
import Felgo
import "../../BasicImageSource/v4"

AnimatedSprite {

    /**
      Take only one image for the sprite in entry
      */


    id: mThisBasicAnimatedSprite

    /*
      Necessary Inputs
      */
    property string subFolder // = the folder when all the sequence of the sprites are located
    property string fileSprite  //  the name of the file image containing the sprite
    frameCount: 0
    /*
        Commands
      */
    property real widthPercent
    property real heightPercent
    property real xPercent
    property real yPercent
    property int mFrameRate: 10
    property bool mIS_DEBUG: false
    property bool mIsReverseWhenFinished: false // if we put to yes, then the sprite will loops endlessly and reverse order when finished, so it bounces

    /*
      Can be overriden - no longer works if overriden
      */
    widthPercent: frameWidth / parent.width
    heightPercent: frameHeight / parent.height
    width: parent.width * widthPercent
    height: parent.height * heightPercent
    x: parent.width * xPercent
    y: parent.height * yPercent
    frameRate: mFrameRate
    // source: mBasicSource.getSource(fileSprite, mBasicSpriteManager.mSubFolder + "/" + subFolder)
    source: mThisBasicImageSource_ForLoader.getmSource()

    interpolate: true

    /*
      Register to the BasicSpriteManager (so that we can stop/start all sprites)
      */
    Component.onCompleted: {
        mBasicSpriteManager.declareNewBasicSprite(mThisBasicAnimatedSprite)
        if (frameWidth == 0 || frameHeight == 0) {
            mBasicDisplay.error(mThisBasicAnimatedSprite, "frameWidth= " + frameWidth + "; frameHeight= " + frameHeight)
        }
        if (frameCount == 0) {
            mBasicDisplay.error(mThisBasicAnimatedSprite, "frameCount= " + frameCount)
        }
        if (mIS_DEBUG) {
            console.log("frameCount= " + frameCount)
            console.log("width= " + width + "; height= " + height)
        }
    }

    /*

      */
    onMIsReverseWhenFinishedChanged: {
        if (mIsReverseWhenFinished) {
            loops = 1
        }
    }

    /*
      Can be overriden, but then we lose the effect mIsReverseWhenFinished
      */
    onRunningChanged: {
        if (!running) {
            if (mIsReverseWhenFinished) {
                reverse = !reverse
                running = true
            }
        }
    }

    /**
      Loader: we load an Image so that the texture is loaded in the cache, and we can know when it is ready for the sprite
      this is a little weird, but this is the way developers do to check when the source of the sprite is loaded
      */
    BasicImageSource {
        id: mThisBasicImageSource_ForLoader

        mSource:             mBasicSpriteManager.mSubFolder
                             + mThisBasicAnimatedSprite.subFolder
                             + "/" + mThisBasicAnimatedSprite.fileSprite;

    }
    function getmListItemToCheckIfLoaded() {
        return [mThisBasicImageSource_ForLoader]
    }













}
