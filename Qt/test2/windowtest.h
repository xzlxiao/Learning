#ifndef WINDOWTEST_H
#define WINDOWTEST_H

#include <QMainWindow>

namespace Ui {
class WindowTest;
}

class WindowTest : public QMainWindow
{
    Q_OBJECT

public:
    explicit WindowTest(QWidget *parent = 0);
    ~WindowTest();

private:
    Ui::WindowTest *ui;
};

#endif // WINDOWTEST_H
