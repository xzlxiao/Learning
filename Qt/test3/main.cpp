#include "mainwindow.h"
#include <QApplication>
#include <QLabel>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    QLabel *label1 = new QLabel(&w);
    label1->setText("您好!");
    label1->setGeometry(300, 300, 50, 20);
    label1->show();
    return a.exec();
}
