#include "qmlcomm.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName("Управление МУРОМ-ИСП");
    app.setApplicationDisplayName("Управление МУРОМ-ИСП");

    qmlRegisterType<qmlComm>("com.mivar.qmlComm",1,0,"qmlComm");
    qmlComm communication;

    return app.exec();
}
