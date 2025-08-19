import QtQuick
import Felgo

Item {

    id: mThisBasicSpriteManager

    /*
      Controls
      */
    property string mSubFolder      // default subFolder for all the BasicSprites
    property bool mIS_DEBUG: false
    /*
      Variables
      */
    property list<BasicSprite> mListBasicSprite: []

    /**
      */
    function declareNewBasicSprite(sBasicSprite) {
        mListBasicSprite.push(sBasicSprite)
        if (mIS_DEBUG) {
            console.log("Number of sprites= " + mListBasicSprite.length);
        }
    }

    /**
      Pause all the sprites
      */
    function pause() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.pause();
        }
    }

    /*
      Resumes the sprite animation if paused is true; otherwise, this does nothing.
      */
    function resume() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.resume();
        }
    }

    /**
      Pause all the sprites
      */
    function hide() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.pause();
            lBasicSprite.visible = false;
        }
    }

    /**
      Pause all the sprites
      */
    function show() {
        for (let lIdx = 0; lIdx < mListBasicSprite.length; lIdx++) {
            let lBasicSprite = mListBasicSprite[lIdx]
            lBasicSprite.resume();
            lBasicSprite.visible = true;
        }
    }

}
