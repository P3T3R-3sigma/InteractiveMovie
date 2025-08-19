import QtQuick
import Felgo
import "../../BasicImageSource/v4"
import "../../BasicLoader/v1"

BasicLoaderContainerGraphic {

    /**
      Take only one image for the sprite in entry
      */


    id: mTHIS_ANIMATEDSPRITE_CONTAINER


    /*
      Necessary Inputs
      */
    property string subFolder // = the folder when all the sequence of the sprites are located
    property string fileSprite  //  the name of the file image containing the sprite
    /*
      Commands - replica
      */
    property int frameRate: 10
    property bool interpolate
    property int frameCount: 0
    property bool running: true       // Link with the BasicSpriteManager who can stop and hide the item
    property int frameWidth
    property int frameHeight
    /*
        Commands
      */
    property bool mIS_DEBUG: false
    property bool mIsReverseWhenFinished: false // if we put to yes, then the sprite will loops endlessly and reverse order when finished, so it bounces

    /*
      Can/Should be overriden
      */
    widthPercent: frameWidth / parent.width
    heightPercent: widthPercent * parent.width * frameHeight / frameWidth / parent.height

    /*
      Register to the BasicSpriteManager (so that we can stop/start all sprites)
      */
    Component.onCompleted: {
        mBasicSpriteManager.declareNewBasicSprite(mThisBasicAnimatedSprite)
        /*
          Error check
          */
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
      The actual sprite
      */
    AnimatedSprite {

        id: mThisBasicAnimatedSprite

        frameCount: mTHIS_ANIMATEDSPRITE_CONTAINER.frameCount
        interpolate: mTHIS_ANIMATEDSPRITE_CONTAINER.interpolate
        frameRate: mTHIS_ANIMATEDSPRITE_CONTAINER.frameRate
        running: mTHIS_ANIMATEDSPRITE_CONTAINER.running
        frameWidth: mTHIS_ANIMATEDSPRITE_CONTAINER.frameWidth
        frameHeight: mTHIS_ANIMATEDSPRITE_CONTAINER.frameHeight

        anchors.fill: parent

        /*
          Can be overriden, but then we lose the effect mIsReverseWhenFinished
          */
        onRunningChanged: {
            if (!running) {
                if (mTHIS_ANIMATEDSPRITE_CONTAINER.mIsReverseWhenFinished) {
                    reverse = !reverse
                    running = true
                }
            }
        }
    }

    /*

      */
    onMIsReverseWhenFinishedChanged: {
        if (mIsReverseWhenFinished) {
            mThisBasicAnimatedSprite.loops = 1
        } else {
            mThisBasicAnimatedSprite.loops = AnimatedSprite.Infinite
        }
    }

    /**
      Loader: we load an Image so that the texture is loaded in the cache, and we can know when it is ready for the sprite
      this is a little weird, but this is the way developers do to check when the source of the sprite is loaded
      */
    BasicImageSource {
        id: mThisBasicImageSource_ForLoader

        visible: false

        mSource: mBasicSpriteManager.mSubFolder + mTHIS_ANIMATEDSPRITE_CONTAINER.subFolder + "/" + mTHIS_ANIMATEDSPRITE_CONTAINER.fileSprite;

    }

    function getmListItemToCheckIfLoaded() {
        return [mThisBasicImageSource_ForLoader]
    }

    function forceDownload() {
        mThisBasicImageSource_ForLoader.forceDownload();
        mThisBasicAnimatedSprite.source = mThisBasicImageSource_ForLoader.getmSource();
    }

    function getmName() {
        return mThisBasicImageSource_ForLoader.getmName();
    }

    function cancelDownload() {
        mThisBasicImageSource_ForLoader.cancelDownload();
        mThisBasicAnimatedSprite.source = ""
    }

    function checkForReady() {
        return mThisBasicImageSource_ForLoader.checkForReady()
    }

    /**
      Error message if download is not done
      */
    function vStringErrorDownload() {
        return mThisBasicImageSource_ForLoader.vStringErrorDownload()
    }

    /*
      Getters & Setters
      */
    function getsubFolder() {
        return subFolder;
    }
    function getfileSprite() {
        return fileSprite;
    }
    function getSource() {
        return mThisBasicAnimatedSprite.source
    }
    function getAnimatedSprite() {
        return mThisBasicAnimatedSprite;
    }






}
