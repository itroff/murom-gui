#ifndef ROBOTMUROM_H
#define ROBOTMUROM_H

#include <QObject>
//#include "top.h"

class RobotMurom : public QObject
{
    Q_OBJECT
public:
    explicit RobotMurom(QObject *parent = 0);


signals:
    void message(const QByteArray&);
public slots:
  //  Top* getTop(){return mp_Top;}
void leftHead();
void rightHead();
void zeroHead();
void upHead();
void downHead();
void stopHead();
void upSpine();
void downSpine();
void stopSpine();
void upBelly();
void downBelly();
void stopBelly();
void rightTrunk();
void leftTrunk();
void stopTrunk();
void compareMsg(int val, QString cmd);
void stopRWheel();
void stopLWheel();
void upRWheel();
void downRWheel();
private:

 int m_speed;
  //  Top *mp_Top;
};

#endif // ROBOTMUROM_H
