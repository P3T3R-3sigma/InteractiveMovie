import QtQuick
import Felgo

Item {

    id: mThis   // why?

    /*
      Example:

                source: mBasicSource.getSource("boxes_light_no_battery.jpg", "Images/InteractPuzzles", null, true);

                let lSource = mBasicSource.getSource(lSourceSimple, "Images/" + mSubFolderSimple)

                source = mBasicSource.getSource(sourceSimple, "Images")

                source: mBasicSource.getSource(fileSprite, mBasicSpriteManager.mSubFolder + "/" + subFolder)

                lGameSprite.source = Qt.resolvedUrl(mBasicSource.getSource("../../../..", lNameFile, mSubFolderRoot, subFolder))  Why Qt.resolvedUrl twice??


      */

    property string mPATH_TO_ASSETS: "../../../../"
    property string mMODE_SOURCE: "HotReload" // "HotReload", "WebAssembly", or "DeployWindows"
    property bool mIS_DEBUG: false
    property string mROOT_HTTP: "https://3sigma-studios.com/escapes/assets/"

    /**
        mPATH_TO_ASSETS: what is before "assets" for hotreload, does not contain 'assets'
        sSourceFromAssets: the actual name of the file
        sOptionalMiddlePath: what comes between the 'assets/' and 'sSourceFromAssets'
        sOptionalMiddlePath2: useful when we dont want to bother about the presence of '/' at the end
      */
    function getSource(sSourceFromAssets, sOptionalMiddlePath, sOptionalMiddlePath2, sIsDebug) {
        /*
          Debug
          */
        if (mIS_DEBUG || (mBasicNum.isNotNull(sIsDebug) && sIsDebug)) {
            console.log();
            console.log("Entering getSource");
            console.log("mPATH_TO_ASSETS= " + mPATH_TO_ASSETS);
            console.log("sSourceFromAssets= " + sSourceFromAssets);
            console.log("sOptionalMiddlePath= " + sOptionalMiddlePath);
            console.log("sOptionalMiddlePath2= " + sOptionalMiddlePath2);
        }
        /*
          Case of null (usually at instantiation) --> we return ""
          */
        if (mBasicNum.isNull(sSourceFromAssets) || sSourceFromAssets === "") {
            return "";
        }
        /*
          Create Middle path
          */
        let lMiddlePath = shadow_AddSlash(sOptionalMiddlePath) + shadow_AddSlash(sOptionalMiddlePath2)
        /*
          Create Source
          */
        let lSource;
        /*
          Case of https --> we return the source directly
          */
        if (sSourceFromAssets.startsWith("https")) {
            lSource = sSourceFromAssets;
        } else {
            switch (mMODE_SOURCE) {
                case "HotReload":   // Case of HotReload --> we need a relative path to asset
                    lSource = shadow_getSourceHotReload(mPATH_TO_ASSETS, sSourceFromAssets, lMiddlePath)
                    break

                case "WebAssembly": // WebAssembly
                    lSource = shadow_AddSlash(mROOT_HTTP) + lMiddlePath + sSourceFromAssets
                    break

                case "DeployWindows":   //  Deploy --> we need qrc for bundles
                    lSource = shadow_getSourceDeploy(sSourceFromAssets, lMiddlePath)
                    break

                default: mBasicDisplay.error(mThis, "mMODE_SOURCE is not correct; mMODE_SOURCE= " + mMODE_SOURCE)
            }
        }

        /*
          Debug
          */
        if (mIS_DEBUG || (mBasicNum.isNotNull(sIsDebug) && sIsDebug)) {
            console.log("BasicSource.source= " + lSource);
            console.log("Qt.resolvedUrl(BasicSource.source)= " + Qt.resolvedUrl(lSource));
            console.log()
        }
        /*
          Use the Qt.resolveurl
          */
        return Qt.resolvedUrl(lSource);
    }

    /**

      */
    function shadow_getSourceHotReload(sRelativePathToAssets, sSourceSimple, sOptionalMiddlePath) {
        let lPath = shadow_formatPath(sRelativePathToAssets)
        let lSource = shadow_formatSourceSimple(sSourceSimple)
        return lPath + "/assets/" + shadow_AddSlash(sOptionalMiddlePath) + lSource;
    }

    /**

      */
    function shadow_getSourceDeploy(sSource, sOptionalMiddlePath) {
        let lSource = shadow_formatSourceSimple(sSource);
        return "qrc:/assets/" + shadow_AddSlash(sOptionalMiddlePath) + lSource
    }

    /*
      Path with the end slash if it is missing
      */
    function shadow_formatPath(sPath) {
        if (mBasicNum.isNull(sPath)) {
            return ""
        }
        let lPath = sPath
        lPath = lPath.replace(/\/\//g, "/")
        lPath = shadow_removeEnd(lPath, "/");
        lPath = shadow_removeEnd(lPath, "assets");
        lPath = shadow_removeEnd(lPath, "/");
        return lPath;
    }

    /**
      Remove slash at the beginning
      remove 'assets' if it is there
      */
    function shadow_formatSourceSimple(sSourceSimple) {
        if (mBasicNum.isNull(sSourceSimple)) {
            return ""
        }
        let lSource = sSourceSimple;
        lSource = lSource.replace(/\/\//g, "/")
        lSource = shadow_removeStart(lSource, "/");
        lSource = shadow_removeStart(lSource, "assets");
        lSource = shadow_removeStart(lSource, "/");
        return lSource
    }

    /*
      Remove the start of the sString if it starts with sRemoveIfStarts
      */
    function shadow_removeStart(sString, sRemoveIfStarts) {
        if (mBasicNum.isNull(sRemoveIfStarts)) {
            return sString;
        }
        if (sString.startsWith(sRemoveIfStarts)) {
            return sString.substring(sRemoveIfStarts.length, sString.length)
        } else {
            return sString;
        }
    }

    /*
      Remove the start of the sString if it starts with sRemoveIfStarts
      */
    function shadow_removeEnd(sString, sRemoveIfEnds) {
        if (mBasicNum.isNull(sRemoveIfEnds)) {
            return sString;
        }
        if (sString.endsWith(sRemoveIfEnds)) {
            return sString.substring(0, sString.length - sRemoveIfEnds.length)
        } else {
            return sString;
        }
    }

    /**
      */
    function shadow_addStart(sString, sAddIfMissing) {
        if (mBasicNum.isNull(sAddIfMissing)) {
            return sString;
        }
        if (!sString.startsWith(sAddIfMissing)) {
            return sAddIfMissing + sString;
        } else {
            return sString
        }
    }

    /**
      */
    function shadow_addEnd(sString, sAddIfMissing) {
        if (mBasicNum.isNull(sAddIfMissing)) {
            return sString;
        }
        if (!sString.endsWith(sAddIfMissing)) {
            return sString + sAddIfMissing;
        } else {
            return sString
        }
    }

    /**
      Add a slash if not null
      */
    function shadow_AddSlash(sPath) {
        if (mBasicNum.isNull(sPath) || sPath === "") {
            return ""
        }
        return shadow_addEnd(sPath, "/")
    }
}
