#ifndef TEST1_H
#define TEST1_H

#include <QWidget>

class test1 : public QWidget
{
    Q_OBJECT
public:
    explicit test1(QWidget *parent = 0);
protected:
    void keyPressEvent(QKeyEvent *event);
signals:

public slots:
};

#endif // TEST1_H
