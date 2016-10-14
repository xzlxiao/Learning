#-------------------------------------------------
#
# Project created by QtCreator 2016-10-14T16:46:35
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = opencv
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

INCLUDEPATH += C:\opencv\build\include
LIBS += C:\opencv\build\x64\vc12\lib\opencv_core2413d.lib \
C:\opencv\build\x64\vc12\lib\opencv_imgproc2413d.lib \
C:\opencv\build\x64\vc12\lib\opencv_highgui2413d.lib
