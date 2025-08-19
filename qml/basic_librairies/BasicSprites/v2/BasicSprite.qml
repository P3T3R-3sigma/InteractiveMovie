import QtQuick
import Felgo

GameSpriteSequence {

    id: mThisBasicSprite

    /**
      Allows to have several images for the sprite
      */


    /*
      Necessary Inputs
      */
    property string subFolder // = the folder when all the sequence of the sprites are located
    property string fileSpriteFirst // the first file of the sprite sequence. We will deduce the frame count
    property string fileSpriteLast // the last file of the sprite sequence. We will deduce the number of spriteSheets and the countFrame of the last file
    /*
      Controls
      */
    property string mSubFolderRoot: mBasicSpriteManager.mSubFolder  //= 'Sprites/'
    property bool mIS_DEBUG: false
    property real widthPercent
    property real heightPercent
    property real xPercent
    property real yPercent
    property int mFrameRate: 10
    /*
      Variables
      */
    property string mKeyLoaded: ""

    /*
      Register to the BasicSpriteManager (so that we can stop/start all sprites)
      */
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
        if (sprites.length > 0 && heightPercent > 0) {
            heightPercent
                    * parent.height / parent.width
                    * sprites[0].frameWidth / sprites[0].frameHeight
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (sprites.length > 0 && widthPercent > 0) {
            widthPercent
                    * parent.width / parent.height
                    * sprites[0].frameHeight / sprites[0].frameWidth
        } else {
            0
        }
    }

    /*
      From the file name we deduce all parameters of the GameSprite
      */
    onFileSpriteFirstChanged: {
        createSprites();
    }
    onFileSpriteLastChanged: {
        createSprites();
    }
    onSubFolderChanged: {
        createSprites();
    }
    onMSubFolderRootChanged: {
        createSprites();
    }

    /*
      Allow to create dynamically
      */
    Component {
        id: mThisComponentGameSprite

        /*
          Note: a GameSprite can only be in a GameSpriteSequence. It cannot exist independently
          */
        GameSprite {

        }
    }

    /**
      Create dynamicall the sprites
      Deduce the parameters from the names of the files
      */
    function createSprites() {
        /*
          We need all the name of the files, and the name of the subfolders
          */
        if (mBasicNum.isNull(fileSpriteFirst) || fileSpriteFirst === "") {
            return;
        }
        if (mBasicNum.isNull(fileSpriteLast) || fileSpriteLast === "") {
            return;
        }
        if (mBasicNum.isNull(subFolder) || subFolder === "") {
            return;
        }
        if (mBasicNum.isNull(mSubFolderRoot) || mSubFolderRoot === "") {
            return;
        }
        /*
          Check if we loaded already this
          */
        let lKey = fileSpriteFirst + ";" + fileSpriteLast + ";" + subFolder + ";" + mSubFolderRoot
        if (mKeyLoaded === lKey) {
            return;
        } else {
            mKeyLoaded = lKey
        }
        /*
          Reset the list of sprites
          */
        if (sprites.length > 0) {
            for (let lIdx = 0; lIdx < sprites.length; lIdx++) {
                sprites[lIdx].destroy()
            }
        }
        /*
          Debug
          */
        if (mIS_DEBUG) {
            console.log();
            console.log("mSubFolderRoot= " + mSubFolderRoot);
            console.log("subFolder= " + subFolder);
            console.log("fileSpriteFirst= " + fileSpriteFirst)
            console.log("fileSpriteLast= " + fileSpriteLast)
        }
        /**
          Deduce from the name of the file the parameters of each sprite
          */
        let lFrameCountStr = "FrameCount"
        let lXYWHStr = "XYWH"
        let lIdxStr = "Idx"
        /*
          Error message
          */
        if (!fileSpriteLast.includes(lXYWHStr)) {
            mBasicDisplay.error(mThis, "The name of the sprite file should contain 'XYWH'")
        }
        if (!fileSpriteLast.includes(lFrameCountStr)) {
            mBasicDisplay.error(mThis, "The name of the sprite file should contain '" + lFrameCountStr + "'")
        }
        /*
          Find the data inside the name
          */
        if (fileSpriteLast.includes(lXYWHStr) && fileSpriteLast.includes(lFrameCountStr)) {
            let lWordsLast = fileSpriteLast.split("_");
            /*
              Get the size of a frame
              */
            let lIdxXYWH = lWordsLast.indexOf(lXYWHStr)
            let lFrameWidth = parseInt(lWordsLast[lIdxXYWH + 3]);
            let lFrameHeight = parseInt(lWordsLast[lIdxXYWH + 4]);
            /*
              Get the number of the spriteSheets
              */
            let lIdxIdx = lWordsLast.indexOf(lIdxStr)
            let lCountSprites = parseInt(lWordsLast[lIdxIdx + 1]);
            /*
              Get the default root name of the file
              */
            let lIdxLastWord = fileSpriteFirst.lastIndexOf("_")
            let lNameFileRoot = fileSpriteFirst.substring(0, lIdxLastWord + 1);
            /*
              Debug
              */
            if (mIS_DEBUG) {
                console.log("frameWidth= " + lFrameWidth)
                console.log("frameHeight= " + lFrameHeight)
                console.log("Number of spriteSheets= " + lCountSprites)
            }
            /*
              Create the list of sprites dynamically
              */
            let lListGameSprite = []
            for (let lIdx = 1; lIdx <= lCountSprites; lIdx++) {
                /*
                  Create the Game sprite dynamically and put it in the list
                  */
                let lGameSprite = mThisComponentGameSprite.createObject(mThisBasicSprite)
                /*
                  Find out the name of the file
                  */
                let lNameFile
                if (lIdx === 1) {
                    lNameFile = fileSpriteFirst
                } else if (lIdx === lCountSprites) {
                    lNameFile = fileSpriteLast
                } else {
                    lNameFile = lNameFileRoot + lIdx + ".png"
                }
                /*
                  Find out the FrameCount from the file name (deduced from the name of the file)
                  */
                let lWords = lNameFile.split("_");
                let lIdxFrameCount = lWords.indexOf(lFrameCountStr)
                let lFrameCount = parseInt(lWords[lIdxFrameCount + 1])
                /*
                  Initiate the GameSprite
                  */
                lGameSprite.frameWidth = lFrameWidth
                lGameSprite.frameHeight = lFrameHeight
                lGameSprite.frameCount = lFrameCount
                lGameSprite.source = Qt.resolvedUrl(mBasicSource.getSource(lNameFile, mSubFolderRoot, subFolder))
                lGameSprite.anchors.fill = mThisBasicSprite
                lGameSprite.name = "No" + (lIdx - 1)
                lGameSprite.frameRate = mThisBasicSprite.mFrameRate
                /*
                  Add to the list
                  */
                lListGameSprite.push(lGameSprite)
            }
            /*
              Notify that GameSprite should be played one after another
              */
            for (let lIdx = 0; lIdx < sprites.length; lIdx++) {
                let lGameSprite = sprites[lIdx]
                let lIdxNext = lIdx + 1;
                if (lIdxNext >= sprites.length) {
                    lIdxNext = 0
                }
                let lGameSpriteNext = sprites[lIdxNext]
                let lJSonObject = {}
                lJSonObject[lGameSpriteNext.name] = 1
                lGameSprite.to = lJSonObject
            }
            /*
              Debug
              */
            if (mIS_DEBUG) {
                for (let lIdx = 0; lIdx < sprites.length; lIdx++) {
                    let lGameSprite = sprites[lIdx]
                    console.log()
                    console.log("lGameSprite.name= " + lGameSprite.name)
                    console.log("lGameSprite= " + lGameSprite.toString())
                    console.log("lGameSprite.source= " + lGameSprite.source)
                    console.log("lGameSprite.frameCount= " + lGameSprite.frameCount)
                    console.log("lGameSprite.frameWidth= " + lGameSprite.frameWidth)
                    console.log("lGameSprite.frameHeight= " + lGameSprite.frameHeight)
                    console.log("lGameSprite.to= " + JSON.stringify(lGameSprite.to))
                }
            }
        }
    }
















}
