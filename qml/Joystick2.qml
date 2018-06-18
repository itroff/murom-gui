import QtQuick 2.0


Rectangle {
    id: joystick
    width: parent.height/4
    height: width
    color: "white"
    visible: true
    opacity: 0.5
    border.color: "black"
    border.width: 3
    radius: width*0.5
    property alias name: mouse.name

    property real angle : 0
    property real distance : 0
    //тип джойстика: 1 - двухосный, 2 - только по горизонтали, 3 - только по вертикали
    property int type : 1
    property string comand_horiz : ""
    property string comand_vert : ""


    ParallelAnimation {
        id: returnAnimation
        NumberAnimation { target: thumb.anchors; property: "horizontalCenterOffset";
            to: 0; duration: 200; easing.type: Easing.OutSine }
        NumberAnimation { target: thumb.anchors; property: "verticalCenterOffset";
            to: 0; duration: 200; easing.type: Easing.OutSine }
    }
    MouseArea {
        id: mouse
        property string name
        property real fingerAngle : Math.atan2(mouseX, mouseY)
        property int mcx : mouseX - width * 0.5
        property int mcy : mouseY - height * 0.5
        property bool fingerOutOfBounds : fingerDistance2 < distanceBound2
        property real fingerDistance2 : mcx * mcx + mcy * mcy
        property real distanceBound : width * 0.5 - thumb.width * 0.5
        property real distanceBound2 : distanceBound * distanceBound
        property int old_x : 0
        property int old_y : 0

        anchors.fill: parent

        onPressed: returnAnimation.stop()
        onReleased:
        {

            returnAnimation.restart()
            qmlComm.changeJoyCoord(comand_horiz,comand_vert,type,0,0)
        }
        onPositionChanged: {
            if (fingerOutOfBounds) {
                if(joystick.type==1 || joystick.type==2)
                {
                    thumb.anchors.horizontalCenterOffset = mcx
                }
                if(joystick.type==1 || joystick.type==3)
                {
                    thumb.anchors.verticalCenterOffset = mcy
                }
            } else {
                var angle = Math.atan2(mcy, mcx)
                if(joystick.type==1 || joystick.type==2)
                {
                    thumb.anchors.horizontalCenterOffset = Math.cos(angle) * distanceBound
                }
                if(joystick.type==1 || joystick.type==3)
                {
                    thumb.anchors.verticalCenterOffset = Math.sin(angle) * distanceBound
                }
            }
            // для уменьшения количества отправляемых пакетов
            if(Math.abs(old_x-thumb.anchors.horizontalCenterOffset)>10||Math.abs(old_y-thumb.anchors.verticalCenterOffset)>10)
            {
                qmlComm.changeJoyCoord(comand_horiz,comand_vert,type, 2*thumb.anchors.horizontalCenterOffset / (width-thumb.width), -2* thumb.anchors.verticalCenterOffset/(height-thumb.height))
                old_x = thumb.anchors.horizontalCenterOffset
                old_y = thumb.anchors.verticalCenterOffset
            }

        }
    }

    Rectangle{
        id: thumb
        height: parent.height/5
        width: parent.width/5
        color: "gray"
        visible: true
        opacity: 1
        border.color: "black"
        border.width: 1
        radius: width*0.5
        anchors.centerIn: parent
    }

}
