#include "dialog.h"
#include "ui_dialog.h"

Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);
    connect(ui->btn3, SIGNAL(clicked()), this, SLOT(btn3_clicked()) )
}

Dialog::~Dialog()
{
    delete ui;
}

void Dialog::on_pushButton_2_clicked()
{
    accept();
}

void Dialog::btn3_clicked()
{
    this->close();
}
