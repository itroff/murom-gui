import QtQuick 2.0
import Qt.labs.controls 1.0
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1

Item {
    Image {
        id: image_haki
        anchors.fill: parent
        clip: false
        source: "qrc:/img/murom_scheme.png"
        fillMode: Image.PreserveAspectFit
    }
    // джойстик для головы
    Joystick2{
        id: btn_head
        x: 0
        y: 0
        name: "Голова"
        comand_horiz: "Revolve_Head"
        comand_vert: "Move_Neck"

    }
    // джойстик для изгиба тела
    Joystick2{
        id: btn_spine
        x: parent.width - width
        y: image_haki.height/6
        name: "Спина"
        comand_vert: "Move_Spine"
        type: 3

    }
    // джойстик для основания
    Joystick2 {
        id: btn_trunk
        x: image_haki.width/2-image_haki.height/8
        y: image_haki.height/2.5
        name: "Тело"
        comand_horiz: "Revolve_Trunk"
        comand_vert: "Move_Belly"

    }
    // джойстик для паркинга
    Joystick2{
        id: btn_park
        x: image_haki.width/2-image_haki.height/8
        y: image_haki.height/6*4
        name: "Колеса"
        comand_vert: "Park"
        type: 3
    }

    // джойстик для скорости колес
    Joystick2 {
        id: btn_wheels
        x: 0
        y: image_haki.height/6*4
        name: "Колеса"
        comand_horiz: "Speed_Wheel_H"
        comand_vert: "Speed_Wheel"

    }
    Joystick2{
           id: btn_wheel_left
           x: parent.width - width
           y: image_haki.height/6*4
           name: "актуаторы"
           comand_vert: "Move_Left_Actuator"
           comand_horiz: "Move_Right_Actuator"
       }

    // джойстик для колеса левого
 /*   Joystick2{
        id: btn_wheel_left
        x: 0
        y: image_haki.height/6*4
        name: "Колеса"
        comand_vert: "Move_Left_Wheel"
        comand_horiz: "Move_Left_Actuator"
    }
    // джойстик для колеса правого
    Joystick2{
        id: btn_wheel_right
        x: parent.width - width
        y: image_haki.height/6*4
        name: "Колеса"
        comand_vert: "Move_Right_Wheel"
        comand_horiz: "Move_Right_Actuator"
    }*/
}

