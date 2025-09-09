import QtQuick
import Felgo

Item {

    id: item

    property var mStatusEnum: {
        "ACCESSIBLE": 0,
        "LOCKED": 1,
        "HIDDEN": 2,
        "TERMINATED": 3
    }
    property var mDisplayEnum: {
        "ONE_VIDEO": 0,
        "TWO_VIDEO": 1,
        "IMAGE": 2
    }
    property real mPADDING_H : 0.02
    property int cBaseTime: 5000
    property int cAdditionalTime: 2000

}
