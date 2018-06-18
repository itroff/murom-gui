#ifndef NETWORK
#define NETWORK
#include <QObject>
#include <QTcpSocket>
#include <QDataStream>

class NetClient: public QObject
{
    Q_OBJECT
public:
    NetClient(const QString serverAddress, const int serverPort);
    NetClient();

    void closeConnect();
    ~NetClient(void);
    QAbstractSocket::SocketState getStatus()
    {
        return m_tcpSocket->state();
    }
    bool m_isConnected;

private:
    QString _login, _password;
    QTcpSocket *m_tcpSocket;
    quint64     nextBlockSize;
    int serverPort = 2020;
    QString serverAddress;
public slots:
    void sendByteArray(const QByteArray& ba);
    void slotReadClient();
    void connected();
    bool isReady();
    void connectionStateChanged(QAbstractSocket::SocketState);
//	void printMsg(const QByteArray&);

signals:
    void dataRecieved(const QByteArray&);
    void outOfZone(bool m_val);
    void inZone();
};

#endif // NETWORK

