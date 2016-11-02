#include "windowtest.h"
#include "ui_windowtest.h"

WindowTest::WindowTest(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::WindowTest)
{
    ui->setupUi(this);
}

WindowTest::~WindowTest()
{
    delete ui;
}
