#include "network.h"

NetClient::NetClient(const QString serverAddress, const int serverPort) :
    QObject(0),
    nextBlockSize(0),
    m_isConnected(false)
{

    m_tcpSocket = new QTcpSocket(this);
    m_tcpSocket->connectToHost(serverAddress, serverPort);
    connect(m_tcpSocket, SIGNAL(readyRead()), this, SLOT(slotReadClient()), Qt::DirectConnection);
    connect(m_tcpSocket, SIGNAL(connected()), this, SLOT(connected()));
    connect(m_tcpSocket, &QTcpSocket::stateChanged, this, &NetClient::connectionStateChanged);
}

void NetClient::connected()
{
    m_isConnected = true;
}

bool NetClient::isReady()
{
    return m_tcpSocket->state() == QAbstractSocket::ConnectedState;
}

void NetClient::connectionStateChanged(QAbstractSocket::SocketState state)
{
    if (state == QAbstractSocket::UnconnectedState)
        emit outOfZone(true);
    if (state == QAbstractSocket::ConnectedState)
        emit outOfZone(false);
}

NetClient::~NetClient(void)
{
}


void NetClient::sendByteArray(const QByteArray& ba)
{
    if (m_isConnected){
        //qDebug() << ba << " sent";
        QByteArray block;
        QDataStream stream(&block, QIODevice::WriteOnly);
        stream.setVersion(QDataStream::Qt_5_5);

        stream << quint64(ba.size());
        stream << ba;
        m_tcpSocket->waitForReadyRead(50);
        m_tcpSocket->write(block);
        m_tcpSocket->flush();
    }
}



void NetClient::slotReadClient()
{
    QTcpSocket * socket = static_cast<QTcpSocket*>(sender());

    forever
    {
        QDataStream stream(socket);
        stream.setVersion(QDataStream::Qt_5_5);
        if (nextBlockSize == 0)
        {
            if (socket->bytesAvailable() < sizeof(quint64))
                return;
            stream >> nextBlockSize;
        }
        if (nextBlockSize > socket->bytesAvailable())
            return;

        QByteArray buf;

        stream >> buf;

        emit dataRecieved(buf);

        nextBlockSize = 0;
    }
}


//void  NetClient::closeConnect()
//{
//    if (m_tcpSocket!=NULL && m_tcpSocket->isOpen())
//    {
//        m_tcpSocket->close();
//    }
//}


