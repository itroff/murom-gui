import QtQuick 2.2

Item {
    id: root
    width: parent.width

    property alias text: textitem.text
    signal clicked
    Rectangle{
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{
                position: 0
                color: "#778591"
            }
            GradientStop{
                position: 1
                color: "#49535c"
            }
        }
        Image {
            id: image_haki2
            clip: false
            anchors.fill: parent
            //   source: "qrc:/img/858490.jpg"
            width: parent.width
            fillMode: Image.PreserveAspectCrop

            Rectangle {
                anchors.fill: parent
                color: "#11ffffff"
                visible: mouse.pressed
            }

            Text {
                id: textitem
                color: "white"
                font.pixelSize: 72
                text: modelData
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 30
            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5
                height: 3
                color: "#424246"
            }

            Image {
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/navigation_next_item.png"
            }

            MouseArea {
                id: mouse
                anchors.fill: parent
                onClicked: root.clicked()
            }
        }
    }
}
