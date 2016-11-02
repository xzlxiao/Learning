#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTextEdit>
#include <QMdiSubWindow>

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

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
