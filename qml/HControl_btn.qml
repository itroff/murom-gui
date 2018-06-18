import QtQuick 2.6
import Qt.labs.controls 1.0

Rectangle {
    id: rect
    signal buttonLeftClicked
    signal buttonRightClicked
    //   width: parent.width
    //   height: parent.height/2
    color: "#d6b200"
    radius: 100
    border.width: 10

    Item {
        x:0
        width: parent.width/2
        height: parent.height
        // opacity: 0
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/arrow_left_9619.png"
        }
        Button {
            id: btn_left
            opacity: 0
            anchors.fill: parent
            onClicked: {
                rect.buttonLeftClicked()
                //  qmlComm.rezimChanged(txt.text)
            }
        }
    }
    Item {
        x:parent.width/2
        width: parent.width/2
        height: parent.height
        // opacity: 0
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/arrow_right_9327.png"
        }
        Button {
            id: btn_right
            opacity: 0
            anchors.fill: parent
            onClicked: {
                rect.buttonRightClicked()
                //  qmlComm.rezimChanged(txt.text)
            }
        }
    }

}

