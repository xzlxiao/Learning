#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTextEdit>
#include <QMdiSubWindow>
#include <QMenu>

#include "test2.h"
#include <qdebug.h>
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_textEdit_selectionChanged();
    void NewFile();

    void on_actionNew_File_2_triggered();
    void openNewWindow();

private:
    Ui::MainWindow *ui;
    QMenu *MenuTest;
};

#endif // MAINWINDOW_H
