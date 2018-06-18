#ifndef SENSOR_H
#define SENSOR_H

#include <QObject>

class Sensor : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString value READ value WRITE setValue NOTIFY valueChanged)

public:
    explicit Sensor(QString , QString ,QObject *parent = 0);
    void setName(const QString &newName);
    void setValue(const QString &newValue);
    QString name(){return m_name;};
    QString value(){return m_value;};

signals:
    void nameChanged(QString );
    void valueChanged(QString );
private:
    QString m_name;
    QString m_value;

public slots:
};


#endif // SENSOR_H
