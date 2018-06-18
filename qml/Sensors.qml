import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import QtQuick.Controls 1.5


Rectangle {

    id: base
    property alias mouseArea: mouseArea
 color: "#778591"
    width: 0
    height: 0
    state: ""
    Connections {
        target: qmlComm
        onTransmitNewText: txt_msg.text = text
    }
    Image {
        id: image_haki
        clip: false
        anchors.fill: parent
      //  source: "858490.jpg"
        width: parent.width

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            width: parent.width

            ListView {
                id: sensors_list
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                model: sensorlist
             //    height: ListModel.count * 100
                delegate: Item {
                    x: 5
                    width: parent.width
                    height:  36


                    Row {
                        id: row1
                        x: 0
                        y: 0
                        spacing: 10

                        Text {
                            text: model.modelData.name
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                             font.pixelSize: 36
                            color: "white"
                        }

                        Text {
                            text: model.modelData.value
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                             font.pixelSize: 36
                            color: "white"
                        }
                    }
                }

            }
        }
    }
}


