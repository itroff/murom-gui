#ifndef NETWORKMANAGER
#define NETWORKMANAGER
#include "network.h"
#include <QThread>
#include <QObject>
#include <QVector>
#include <QList>


class CPostNet : public QObject
{
    Q_OBJECT
private:
    NetClient *m_tcpClient;
    QThread * m_clientThread;
public:
    CPostNet();
    ~CPostNet();
    void connectToRobot(QString, int);
public slots:
 void sendMessage(const QByteArray &);
signals :
    void newMessage(const QByteArray&);
    void transferMessage(const QByteArray&);
    void outOfZone(bool);
};

#endif // NETWORKMANAGER

