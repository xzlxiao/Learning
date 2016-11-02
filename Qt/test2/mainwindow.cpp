#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDialog>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow), count(1)
{
    ui->setupUi(this);
    Button1 = new QPushButton(this);
    Button1->setGeometry(100, 790, 80, 20);
    Button1->setText("Show movie");
    connect(ui->showChildButton, SIGNAL(clicked()), this, SLOT(showChildDialog()));
    connect(this->Button1, SIGNAL(clicked(bool)), this, SLOT(showMovie()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::showChildDialog()
{
    if (this->count == 1)
    {
        count = 0;
        ui->stackedWidget->setCurrentIndex(0);
    }
    else
    {
        count = 1;
        ui->stackedWidget->setCurrentIndex(1);
    }
}

void MainWindow::showMovie()
{
    QMovie *movie = new QMovie("D:\\movie\\N00101.gif");
    ui->label->setMovie(movie);
    movie->start();
}
