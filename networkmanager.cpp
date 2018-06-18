#include "networkmanager.h"

CPostNet::CPostNet()
{
    m_tcpClient = nullptr;
    m_clientThread = nullptr;
}

CPostNet::~CPostNet()
{
    m_clientThread->exit();
}

void CPostNet::connectToRobot(QString strIP, int port)
{
    if (m_tcpClient != nullptr)
        m_tcpClient = nullptr;

    m_tcpClient = new NetClient(strIP, port);
    m_clientThread = new QThread(this);
    m_tcpClient->moveToThread(m_clientThread);
    m_clientThread->start();
  //  connect(m_tcpClient, SIGNAL(dataRecieved(const QByteArray&)), this, SIGNAL(newMessage(const QByteArray&)));
    connect(m_tcpClient,&NetClient::outOfZone,this,&CPostNet::outOfZone);
    connect(this,&CPostNet::transferMessage,m_tcpClient,&NetClient::sendByteArray);

}

void CPostNet::sendMessage(const QByteArray &msg)
{
    if (m_tcpClient != nullptr)
        emit transferMessage(msg);
}

