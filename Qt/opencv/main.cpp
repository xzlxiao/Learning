#include "mainwindow.h"
#include <QApplication>
#include <opencv2/imgproc.hpp>  // Gaussian Blur
#include <opencv2/core.hpp>        // Basic OpenCV structures (cv::Mat, Scalar)
#include <opencv2/highgui.hpp>  // OpenCV window I/O
#include <iostream>

using namespace cv;
using namespace std;
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    Mat b = imread("1.jpg");
    namedWindow("测试");
    imshow("测试", b);
    waitKey();
    if (!b.empty())
    {
        namedWindow("测试");
        imshow("测试", b);
        waitKey();
    }
    else
    {
        std::cerr << "图片读取失败" << std::endl;
        throw;
    }

    cout << " 123" << endl;
    return a.exec();
}
