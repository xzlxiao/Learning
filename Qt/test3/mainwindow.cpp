#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QTextFrame>
#include "test1.h"
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QTextDocument *document = ui->textEdit->document();
    QTextFrame *rootFrame = document->rootFrame();
    QTextFrameFormat format;
    format.setBorderBrush(Qt::red);
    format.setBorder(3);
    rootFrame->setFrameFormat(format);

    QTextFrameFormat frameFormat;
    frameFormat.setBackground(Qt::lightGray);
    frameFormat.setMargin(10);
    frameFormat.setPadding(5);
    frameFormat.setBorder(2);
    frameFormat.setBorderStyle(QTextFrameFormat::BorderStyle_Dotted);
    QTextCursor cursor = ui->textEdit->textCursor();
    cursor.insertFrame(frameFormat);
    this->MenuTest = ui->menuBar->addMenu(QString("测试"));
    QAction *action1 = new QAction(QString("打开窗口"), this);
    connect(action1, SIGNAL(triggered(bool)), this, SLOT(openNewWindow()));
    MenuTest->addAction(action1);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_textEdit_selectionChanged()
{

}

void MainWindow::NewFile()
{
    //QTextEdit *edit = new QTextEdit(this);
    //QMdiSubWindow *child = ui->mdiArea->addSubWindow(edit);
    //child->setWindowTitle("testttt");
    //child->show();
}

void MainWindow::on_actionNew_File_2_triggered()
{

}

void MainWindow::openNewWindow()
{
    qDebug() << "openNewWindow()" << endl;
    test1 *test = new test1(0);
    test->setAttribute(Qt::WA_ShowModal, true);
    test->show();
}
