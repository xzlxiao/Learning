/********************************************************************************
** Form generated from reading UI file 'windowtest.ui'
**
** Created by: Qt User Interface Compiler version 5.6.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_WINDOWTEST_H
#define UI_WINDOWTEST_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QOpenGLWidget>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_WindowTest
{
public:
    QAction *action1;
    QAction *action2;
    QWidget *centralwidget;
    QWidget *formLayoutWidget;
    QFormLayout *formLayout;
    QLabel *label;
    QLabel *label_2;
    QLabel *label_3;
    QLineEdit *lineEdit;
    QLineEdit *lineEdit_2;
    QLineEdit *lineEdit_3;
    QOpenGLWidget *openGLWidget;
    QSpacerItem *verticalSpacer;
    QLabel *label_4;
    QLabel *label_5;
    QLineEdit *lineEdit_4;
    QPushButton *pushButton;
    QMenuBar *menubar;
    QMenu *menu;
    QToolBar *toolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *WindowTest)
    {
        if (WindowTest->objectName().isEmpty())
            WindowTest->setObjectName(QStringLiteral("WindowTest"));
        WindowTest->resize(800, 600);
        action1 = new QAction(WindowTest);
        action1->setObjectName(QStringLiteral("action1"));
        action2 = new QAction(WindowTest);
        action2->setObjectName(QStringLiteral("action2"));
        centralwidget = new QWidget(WindowTest);
        centralwidget->setObjectName(QStringLiteral("centralwidget"));
        formLayoutWidget = new QWidget(centralwidget);
        formLayoutWidget->setObjectName(QStringLiteral("formLayoutWidget"));
        formLayoutWidget->setGeometry(QRect(30, 20, 361, 361));
        formLayout = new QFormLayout(formLayoutWidget);
        formLayout->setObjectName(QStringLiteral("formLayout"));
        formLayout->setContentsMargins(0, 0, 0, 0);
        label = new QLabel(formLayoutWidget);
        label->setObjectName(QStringLiteral("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        label_2 = new QLabel(formLayoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));

        formLayout->setWidget(3, QFormLayout::LabelRole, label_2);

        label_3 = new QLabel(formLayoutWidget);
        label_3->setObjectName(QStringLiteral("label_3"));

        formLayout->setWidget(5, QFormLayout::LabelRole, label_3);

        lineEdit = new QLineEdit(formLayoutWidget);
        lineEdit->setObjectName(QStringLiteral("lineEdit"));
        lineEdit->setEchoMode(QLineEdit::Normal);

        formLayout->setWidget(0, QFormLayout::FieldRole, lineEdit);

        lineEdit_2 = new QLineEdit(formLayoutWidget);
        lineEdit_2->setObjectName(QStringLiteral("lineEdit_2"));

        formLayout->setWidget(3, QFormLayout::FieldRole, lineEdit_2);

        lineEdit_3 = new QLineEdit(formLayoutWidget);
        lineEdit_3->setObjectName(QStringLiteral("lineEdit_3"));

        formLayout->setWidget(5, QFormLayout::FieldRole, lineEdit_3);

        openGLWidget = new QOpenGLWidget(formLayoutWidget);
        openGLWidget->setObjectName(QStringLiteral("openGLWidget"));

        formLayout->setWidget(6, QFormLayout::FieldRole, openGLWidget);

        verticalSpacer = new QSpacerItem(20, 64, QSizePolicy::Minimum, QSizePolicy::Expanding);

        formLayout->setItem(2, QFormLayout::FieldRole, verticalSpacer);

        label_4 = new QLabel(centralwidget);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setGeometry(QRect(470, 120, 54, 12));
        label_5 = new QLabel(centralwidget);
        label_5->setObjectName(QStringLiteral("label_5"));
        label_5->setGeometry(QRect(470, 150, 54, 12));
        lineEdit_4 = new QLineEdit(centralwidget);
        lineEdit_4->setObjectName(QStringLiteral("lineEdit_4"));
        lineEdit_4->setGeometry(QRect(550, 120, 113, 20));
        pushButton = new QPushButton(centralwidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(550, 150, 75, 23));
        WindowTest->setCentralWidget(centralwidget);
        menubar = new QMenuBar(WindowTest);
        menubar->setObjectName(QStringLiteral("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 21));
        menu = new QMenu(menubar);
        menu->setObjectName(QStringLiteral("menu"));
        WindowTest->setMenuBar(menubar);
        toolBar = new QToolBar(WindowTest);
        toolBar->setObjectName(QStringLiteral("toolBar"));
        WindowTest->addToolBar(Qt::TopToolBarArea, toolBar);
        WindowTest->insertToolBarBreak(toolBar);
        statusBar = new QStatusBar(WindowTest);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        WindowTest->setStatusBar(statusBar);
#ifndef QT_NO_SHORTCUT
        label_4->setBuddy(lineEdit_4);
        label_5->setBuddy(pushButton);
#endif // QT_NO_SHORTCUT

        menubar->addAction(menu->menuAction());
        menu->addAction(action1);
        menu->addAction(action2);

        retranslateUi(WindowTest);

        QMetaObject::connectSlotsByName(WindowTest);
    } // setupUi

    void retranslateUi(QMainWindow *WindowTest)
    {
        WindowTest->setWindowTitle(QApplication::translate("WindowTest", "MainWindow", 0));
        action1->setText(QApplication::translate("WindowTest", "1", 0));
        action2->setText(QApplication::translate("WindowTest", "2", 0));
        label->setText(QApplication::translate("WindowTest", "TextLabel", 0));
        label_2->setText(QApplication::translate("WindowTest", "TextLabel", 0));
        label_3->setText(QApplication::translate("WindowTest", "TextLabel", 0));
        lineEdit->setInputMask(QString());
        lineEdit->setPlaceholderText(QString());
        label_4->setText(QApplication::translate("WindowTest", "&TextLabel", 0));
        label_5->setText(QApplication::translate("WindowTest", "T&extLabel", 0));
        pushButton->setText(QApplication::translate("WindowTest", "PushButton", 0));
        menu->setTitle(QApplication::translate("WindowTest", "\346\226\207\344\273\266", 0));
        toolBar->setWindowTitle(QApplication::translate("WindowTest", "toolBar", 0));
    } // retranslateUi

};

namespace Ui {
    class WindowTest: public Ui_WindowTest {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_WINDOWTEST_H
