classdef PicPreproView < ViewCenter
    properties  % 控件
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
    properties  % 对象
        controler;
        model;
    end
    properties(Dependent)  % 输入属性
        editX_d;
        editY_d;
        editW_d;
        editH_d;
        editZ1_d;
        editZ2_d;
        editInput_d;
        editOutput_d;
        Filename_d;
        Prefix_d;
        Suffix_d;
        CropInfoBox_str;
        CropInfoBox_val;
        % 还未定义属性
        edit13_str;
    end
    properties  % 状态
        
    end
    methods
        function obj = PicPreproView(model)
            obj = obj@ViewCenter([400, 221]);
            obj.model = model;
            set(obj.hfig, 'color', [1,1,1],'menubar', 'none','toolbar', 'none', 'name', '图像预处理', 'resize', 'off' );
            obj.UIbuild;
            obj.MakeControler;
            obj.AttachToController(obj.controler);
        end
        UIbuild(obj);
        function MakeControler(obj)
            obj.controler = PicPreproControler(obj, obj.model);
        end
        AttachToController(obj, controler);
    end
    methods  % Dependent属性的方法
        function editX_d = get.editX_d(obj)
            editX_d = get(obj.editX, 'string');
        end
        function editY_d = get.editY_d(obj)
            editY_d = get(obj.editY, 'string');
        end
        function editW_d = get.editW_d(obj)
            editW_d = get(obj.editW, 'string');
        end
        function editH_d = get.editH_d(obj)
            editH_d = get(obj.editH, 'string');
        end
        function editZ1_d = get.editZ1_d(obj)
            editZ1_d = get(obj.editZ1, 'string');
        end
        function editZ2_d = get.editZ2_d(obj)
            editZ2_d = get(obj.editZ2, 'string');
        end
        function editInput_d = get.editInput_d(obj)
            editInput_d = get(obj.editInput, 'string');
        end
        function editOutput_d = get.editOutput_d(obj)
            editOutput_d = get(obj.editOutput, 'string');
        end
        function Filename_d = get.Filename_d(obj)
            Filename_d = get(obj.Filename, 'string');
        end
        function Prefix_d = get.Prefix_d(obj)
            Prefix_d = get(obj.Prefix, 'string');
        end
        function Suffix_d = get.Suffix_d(obj)
            Suffix_d = get(obj.Suffix, 'string');
        end
        function CropInfoBox_str = get.CropInfoBox_str(obj)
            CropInfoBox_str = get(obj.CropInfoBox, 'string');
        end
        function CropInfoBox_val = get.CropInfoBox_val(obj)
            CropInfoBox_val = get(obj.CropInfoBox_val, 'value');
        end
        function edit13_str = get.edit13_str(obj)
            edit13_str = get(obj.edit13, 'string');
        end
    end
end
