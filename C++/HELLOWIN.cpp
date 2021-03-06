/*--------------------------------------------------------------------
	HELLOWIN.cpp -- Displays "Hello, Windows 10!" in client area
						(C)	肖镇龙，2015
--------------------------------------------------------------------*/
#include <windows.h>
LRESULT CALLBACK WndProc (HWND, UINT, WPARAM, LPARAM);

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
{
	static TCHAR szAppName[] = TEXT("HelloWin");
	HWND		 hwnd;
	MSG			 msg;
	WNDCLASS	 wndclass;
		
	wndclass.style = CS_HREDRAW | CS_VREDRAW;
	wndclass.lpfnWndProc = WndProc;
	wndclass.cbClsExtra = 0;
	wndclass.cbWndExtra = 0;
	wndclass.hInstance = hInstance;
	wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);			// LoadIcon 加载图标，以供程序使用
	wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);				// LoadCursor 加载鼠标光标，以供程序使用
	wndclass.hbrBackground = (HBRUSH) GetStockObject(WHITE_BRUSH);		// GetStockObject 获取一个图形对象。在本例中是一个用来对窗口背景进行重绘的图刷
	wndclass.lpszMenuName = NULL;
	wndclass.lpszClassName = szAppName;

	if(!RegisterClass(&wndclass))		// RegisterClass 为应用程序的窗口注册一个窗口类
	{
		MessageBox(NULL, TEXT("This program requires Windows NT"),
					szAppName, MB_ICONERROR);
		return 0;
	}
	hwnd = CreateWindow(szAppName,		// 窗口类名， CreateWindow 基于窗口类创建一个窗口
						TEXT("The Hello Program"),	// 窗口标题
						WS_OVERLAPPEDWINDOW, 		// 窗口类型
						CW_USEDEFAULT, 				// 初始化x坐标
						CW_USEDEFAULT, 				// 初始化y坐标
						CW_USEDEFAULT,				// 初始化宽度
						CW_USEDEFAULT,				// 初始化高度
						NULL, 						// 父窗口句柄
						NULL,						// 窗口菜单句柄
						hInstance,					// 程序实例句柄
						NULL);						// 创建参数
	ShowWindow(hwnd, iCmdShow);			// ShowWindow 在屏幕中显示窗口
	UpdateWindow(hwnd);					// UpdateWindow 指示窗口对其自身进行重绘
	
	while(GetMessage(&msg, NULL, 0, 0))		// GetMessage 从消息队列获取信息
	{
		TranslateMessage(&msg);			// TranslateMessage 翻译一些键盘消息
		DispatchMessage(&msg);			// DispatchMessage 将消息发送给窗口过程
	}
	return msg.wParam;
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	HDC			hdc;
	PAINTSTRUCT	ps;
	RECT		rect;
	
	switch(message)
	{
		case WM_CREATE:
			 //PlaySound(TEXT("hellowin.wav"), NULL, SND_FILENAME|SND_ASYNC);		// PlaySound 播放声音文件
			 return 0;
			 
		case WM_PAINT:
			 hdc = BeginPaint(hwnd, &ps);		// BeginPaint 标明窗口绘制开始
			 
			 GetClientRect(hwnd, &rect);		// GetClienRect 获取窗口客户区尺寸
			 
			 DrawText(hdc, TEXT("Hello, Window 10!"), -1, &rect,		// DrawText 显示一个文本字符串
					  DT_SINGLELINE|DT_CENTER|DT_VCENTER);
			 EndPaint(hwnd, &ps);				// EndPaint 结束窗口绘制
			 return 0;
		case WM_DESTROY:
			 PostQuitMessage(0);				// PostQuitMessage 将“退出”信息插入消息队列
			 return 0;
	}
	return DefWindowProc(hwnd, message, wParam, lParam);	// DefWindowProc 执行默认的消息处理
}