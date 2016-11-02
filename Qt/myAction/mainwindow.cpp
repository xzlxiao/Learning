#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "myaction.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    MyAction *action = new MyAction;
    QMenu * editMenu = ui->menuBar->addMenu("&edit");
    editMenu->addAction(action);
    connect(action, SIGNAL(getText(QString)), this, SLOT(setText(QString)));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::setText(const QString &string)
{
    QString str = ui->textEdit->toPlainText();
    str = str + string + "\n";
    ui->textEdit->setText(str);
}
