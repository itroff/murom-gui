import QtQuick 2.6
import Qt.labs.controls 1.0

Rectangle {
    id: rect
    property alias text: txt.text

    // для хаки
    //    color: "#d6b200"

    // для серого
    color: "#00000000"
    radius: 100
    visible: true
    border.width: 10
    signal buttonLeftClicked
    signal buttonCenterClicked
    signal buttonRightClicked
    property alias img_left: img_left.source
    property alias img_right: img_right.source
    Text
    {
        id:txt
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
           color: "white"
    }
    Item {
        y:0
        width: parent.width/3
        height: parent.height+20
        opacity: 0.8

        Image {
            id: img_left
            width: parent.width-25
            height: parent.width-25
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/arrow_up_5741.png"
        }
        Button {
            id: btn_left
            opacity: 0
            anchors.fill: parent
            onClicked: {
                rect.buttonLeftClicked()
            }
        }
    }
    Item {
        x:parent.width/3
        width: parent.width/3
        height: parent.height+20
                opacity: 0.8
        Image {

            width: parent.width-35
            height: parent.width-35
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/x_cross_delete_stop-128.png"
        }
        Button {
            id: btn_center
            opacity: 0
            anchors.fill: parent
            onClicked: {
                rect.buttonCenterClicked()
            }
        }
    }
    Item {
        x:parent.width/3*2
        width: parent.width/3
        height: parent.height+20
                opacity: 0.8
        Image {
            id: img_right
            width: parent.width-25
            height: parent.width-25
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/arrow_down_6649.png"
        }
        Button {
            id: btn_right
            opacity: 0
            anchors.fill: parent
            onClicked: {
                rect.buttonRightClicked()
            }
        }
    }

}

