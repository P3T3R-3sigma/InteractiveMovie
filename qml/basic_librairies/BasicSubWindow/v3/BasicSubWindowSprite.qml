import QtQuick
import Felgo
import "../../BasicSprites/v3"

BasicSubWindow {

    /**

      BEWARE: DOES NOT WORK IF THE SUBWINDOW GOES OUT OF THE FINAL ITEM DIMENSIONS
      WE SHOULD RESPECT THE INITIAL RATIO OF THE IMAGE AND NOT CROP IT

      */


    id: mThisBasicSubWindowSprite

    property string subFolder // = the folder when all the sequence of the sprites are located
    property string fileSpriteFirst // the first file of the sprite sequence. We will deduce the frame count
    property string fileSpriteLast // the last file of the sprite sequence. We will deduce the number of spriteSheets and the countFrame of the last file
    property bool mIS_DEBUG: false
    property int frameRate: 10

    /**

      */
    onFileSpriteFirstChanged: {
        if (fileSpriteFirst !== "") {
            let lWords = fileSpriteFirst.split("_")
            let lIdx = lWords.indexOf("XYWH")
            if (lIdx > 0) {
                let lX0 = parseInt(lWords[lIdx + 1])
                let lY0 = parseInt(lWords[lIdx + 2])
                let lW0 = parseInt(lWords[lIdx + 3])
                let lH0 = parseInt(lWords[lIdx + 4])
                mX0Y0W0H0 = [lX0, lY0, lW0, lH0]
                /*
                  Debug
                  */
                if (mIS_DEBUG) {
                    console.log("mX0Y0W0H0= " + mX0Y0W0H0)
                }
            }
        }
    }

    /*
      The actual sprite
      */
    BasicSprite {
        id: mThisBasicSprite

        anchors.fill: mThisBasicSubWindowSprite

        subFolder: mThisBasicSubWindowSprite.subFolder
        fileSpriteFirst: mThisBasicSubWindowSprite.fileSpriteFirst
        fileSpriteLast: mThisBasicSubWindowSprite.fileSpriteLast
        mIS_DEBUG: mThisBasicSubWindowSprite.mIS_DEBUG
        frameRate: mThisBasicSubWindowSprite.frameRate
    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        return [mThisBasicSprite]
    }
    function getmThisBasicSprite() {
        return mThisBasicSprite;
    }

}
