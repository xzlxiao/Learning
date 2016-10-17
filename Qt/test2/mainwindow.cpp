#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDialog>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->showChildButton, SIGNAL(clicked()),
            this, SLOT(showChildDialog()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::showChildDialog()
{
    QDialog *dialog = new QDialog(this);
    dialog->show();
}
