import QtQuick 2.0

Item {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    property alias text: txt.text
    property bool pressed_btn : false
    MouseArea {
        id: mouse
        anchors.fill: parent

        onClicked:         {
            if(pressed_btn)
            {
            qmlComm.sendVoice("stop")
                pressed_btn=false
            }
            else
            {
                qmlComm.sendVoice("start")
                pressed_btn=true
            }


        }
        Rectangle {
            id: voice
            width: parent.height> parent.width?parent.width: parent.height
            height: width
            color: pressed_btn?"green":"red"
            visible: true
            opacity: 0.7
            border.color:  "black"
            border.width: 5
            radius: width*0.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Text{
                id: txt
                color: "#ffffff"
                text:  pressed_btn?"Закончить запись":"Начать запись"
                font.pointSize: 48
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignTop
            }
        }
    }

}
