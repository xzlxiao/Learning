#include "mainwindow.h"
#include <QApplication>
#include <QLabel>
#include <QString>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    //新建QWidget类对象，默认parent参数是0，所以它是个窗口
    QWidget *widget = new QWidget(0, Qt::Dialog);
    widget->setWindowTitle("我是wiget");
    //新建Label对象，默认parent参数是0，所以它是个窗口
    QLabel *label = new QLabel(0, Qt::SplashScreen);
    label->setWindowTitle("我是label");
    label->setText("我是个窗口w");
    label->resize(280, 20);
    //label2指定了父窗口为widget,所以不是窗口
    QLabel *label2 = new QLabel(widget);
    label2->setText("label2:我不是独立窗口，只是widget的子部件");
    label2->resize(250, 20);
    //在屏幕上显示出来
    label->show();
    widget->show();
    int ret = a.exec();
    delete label;
    delete widget;
    return ret;
}
