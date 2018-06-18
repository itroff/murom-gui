#ifndef QMLCOMM_H
#define QMLCOMM_H

#include <QWidget>
#include <QQmlContext>
#include <QTimer>

#include "networkmanager.h"
#include "murom/robotmurom.h"
#include "echoclient.h"


class qmlComm : public QObject
{
    Q_OBJECT
public:
    explicit qmlComm(QObject *parent = 0);

signals:
     void transmitNewText(QString text);

public slots:
    void rezimChanged(QString);
    void parseMessageFromRobot(const QByteArray& );

    void reconnect();
    void outOfZone(bool state);
    void changeJoyCoord(QString comand_horiz, QString comand_vertical, int type, double msx, double msy);
    void sendVoice(QString);
    void sendTTS(QString msg);
    void turn(QString str, int angle,QString type);
private:
    CPostNet *m_networkManager;
    EchoClient *mp_wsclient;
    QQmlContext *p_con;
    QTimer *mp_timer;
    RobotMurom *m_rbt;

};

#endif // QMLCOMM_H
