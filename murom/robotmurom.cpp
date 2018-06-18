#include "robotmurom.h"
#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>

RobotMurom::RobotMurom(QObject *parent) : QObject(parent)
{
    //  mp_Top = new Top();
    m_speed = 60;
}
// отправка сообщения на муром
void RobotMurom::compareMsg(int val, QString cmd)
{
    QString strCom = cmd+"="+QString::number(val);
    QJsonObject msg{
        {"Message",strCom}
    };
    QJsonObject resultObject
    {
        {"Data",msg},
        {"Operation","Effectors"}

    };

    QJsonDocument data(resultObject);
    emit message(data.toJson());
    qDebug()<< data.toJson();
}



// сообщения для управления - далее переделать
// поворот головы
void RobotMurom::leftHead()
{
    compareMsg(-127,"Revolve_Head");
}

void RobotMurom::rightHead()
{
    compareMsg(127,"Revolve_Head");
}
void RobotMurom::zeroHead()
{
    compareMsg(0,"Revolve_Head");
}
// наклон головы
void RobotMurom::upHead()
{
    compareMsg(m_speed,"Move_Neck");
}
void RobotMurom::downHead()
{
    compareMsg(-m_speed,"Move_Neck");
}
void RobotMurom::stopHead()
{
    compareMsg(0,"Move_Neck");
}
// изгиб тела
void RobotMurom::upSpine()
{
    compareMsg(m_speed,"Move_Spine");
}
void RobotMurom::downSpine()
{
    compareMsg(-m_speed,"Move_Spine");
}
void RobotMurom::stopSpine()
{
    compareMsg(0,"Move_Spine");
}
// наклон тела
void RobotMurom::upBelly()
{
    compareMsg(m_speed,"Move_Belly");
}
void RobotMurom::downBelly()
{
    compareMsg(-m_speed,"Move_Belly");
}
void RobotMurom::stopBelly()
{
    compareMsg(0,"Move_Belly");
}
// поворот тела
void RobotMurom::rightTrunk()
{
    compareMsg(-m_speed,"Revolve_Trunk");
}
void RobotMurom::leftTrunk()
{
    compareMsg(m_speed,"Revolve_Trunk");
}
void RobotMurom::stopTrunk()
{
    compareMsg(0,"Revolve_Trunk");
}

void RobotMurom::stopRWheel()
{
    compareMsg(0,"Move_Right_Wheel");
}
void RobotMurom::stopLWheel()
{
    compareMsg(0,"Move_Left_Wheel");
}
void RobotMurom::upRWheel()
{
    compareMsg(1,"Move_Right_Wheel");
}
void RobotMurom::downRWheel()
{
    compareMsg(-1,"Move_Right_Wheel");
}
