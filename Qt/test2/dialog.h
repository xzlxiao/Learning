#ifndef DIALOG_H
#define DIALOG_H

#include <QApplication>
#include <QDialog>
#include <QColorDialog>
#include <qdebug.h>

namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = 0);
    ~Dialog();

private slots:
    void on_pushButton_2_clicked();
    void btn3_clicked();

private:
    Ui::Dialog *ui;
};

#endif // DIALOG_H
