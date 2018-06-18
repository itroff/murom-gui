import QtQuick 2.6
import Qt.labs.controls 1.0

Rectangle {
    id: rect
    color: "#d6b200"
    radius: 100
    border.width: 10
    signal buttonUpClicked
    signal buttonDownClicked

    Item {
        y:0
        width: parent.width
        height: parent.height/2

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/arrow_up_5741.png"
        }
        Button {
            id: btn_up
            opacity: 0
            anchors.fill: parent
            onClicked: {
                 rect.buttonUpClicked()
            }
        }
    }
    Item {
        y:parent.height/2
        width: parent.width
        height: parent.height/2
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/arrow_down_6649.png"
        }
        Button {
            id: btn_down
            opacity: 0
            anchors.fill: parent
            onClicked: {
                 rect.buttonDownClicked()
            }
        }
    }

}

