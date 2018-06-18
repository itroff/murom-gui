#include "sensor.h"

Sensor::Sensor(QString s_name, QString s_value, QObject *parent) : QObject(parent)
{
    m_name = s_name;
    m_value = s_value;

}

void Sensor::setName(const QString &newName)
{
    m_name = newName;
}

void Sensor::setValue(const QString &newValue)
{
    m_value= newValue;
}
