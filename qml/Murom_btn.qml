import QtQuick 2.6
import Qt.labs.controls 1.0

Rectangle {
    property alias text: txt.text


    //   width: 300
    //   height: 200
    // цвет для хаки
 //   color: "#d6b200"
    //цвет для серого
       color: "#bababa"
    radius: 100
    border.width: 10
    Button {
        id: btn_custom
        text: "Развернуть"
        opacity: 0
        anchors.fill: parent
        onClicked: {
            qmlComm.rezimChanged(txt.text)



        }
    }

    Text {
        id: txt
        text: qsTr("")
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 48
    }

}
