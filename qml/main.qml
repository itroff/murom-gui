/*import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true

    MainForm {
        anchors.fill: parent

    }
}
*/
import QtQuick 2.2
import QtQuick.Controls 1.2
//import "qml"

ApplicationWindow {
    id: mainwindow
    visible: true
    width: 800
    height: 1280

    Rectangle {
        color: "#778591"
        anchors.fill: parent
    }

    toolBar: BorderImage {
        border.bottom: 8
        source: "qrc:/img/toolbar.png"
        width: parent.width
        height: 150

        Rectangle {
            id: backButton
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: 60
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity { NumberAnimation{} }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/navigation_previous_item.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: {
                    stackView.pop()
                    main_txt.text= "Управление МУРОМ-ИСП"
                }
            }
        }

        Text {
            id: main_txt
            font.pixelSize: 42
            Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
            x: backButton.x + backButton.width + 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: "Управление МУРОМ-ИСП"
        }
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Команды"
            page: "Comands.qml"

        }
        ListElement {
            title: "Данные с сенсоров"
            page: "Sensors.qml"
        }
        ListElement {
            title: "Управление"
            page: "Control.qml"
        }
        ListElement {
            title: "Камера"
            page: "Camera.qml"
        }


        ListElement {
            title: "Джойстик"
            page: "Control_Joystick.qml"
        }
          ListElement {
            title: "Голос"
            page: "Voice.qml"
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        // Implements back key navigation
        focus: true
        Keys.onReleased: if (event.key === Qt.Key_Back && stackView.depth > 1) {
                             stackView.pop();
                             event.accepted = true;

                         }

        initialItem: Item {
            width: parent.width
            height: parent.height
            ListView {
                model: pageModel
                anchors.fill: parent
                delegate: AndroidDelegate {

                    height: stackView.height/6
                    text: title
                    onClicked: {
                        stackView.push(Qt.resolvedUrl(page))
                        main_txt.text=text
                    }
                }

            }
        }
    }

}
