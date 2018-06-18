import QtQuick 2.0

Rectangle {
    //  width: 500
    // height: 500
    //  color: "#778591"
    color: "#00000000"
    //  radius: 100
    visible: true
    property alias name: mouse.name
    property alias type: joystick.type
    Image {
        id: joystick

        property real angle : 0
        property real distance : 0
        //тип джойстика: 1 - двухосный, 2 - только по горизонтали, 3 - только по вертикали
        property int type : 1

        source: "qrc:/img/background.png"
        anchors.centerIn: parent

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
            //       name: "Spine"
            property real fingerAngle : Math.atan2(mouseX, mouseY)
            property int mcx : mouseX - width * 0.5
            property int mcy : mouseY - height * 0.5
            property bool fingerOutOfBounds : fingerDistance2 < distanceBound2
            property real fingerDistance2 : mcx * mcx + mcy * mcy
            property real distanceBound : width * 0.5 - thumb.width * 0.5
            property real distanceBound2 : distanceBound * distanceBound

            anchors.fill: parent

            onPressed: returnAnimation.stop()
            onReleased:
            {
                returnAnimation.restart()
                qmlComm.changeJoyCoord(name,0,0)
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
                qmlComm.changeJoyCoord(name,thumb.anchors.horizontalCenterOffset,thumb.anchors.verticalCenterOffset)
            }
        }

        Image {
            id: thumb
            source: "qrc:/img/finger.png"
            anchors.centerIn: parent
        }
    }

}
