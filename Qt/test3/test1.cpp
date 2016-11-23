#include "test1.h"
#include "QKeyEvent"
#include <QDebug>
test1::test1(QWidget *parent) : QWidget(parent)
{
}

void test1::keyPressEvent(QKeyEvent *event)
{
    if (event->key() == Qt::Key_W)
    {
        qDebug() << event->isAutoRepeat();
    }
}
