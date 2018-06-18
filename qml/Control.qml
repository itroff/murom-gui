import QtQuick 2.0
import Qt.labs.controls 1.0
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1

Item {
    visible: true

    Image {
        id: image_haki
        anchors.fill: parent
        clip: false
        source: "qrc:/img/murom_scheme.png"
         fillMode: Image.PreserveAspectFit
    }

    GridLayout {
        id: grid1
        anchors.fill: parent
        rows: 7
        columns: 6
// поворот головы
        Control_btn {
            id: btn_head
            text: "Поворот головы"
            img_left:  "qrc:/img/arrow_left_9619.png"
            img_right:  "qrc:/img/arrow_right_9327.png"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 1
            Layout.columnSpan: 3
            Layout.column: 1
            onButtonRightClicked: Robot.rightHead()
            onButtonCenterClicked: Robot.zeroHead()
            onButtonLeftClicked: Robot.leftHead()
        }
// наклон головы
        Control_btn {
            id: btn_neck
            text: "Наклон головы"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 1
            Layout.columnSpan: 4
            Layout.column: 4
            onButtonRightClicked: Robot.upHead()
            onButtonCenterClicked: Robot.stopHead()
            onButtonLeftClicked: Robot.downHead()
        }
     /*   Joystick{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 1
            Layout.columnSpan: 4
            Layout.column: 2
        }*/

// Изгиб тела
        Control_btn {
            id: btn_spine
            text:"Изгиб тела"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 3
            Layout.columnSpan: 4
            Layout.column: 2
            onButtonRightClicked: Robot.upSpine()
            onButtonCenterClicked: Robot.stopSpine()
            onButtonLeftClicked: Robot.downSpine()
        }
// Наклон тела
        Control_btn {
            id: btn_belly
            text: "Наклон тела"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 4
            Layout.columnSpan: 4
            Layout.column: 2
            onButtonRightClicked: Robot.upBelly()
            onButtonCenterClicked: Robot.stopBelly()
            onButtonLeftClicked: Robot.downBelly()
        }
// Поворот основания тела
        Control_btn {
            id: btn_trunk
            text: "Поворот основания тела"
            img_left:  "qrc:/img/arrow_left_9619.png"
            img_right:  "qrc:/img/arrow_right_9327.png"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 5
            Layout.columnSpan: 4
            Layout.column: 2
            onButtonRightClicked: Robot.rightTrunk()
            onButtonCenterClicked: Robot.stopTrunk()
            onButtonLeftClicked: Robot.leftTrunk()
        }
// Левое колеса
        Control_btn {
            id: btn_left_wheel
            text: "Скорость левого колеса"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 6
            Layout.columnSpan: 3
            Layout.column: 1
            onButtonRightClicked: Robot.upLWheel()
            onButtonCenterClicked: Robot.stopLWheel()
            onButtonLeftClicked: Robot.downLWheel()
        }
// Актуатор наклона левого колеса
        Control_btn {
            id: btn_left_act
            text: "Наклон левого колеса"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 7
            Layout.columnSpan: 3
            Layout.column: 1
            onButtonRightClicked: Robot.rightLAct()
            onButtonLeftClicked: Robot.leftLAct()
        }
// Актуатор наклона правого колеса
        Control_btn {
            id: btn_right_act
            text: "Наклон правого колеса"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 6
            Layout.columnSpan: 4
            Layout.column: 4
            onButtonRightClicked: Robot.rightRAct()
            onButtonLeftClicked: Robot.leftRAct()
        }
// Правое колесо
        Control_btn {
            id: btn_right_wheel
            text: "Скорость правого колеса"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 7
            Layout.columnSpan: 4
            Layout.column: 4
            onButtonRightClicked: Robot.upRWheel()
            onButtonCenterClicked: Robot.stopRWheel()
            onButtonLeftClicked: Robot.downRWheel()
        }
    }
}
