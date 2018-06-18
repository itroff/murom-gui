import QtQuick 2.6
import Qt.labs.controls 1.0
import QtQuick.Layouts 1.3


RowLayout {
    id: rowLayout
    property alias text: txt.text
    //Trunk, Belly,Spine
    property string type
    SpinBox {
        id: spin
        font.pixelSize: 54
        stepSize: 5
        from: -90
        to: 90
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Layout.minimumWidth:  parent.width/2
        Layout.minimumHeight: parent.height
        Layout.maximumHeight: parent.height
        up.indicator.width: width/3
        down.indicator.width: width/3
    }
    Rectangle {

        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Layout.minimumWidth:  parent.width/2
        Layout.minimumHeight: parent.height
        Layout.maximumHeight: parent.height

        color: "#bababa"
        radius: 100
        border.width: 10
        Button {
            id: btn_custom
            text: "Развернуть"
            opacity: 0
            anchors.fill: parent
            onClicked: {
                qmlComm.turn(txt.text, spin.value, rowLayout.type)
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
}
