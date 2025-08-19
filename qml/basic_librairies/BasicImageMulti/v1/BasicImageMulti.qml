import QtQuick
import Felgo
import Qt5Compat.GraphicalEffects
import "../../BasicItem/v3"
import "../../BasicImage/v3"
import "../../BasicImageSource/v4"

BasicItem {

    id: mTHIS_BASIC_IMAGE_MULTI_V1

    /**
      Constants
      */
    property bool mIS_SHOW_COMMUNICATION: false
    /**
      Variables for the sources
      */
    property var mListBasicImageSource: []
    property string mSubFolderSimple: ""
    property var mArraySourcesSimple: []    //   sources = assets/Images/mSubFolderSimple/[SourcesSimple]
    property var mArraySources: []          //  should be full sources ("../../assets/etc)
    property int mIdxImageShow
    /**
      Properties similar to the BasicImage
      */
    property int fillMode: Image.PreserveAspectCrop
    property real radiusPct
    property real borderWidthPct
    property color borderColor: Qt.color("magenta")
    property color backgroundColor: Qt.color("transparent")
    property real backgroundOpacity: 1


    /**
      Change the array source simple into array sources
      */
    onMArraySourcesSimpleChanged: {
        let lArraySources = []
        for (let lIdx = 0; lIdx < mArraySourcesSimple.length; lIdx++) {
            let lSourceSimple = mArraySourcesSimple[lIdx]
            let lSource = "Images/" + mBasicSource.shadow_AddSlash(mSubFolderSimple) + lSourceSimple
            lArraySources.push(lSource);
        }
        mArraySources = lArraySources;
    }

    /**
      Declare the sources of images
      */
    onMArraySourcesChanged: {
        if (mArraySources.length > 0) {
            mListBasicImageSource = [];
            for (let lIdx = 0; lIdx < mArraySources.length; lIdx++) {
                let lSource = mArraySources[lIdx];
                if (mIS_SHOW_COMMUNICATION) {
                    console.log("lSource= " + lSource);
                }
                let lComponent = Qt.createComponent("../../BasicImageSource/v4/BasicImageSource.qml");
                let lBasicImageSource = lComponent.createObject(mTHIS_BASIC_IMAGE_MULTI_V1);
                lBasicImageSource.mSource = lSource
                mListBasicImageSource.push(lBasicImageSource);
                /**
                  Initiate
                  */
                lBasicImageSource.anchors.fill = mTHIS_BASIC_IMAGE_MULTI_V1
            }
            mListBasicImageSource[0].forceDownload()
        }
        /*
          Parameters
          */
        updateDataAllBasicImageSource();
        /*
          Initiate and launch
          */
        mIdxImageShow = -1;
        chooseImage();
    }

    /**
      Can be overriden - allows to define only with heightPercent and to deduce widthPercent
      */
    widthPercent: {
        if (mTHIS_BASIC_IMAGE_MULTI_V1.progress == 1 && heightPercent != 0) {
            heightPercent
                * parent.height / parent.width
                * mTHIS_BASIC_IMAGE_MULTI_V1.sourceSize.width / mTHIS_BASIC_IMAGE_MULTI_V1.sourceSize.height
        } else {
            0
        }
    }

    /**
      Can be overriden - allows to define only with widthPercent and to deduce heightPercent
      */
    heightPercent: {
        if (mTHIS_BASIC_IMAGE_MULTI_V1.progress == 1 && widthPercent != 0) {
            widthPercent
                * parent.width / parent.height
                * mTHIS_BASIC_IMAGE_MULTI_V1.sourceSize.height / mTHIS_BASIC_IMAGE_MULTI_V1.sourceSize.width
        } else {
            0
        }
    }

    /*
      Background: when the image is not loaded
      */
    Rectangle {
        id: mBasicImage_Background

        radius: parent.radiusPct * Math.min(parent.width, parent.height)
        anchors.fill: parent
        color: backgroundColor
        opacity: backgroundOpacity

        z: -1
    }

    /*
      Border, defined by border width
      */
    Rectangle {
        id: mBasicImage_Border

        radius: mBasicImage_Background.radius
        anchors.fill: parent
        color: "transparent"

        border.width: Math.min(parent.width, parent.height) * parent.borderWidthPct
        border.color: parent.borderColor

        z: 1
    }

    /*
      Mask to round the image
      */
    Rectangle {
        id: mBasicImage_Mask

        visible: false

        anchors.fill: parent
        radius: mBasicImage_Background.radius
        color: "yellow"

        z: 2
    }

    layer.enabled: radiusPct > 0
    layer.effect: OpacityMask {
        maskSource: mBasicImage_Mask
    }

    /**
      Click to display the next image
      */
    MouseArea {
        id: mMOUSEAREA_CHANGE_IMAGE

        anchors.fill: parent
        onClicked: {
            chooseImage();
        }

        z: 3
    }

    function chooseImage() {
        mIdxImageShow++;
        if (mIdxImageShow >= mListBasicImageSource.length) {
            mIdxImageShow = 0;
        }
        for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
            let lBasicImageSource = mListBasicImageSource[lIdx];
            lBasicImageSource.visible = lIdx === mIdxImageShow;
        }
    }

    /**
      Pass variables to BasicImageSource
      */
    onFillModeChanged: {
        updateDataAllBasicImageSource();
    }

    function updateDataAllBasicImageSource() {
        for (let lIdx = 0; lIdx < mListBasicImageSource.length; lIdx++) {
            let lBasicImageSource = mListBasicImageSource[lIdx];
            if (lBasicImageSource.fillMode !== fillMode) {
                lBasicImageSource.fillMode = fillMode
            }
        }
    }

    /*
      Getters & Setters
      */
    function getmListItemToCheckIfLoaded() {
        return mListBasicImageSource
    }


}
