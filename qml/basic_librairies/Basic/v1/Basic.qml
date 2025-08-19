import QtQuick
import Felgo

Item {


    /**
      This item is used to know when it is ready
      it is useful to know when images are loaded, when text are ready too
      */

    id: mTHIS_BASIC

    /*
      Signals
                be carefull, if the Basic was ReadyFull and for some reason is no longer ReadyFull, then no signal are sent
                but if the Basic is ReadyFull, then each time the Basic becomes visible again, the signal visibleAndReady is sent
      */
    signal ready                // sent when the Basic and all its children are ready (= mIsReadfull == true)
    signal visibleAndReady      // sent when the Basic is visible and ready all its children are ready (= mIsBasicCompleted && visible && mIsReadyFull)
    /*
      Controls
      */
    property bool mIS_DEBUG: false
    property bool mIsReadySelf      //  if the Basic is ready, but without guarantee that the children are ready
    /*
      Variables
      */
    property bool mIsVisible: visible
    property bool mIsReadyFull // if the Basic and all its children are ready
    property bool mIsVisibleAndReady: mIsVisible && mIsReadyFull
    property var mListCloserChildrenBasic
    property var mCloserParentBasic
    property string mName: (mTHIS_BASIC + "").substring(0, (mTHIS_BASIC + "").indexOf("_"))
    property bool mIsBasicCompleted


    /*
      Build the list of childrend who are of type Basic
      */
    Component.onCompleted: {
        /*
          Get the list of direct children of type Basic
          */
        mListCloserChildrenBasic = shadow_getmRecursiveListCloserChildren(mTHIS_BASIC)
        /*
          Get the higher parent which is of type Basic
          */
        let lParentCurrent = mTHIS_BASIC.parent
        mCloserParentBasic = null
        while (lParentCurrent && !mCloserParentBasic) {
            if (lParentCurrent instanceof Basic) {
                mCloserParentBasic = lParentCurrent
            }
            lParentCurrent = lParentCurrent.parent
        }
        /*
          Communication
          */
        if (mIS_DEBUG) {
            console.log()
            console.log("Completed Basic= " + mName)
            console.log("mCloserParentBasic= " + (!mCloserParentBasic ? mCloserParentBasic : mCloserParentBasic.getmName()))
            for (let lIdx = 0; lIdx < mListCloserChildrenBasic.length; lIdx++) {
                let lChild = mListCloserChildrenBasic[lIdx]
                console.log("Child " + lIdx + "= " + lChild.getmName())
            }
        }
        /*
          */
        mIsBasicCompleted = true
        shadow_Check_For_Signals_to_send();
    }

    onMIsVisibleChanged: {
        shadow_Check_For_Signals_to_send();
    }


    /*
      The developer should set the boolean to true (in case the image is loaded) or false (in case the source is destroyed)
      We check the immediate children to know if we are readyFull
      if we are readyFull, we check the immediate parent
      */
    onMIsReadySelfChanged: {
        shadow_consequence_IsReadySelf_Changed()
    }

    /**
      */
    onMIsReadyFullChanged: {
        shadow_consequence_IsReadyFull_Changed()
        if (mIsReadyFull) {
            if (mIS_DEBUG) {
                console.log("Basic -> sending signal 'ready'; Basic= " + mName)
            }
            mTHIS_BASIC.ready()
        }
    }

    /*
      Treat the case of random order of instantiaton
      */
    onMListCloserChildrenBasicChanged: {
        shadow_fullRecompute()
    }

    onMCloserParentBasicChanged: {
        shadow_fullRecompute()
    }

    function shadow_fullRecompute() {
        shadow_computeIsReadyFull()
        if (mCloserParentBasic) {
            mCloserParentBasic.shadow_computeIsReadyFull();
        }
    }

    /*
      */
    function shadow_consequence_IsReadySelf_Changed() {
        shadow_computeIsReadyFull();
    }

    /**
      */
    function shadow_consequence_IsReadyFull_Changed() {
        if (mCloserParentBasic) {
            mCloserParentBasic.shadow_computeIsReadyFull();
        }
        shadow_Check_For_Signals_to_send();
    }

    /**

      */
    function shadow_Check_For_Signals_to_send() {
        mIsVisibleAndReady = mIsBasicCompleted && visible && mIsReadyFull
    }

    onMIsVisibleAndReadyChanged: {
        if (mIsVisibleAndReady) {
            if (mIS_DEBUG) {
                console.log("Basic -> sending signal 'visibleAndReady'; Basic= " + mName)
            }
            mTHIS_BASIC.visibleAndReady()
        }
    }

    /**
      We check the Basic is ready
      We check on all the children that the Basic are ready.
      */
    function shadow_computeIsReadyFull() {
        let lIsReady = mIsReadySelf;
        if (lIsReady && mListCloserChildrenBasic) {
            for (let lIdx = 0; lIdx < mListCloserChildrenBasic.length; lIdx++) {
                let lChild = mListCloserChildrenBasic[lIdx]
                if (!lChild.getmIsReadyFull()) {
                    lIsReady = false;
                    break;
                }
            }
        }
        mIsReadyFull = lIsReady;
    }

    /*
      All the children and grand-children which are of the type basic at the first level encounter
      */
    function shadow_getmRecursiveListCloserChildren(sItem) {
        if (mIS_DEBUG) {
            console.log("shadow_getmRecursiveListCloserChildren.sItem= " + sItem + "; Nb children= " + (sItem ? sItem.children.length : ""))
        }
        if (!sItem || !sItem.children) {
            return [];
        }
        let lListChildrenBasic = []
        for (let lIdx = 0; lIdx < sItem.children.length; lIdx++) {
            let lChild = sItem.children[lIdx]
            if (mIS_DEBUG) {
                console.log("shadow_getmRecursiveListCloserChildren.child= " + lChild)
            }
            if (lChild instanceof Basic) {
                lListChildrenBasic.push(lChild);
            } else {
                lListChildrenBasic = lListChildrenBasic.concat(shadow_getmRecursiveListCloserChildren(lChild));
            }
        }
        return lListChildrenBasic;
    }

    /*
      */
    function vStringBasic() {
        return mName + ": mIsReadySelf= " + mIsReadySelf + "; mIsReadyFull= " + mIsReadyFull
    }

    function vStringBasicStatus() {
        let lText= "\nBasic= " + mName
        lText += "\nmCloserParentBasic= " + (mCloserParentBasic ? (mCloserParentBasic.vStringBasic()) : mCloserParentBasic)
        lText += "\nNb children= " + mListCloserChildrenBasic.length
        for (let lIdx = 0; lIdx < mListCloserChildrenBasic.length; lIdx++) {
            let lChild = mListCloserChildrenBasic[lIdx]
            lText += "\nCloserChild " + lIdx + "= " + lChild.vStringBasic();
        }
        return lText;
    }


    function debug_audit_start() {
        mTIMER_DEBUG_BASIC.start()
    }

    Timer {
        id: mTIMER_DEBUG_BASIC

        interval: 1000
        repeat: true
        onTriggered: {
            console.log()
            console.log(vStringBasic())
            console.log(vStringBasicStatus())
        }
    }

    /*
      Getters & Setters
      */
    function getmIsReadyFull() {
        return mIsReadyFull;
    }
    function getmIsVisibleAndReady() {
        return mIsVisibleAndReady
    }
    function getmName() {
        return mName;
    }
    function setmIsReadSelf(sIsReadySelf) {
        mIsReadySelf = sIsReadySelf;
    }
    function getmIsReadySelf() {
        return mIsReadySelf;
    }
    function setmName(sName) {
        mName = sName
    }





















}
