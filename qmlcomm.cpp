#include "qmlcomm.h"
#include "sensor.h"

#include <QDebug>
#include <QMetaObject>
#include <QtQuickWidgets/QQuickWidget>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>


qmlComm::qmlComm(QObject *parent) : QObject(parent)
{
    // виджет для qml интерфейса
    QQuickWidget *p_wgt = new QQuickWidget;
    p_wgt->setWindowTitle("Управление МУРОМ-ИСП");

    QString m_robotAdress = "192.168.0.2";
    //     QString m_robotAdress = "10.38.6.92";
    // манагер для передачи данных к роботу
    m_networkManager = new CPostNet();
    connect(m_networkManager, SIGNAL(newMessage(const QByteArray&)), this, SLOT(parseMessageFromRobot(const QByteArray&)));
    connect(m_networkManager,&CPostNet::outOfZone,this,&qmlComm::outOfZone);
    m_networkManager->connectToRobot(m_robotAdress,2020);

    // робот муром
    m_rbt = new RobotMurom();

    p_con = p_wgt->rootContext();
    p_con->setContextProperty("qmlComm",this);
    p_con->setContextProperty("Robot",m_rbt);
    p_wgt->setSource(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    connect(m_rbt,SIGNAL(message(const QByteArray &)),m_networkManager,SLOT(sendMessage(const QByteArray &)));

    // таймер для переподключения
    mp_timer = new QTimer(this);
    connect(mp_timer, SIGNAL(timeout()), this, SLOT(reconnect()));



    // mp_wsclient = new EchoClient(QUrl(QStringLiteral("ws://127.0.0.1:9090")));
    mp_wsclient = new EchoClient(QUrl(QStringLiteral("ws://192.168.0.2:9090")));
    QJsonObject resultObject1
    {
        { "op", "advertise"},
        {"topic", "/robotsound"},
        { "type", "sound_play/SoundRequest"}
    };
    QJsonDocument data2(resultObject1);
    mp_wsclient->sendMessage(data2.toJson());
}
// слот потери связи
void qmlComm::outOfZone(bool state)
{
    if(state)
    {
        mp_timer->start(1000);
        QList<QObject*> dataList;
        dataList.append(new Sensor("Нет соединения с Муромом", ""));
        p_con->setContextProperty("sensorlist", QVariant::fromValue(dataList));
    }
    else
    {
        mp_timer->stop();
    }
}

// слот переподключения
void qmlComm::reconnect()
{
    QString m_robotAdress = "192.168.0.2";
    //     QString m_robotAdress = "10.38.6.92";
    m_networkManager->connectToRobot(m_robotAdress,2020);

}

// режим команды
void qmlComm::rezimChanged(QString str)
{
    QString toVoice = "Выполняется команда " + str;
    sendTTS(toVoice);
    //    qDebug() << "signal work";
    if(str=="Свернуть")
        m_rbt->compareMsg(0, "Fold");
    else if(str=="Развернуть")
        m_rbt->compareMsg(0, "Expand");
    else if(str=="Кентавр")
        m_rbt->compareMsg(0, "Centaurus");
    else if(str=="Остановить")
        m_rbt->compareMsg(0, "Stop");

    emit transmitNewText( "Выполняется команда: " + str.toLower());

}

// поворот
void qmlComm::turn(QString str, int angle,QString type)
{
    qDebug()<<"turn" << angle;
    QString toVoice = "Выполняется команда " + str;
    sendTTS(toVoice);
    //    qDebug() << "signal work";
    if(type=="Trunk")
        m_rbt->compareMsg(angle, "Turn_Trunk");
    if(type=="Belly")
        m_rbt->compareMsg(angle, "Turn_Belly");
    if(type=="Spine")
        m_rbt->compareMsg(angle, "Turn_Spine");


    emit transmitNewText( "Выполняется команда: " + str.toLower()  +" на "+ QString::number(angle)+ " градусов");

}

// разбор сообщения от робота
void qmlComm::parseMessageFromRobot(const QByteArray& ba)
{
    QJsonDocument doc = QJsonDocument::fromJson(ba);
    if(doc.object().contains("Operation") && doc.object().contains("Data"))
    {
        QJsonObject arr = doc.object();

        if(arr.value("Data").isObject())
        {
            QJsonObject data = arr.value("Data").toObject();
            if(data.value("Message").isString())
            {
                QStringList list_sensors = data.value("Message").toString().split(";");
                QVariantMap temp;
                QList<QObject*> dataList;
                for (auto& parametr : list_sensors)
                {
                    QString key = parametr.split("=")[0];
                    QString value = parametr.split("=")[1];
                    if (value.simplified() == "0")
                        value = "off";
                    temp.insert(key,value.simplified());
                    dataList.append(new Sensor(key, value.simplified()));
                }
                p_con->setContextProperty("sensorlist", QVariant::fromValue(dataList));
                //   qDebug() << temp;
            }
        }
    }
}

// отправка сообщения от джойстика
void qmlComm::changeJoyCoord(QString comand_horiz, QString comand_vertical, int  type, double msx, double msy)
{
    int max_value_x=127;
    int max_value_y=127;
    qDebug() << comand_horiz << comand_vertical << type << msx << msy;
    if(comand_vertical=="Move_Left_Wheel"||comand_vertical=="Move_Right_Wheel"||comand_horiz=="Speed_Wheel_H")
        max_value_y=7;
    if(type==1)
    {
        if(comand_horiz=="Speed_Wheel_H")
        {
            qDebug()<<"msx:" << msx << "MSY" << msy;
            if(msy>=0)
            {

                m_rbt->compareMsg(-(msx+msy)*max_value_y, "Move_Left_Wheel");
                m_rbt->compareMsg(-(msy-msx)*max_value_y, "Move_Right_Wheel");
            }
            else
            {
                m_rbt->compareMsg(-(msy-msx)*max_value_y, "Move_Left_Wheel");
                m_rbt->compareMsg(-(msy+msx)*max_value_y, "Move_Right_Wheel");
            }
        }
        else
        {
            m_rbt->compareMsg(msx*max_value_x, comand_horiz);
            m_rbt->compareMsg(msy*max_value_y, comand_vertical);
        }
    }
    else if(type==3)
    {
        m_rbt->compareMsg(msy*max_value_y, comand_vertical);
    }
}

// отправка команды голосом
void qmlComm::sendVoice(QString msg)
{
    //sendTTS(msg);
    QJsonObject resultObject1
    {
        { "op", "advertise"},
        {"topic", "/sda"},
        { "type", "msg/String"}
    };
    QJsonDocument data2(resultObject1);
    mp_wsclient->sendMessage(data2.toJson());

    QJsonObject varObject{
        {"data", msg}};

    QJsonObject resultObject
    {
        { "op", "publish"},
        {  "topic", "/sda"},
        {  "msg",       varObject  }
    };

    QJsonDocument data(resultObject);
    qDebug()<<data.toJson();

    mp_wsclient->sendMessage(data.toJson());
}

// отправка голосового сообщения на муром
void qmlComm::sendTTS(QString msg)
{



    QJsonObject varObject{
        {"sound", -3},
        {"command", 1},
        {"arg", msg},
        {"arg2", "voice_msu_ru_nsh_clunits"},
    };
    QJsonObject resultObject
    {
        { "op", "publish"},
        {  "topic", "/robotsound"},
        {  "msg",       varObject  }
    };

    QJsonDocument data(resultObject);
    qDebug()<<data.toJson();

    mp_wsclient->sendMessage(data.toJson());
}
