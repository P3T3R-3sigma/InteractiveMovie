import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v3"

SceneAbstract {

    id: mTHIS_TUTO_BASIC_IMAGE_V1

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


    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////


    onWStartChanged: {

    }

    BasicDebugWindow {
        text: "This is a debug window\nClick to change the colour of the text in green"
        heightPercent: 0.40
        widthPercent: 0.60
        xPercent: 0.2
        yPercent: 0.2
        onClicked: {
            textColor = "green"
        }



    }


}
