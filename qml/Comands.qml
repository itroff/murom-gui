import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
//import QtQuick.Controls 1.5



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
        //    source: "858490.jpg"
        width: parent.width

        MouseArea {

            id: mouseArea
            anchors.fill: parent

            width: parent.width

            ColumnLayout {
                id: v_layout
                anchors.fill: parent
                width: parent.width
                opacity: 0.9

                /* Rectangle {
                    id: banner
                    opacity: 1
                    height: 80
                    Layout.minimumHeight: 80
                    Layout.minimumWidth:  parent.width
                    anchors.top: parent.top
                    width: parent.width
                    color: "#000000"
                    Text{
                        id: txt_top
                        color: "#ffffff"
                        text: qsTr("Команды управления Муром-ИСП")
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 54
                    }
                }*/
                Text {
                    id: txt_msg
                    color: "#ffffff"
                    text: qsTr("Бездействие")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    maximumLineCount: 3
                    wrapMode: Text.WordWrap
                    font.bold: true

      //              transformOrigin: Item.Center
                    Layout.maximumWidth:  parent.width
                    Layout.minimumHeight: parent.height/5
                    Layout.maximumHeight: parent.height/5
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    font.pixelSize: 72

                }

                Murom_btn{
                    id: btn_expand
                    text: "Развернуть"
                    Layout.minimumWidth:  parent.width/2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumHeight: parent.height/10
                    Layout.maximumHeight: parent.height/10


                }

                Murom_btn{
                    id: btn_down
                    text: "Свернуть"
                    Layout.minimumWidth:  parent.width/2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumHeight: parent.height/10
                    Layout.maximumHeight: parent.height/10

                }

                Murom_btn{
                    id: btn_centaurus
                    text: "Кентавр"
                    Layout.minimumWidth:  parent.width/2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumHeight: parent.height/10
                    Layout.maximumHeight: parent.height/10

                }

                Murom_btn {
                    id: btn_stop
                    color: "#e51111"
                    text: "Остановить"
                    Layout.minimumWidth:  parent.width/2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumHeight: parent.height/10
                    Layout.maximumHeight: parent.height/10
                }
                MuromSpin {
                    id: btn_angle_trunk
                    text: "Повернуть основание"
                    type: "Trunk"
                    Layout.minimumWidth:  parent.width/2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumHeight: parent.height/10
                    Layout.maximumHeight: parent.height/10
                }
                MuromSpin {
                    id: btn_angle_belly
                    text: "Повернуть туловище"
                    type: "Belly"
                    Layout.minimumWidth:  parent.width/2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumHeight: parent.height/10
                    Layout.maximumHeight: parent.height/10
                }
                MuromSpin {
                    id: btn_angle_spine
                    text: "Повернуть спину"
                    type: "Spine"
                    Layout.minimumWidth:  parent.width/2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumHeight: parent.height/10
                    Layout.maximumHeight: parent.height/10
                }


            }

        }
    }
}





