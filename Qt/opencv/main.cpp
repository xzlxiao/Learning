#include "mainwindow.h"
#include <QApplication>
#include <opencv2/imgproc.hpp>  // Gaussian Blur
#include <opencv2/core.hpp>        // Basic OpenCV structures (cv::Mat, Scalar)
#include <opencv2/highgui.hpp>  // OpenCV window I/O
#include <iostream>
#include <QDebug>

using namespace cv;
using namespace std;
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    Mat b = imread("G:\\git\\Learning\\Qt\\opencv\\1.jpg");
    if (!b.empty())
    {
        namedWindow("test");
        imshow("test", b);
        waitKey();
    }
    else
    {
        cerr << "fail to read image" << endl;
        throw;
    }

    cout << " 123" << endl;
    return a.exec();
}
