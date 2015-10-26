classdef PicPreproView < ViewCenter
    properties
        % �ؼ�
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
        edit13;     %��ע��
        % textlabel
        text1;  % X
        text2;  % Y
        text3;  % W
        text4;  % H
        text5;  % �����һ��ͼƬ
        text6;  % ���·��
        text7;  % �ü�ͼƬ���
        Zend;   % -
        textTest;   % ��ע��ʾ
        text10; % �����ļ���
        text11; % ǰ׺
        text12; % ��׺
        text13;     %��ע��ʾ��Ϣ
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
        % ����
        controler;
        model;
    end
    properties(Dependent)
        % ��������
        coorX;  % ����X
        coorY;  % ����Y
        coorW;  % ���W
        coorZ;  % �߶�Z
        coorZ1; % �ü�ͼƬ��ʼ���
        coorZ2; % �ü�ͼƬ��ֹ���
    end
    properties
        % ״̬
    end
    methods
        function obj = PicPreproView()
            obj = obj@ViewCenter([400, 221]);
            set(obj.hfig, 'color', [1,1,1],'menubar', 'none','toolbar', 'none', 'name', 'ͼ��Ԥ����', 'resize', 'off' );
            obj.UIbuild;
        end
        UIbuild(obj);
        function MakeControler(obj)
            obj.controler = PicPreproControler(obj, obj.model);
        end
        AttachToController(obj, controler);
    end
end
