import QtQuick
import Felgo
import "../../../abstract"
import "../../BasicImageSource/v4"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"

SceneAbstract {


    /*


      */

    /////////////////////////////////////////////////////////////
    //      OTHER LIBRAIRIES NEEDED
    /////////////////////////////////////////////////////////////
    BasicDisplay {
        id: mBasicDisplay
    }
    BasicNum {
        id: mBasicNum
    }
    BasicConst {
        id: mBasicConst
    }
    BasicReflection {
        id: mBasicReflection
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }
    BasicImageSourceManager {
        id: mBasicImageSourceManager
    }
    BasicSource {
        id: mBasicSource
    }
    BIScBasicImageSourceConstants {
        id: cBIS
    }


    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    Component.onCompleted: {
        pBasic1.mIS_DEBUG = true
        pBasic2.mIS_DEBUG = true
        pBasic3.mIS_DEBUG = true
        pBasic4.mIS_DEBUG = true
        pBasic5.mIS_DEBUG = true
        pBasic6.mIS_DEBUG = true
        pBasic7.mIS_DEBUG = true

        setToReadySelf(pBasic3, true)
        setToReadySelf(pBasic1, true)
        setToReadySelf(pBasic7, true)
        setToReadySelf(pBasic2, true)
        setToReadySelf(pBasic6, true)
        setToReadySelf(pBasic6, false)
    }

    Basic {
        id: pBasic1
        mName: "pBasic1"

        Item {
            id: pItem11
            property string mName: "pItem11"

            Basic {
                id: pBasic2
                mName: "pBasic2"
            }

            Basic {
                id: pBasic3
                mName: "pBasic3"

                Item {
                    id: pItem1121
                    property string mName: "pItem1121"

                    Basic {
                        id: pBasic5
                        mName: "pBasic5"

                        mIsReadySelf: true

                    }

                    Basic {
                        id: pBasic6
                        mName: "pBasic6"

                    }
                }

                Basic {
                    id: pBasic4
                    mName: "pBasic4"

                    mIsReadySelf: true

                }

            }
        }

        Item {
            id: pItem12
            property string mName: "pItem12"

            Basic {
                id: pBasic7
                mName: "pBasic7"

                Item {
                    id: pItem1211
                    property string mName: "pItem1211"

                }
            }
        }
    }

    function setToReadySelf(sBasic, sValue) {
        console.log();
        console.log("Setting " + sBasic.getmName() + " to " + sValue);
        sBasic.mIsReadySelf = sValue
        display();
    }

    function display() {
        console.log(pBasic1.vString())
        console.log(pBasic2.vString())
        console.log(pBasic3.vString())
        console.log(pBasic4.vString())
        console.log(pBasic5.vString())
        console.log(pBasic6.vString())
        console.log(pBasic7.vString())
    }


    AppButton {
        id: pThisAppButton

        anchors.centerIn: parent
        width: parent.width * 0.40
        height: parent.height * 0.20
        text: "Click to launch simulation"
        onClicked: {
            parent.display();
            setToReadySelf(pBasic3, true)
            setToReadySelf(pBasic1, true)
            setToReadySelf(pBasic7, true)
            setToReadySelf(pBasic2, true)
            setToReadySelf(pBasic6, true)
            setToReadySelf(pBasic6, false)
            setToReadySelf(pBasic6, true)
        }
    }

    AppButton {
        width: pThisAppButton.width
        height: pThisAppButton.height
        x: pThisAppButton.x
        y: pThisAppButton.y - pThisAppButton.height * 1.25
        text: "Click to show in console"
        onClicked: {
            parent.display();
        }
    }

    AppButton {
        width: pThisAppButton.width
        height: pThisAppButton.height
        x: pThisAppButton.x
        y: pThisAppButton.y + pThisAppButton.height * 1.25
        text: "switch pBasic6.visible= " + pBasic6.visible
        onClicked: {
            pBasic6.visible = !pBasic6.visible
        }
    }















}
