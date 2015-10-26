classdef PicPreproView < ViewCenter
    properties
        % 控件
        % editbox
        editX;
        editY;
        editW;
        editH;
        editZ1;
        editZ2;
        editInput;
        editOutput;
        Filename;
        Prefix;
        Suffix;
        edit13;     %备注框
        % textlabel
        text1;  % X
        text2;  % Y
        text3;  % W
        text4;  % H
        text5;  % 输入第一张图片
        text6;  % 输出路径
        text7;  % 裁剪图片序号
        Zend;   % -
        textTest;   % 备注提示
        text10; % 输入文件名
        text11; % 前缀
        text12; % 后缀
        text13;     %备注提示信息
        % button
        ButtonAdd;
        ButtonRun;
        ButtonInput;
        ButtonOutput
        ButtonDel;
        buttonInfo;
        buttonInvert;
        buttonRun2;
        ButtonPrj;
        pushCoor;
        buttonThumbnail;
        % listbox
        CropInfoBox;
        % panel
        uipanelIO;
        uipanelMessage;
        uipanelControl;
    end
    properties
        % 对象
        controler;
        model;
    end
    properties(Dependent)
        % 输入属性
        coorX;  % 坐标X
        coorY;  % 坐标Y
        coorW;  % 宽度W
        coorZ;  % 高度Z
        coorZ1; % 裁剪图片起始序号
        coorZ2; % 裁剪图片终止序号
    end
    properties
        % 状态
    end
    methods
        function obj = PicPreproView()
            obj = obj@ViewCenter([400, 221]);
            set(obj.hfig, 'color', [1,1,1],'menubar', 'none','toolbar', 'none', 'name', '图像预处理', 'resize', 'off' );
            obj.UIbuild;
        end
        UIbuild(obj);
        function MakeControler(obj)
            obj.controler = PicPreproControler(obj, obj.model);
        end
        AttachToController(obj, controler);
    end
end
