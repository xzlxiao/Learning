#include "mainwindow.h"
#include <QApplication>
#include <QDialog>
#include <QLabel>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    MainWindow w;
    QLabel label(&w);
    label.setText("Hello World!中国");
    w.show();
    return a.exec();
}


