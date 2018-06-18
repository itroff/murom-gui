TEMPLATE = app

QT += qml quick quickwidgets websockets
CONFIG += c++11

SOURCES += main.cpp \
    qmlcomm.cpp \
    network.cpp \
    networkmanager.cpp \
    murom/robotmurom.cpp \
    murom/chassis.cpp \
    murom/top.cpp \
    murom/rangefinder.cpp \
    murom/wheel.cpp \
    murom/speaker.cpp \
    murom/computer.cpp \
    murom/battery.cpp \
    murom/body.cpp \
    murom/back.cpp \
    murom/head.cpp \
    sensor.cpp \
echoclient.cpp

RESOURCES += murom_cmd.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
INCLUDEPATH += /opt/ros/indigo/include


DISTFILES +=

HEADERS += \
    qmlcomm.h \
    network.h \
    networkmanager.h \
    murom/robotmurom.h \
    murom/chassis.h \
    murom/top.h \
    murom/rangefinder.h \
    murom/wheel.h \
    murom/speaker.h \
    murom/computer.h \
    murom/battery.h \
    murom/body.h \
    murom/back.h \
    murom/head.h \
    sensor.h \
echoclient.h
