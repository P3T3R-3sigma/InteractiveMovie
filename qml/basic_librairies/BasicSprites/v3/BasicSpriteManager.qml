import QtQuick
import Felgo

Item {

    id: mThisBasicSpriteManager

    /*
      Controls
      */
    property string mSubFolder: "Sprites/"      // default subFolder for all the BasicSprites
    property bool mIS_DEBUG: false
    /*
      Variables
      */
    property var mListBasicSprite: []

    /**
      */
    function declareNewBasicSprite(sBasicSprite) {
        mListBasicSprite.push(sBasicSprite)
        if (mIS_DEBUG) {
            console.log("Number of BasicSprite declared to BasicSpriteManager= " + mListBasicSprite.length);
        }
    }

    /**
      Pause all the sprites
      */
    function pause() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.running = false;
        }
    }

    /*
      Resumes the sprite animation if paused is true; otherwise, this does nothing.
      */
    function resume() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.running = true;
        }
    }

    /**
      Pause all the sprites
      */
    function hide() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.running = false;
            lBasicSprite.visible = false;
        }
    }

    /**
      Pause all the sprites
      */
    function show() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.running = true;
            lBasicSprite.visible = true;
        }
    }

}
