classdef CoordinGetView < ViewCenter
    properties
        % �ؼ�
        % ͼƬ����
        uipanelAxes;
        axesPic;
        sliderPic;
        % ������ʾ
        CoorDisp;
        % ��ť
        uitoolbarTop;
        btnInput;
        btnDrawRect;
        btnReturn;
    end
    properties
        % ����
        CoorController;
        CoorModel;
    end
    properties
        % �ؼ���������
        viewtitle;
        CDataInput;
        CDataRect;
        CDataReturn;
    end
    methods
        function obj = CoordinGetView()
            obj = obj@ViewCenter([500, 400]);
            set(obj.hfig, 'color', [1,1,1],'menubar', 'none','toolbar', 'none', 'name', '�����ȡ', 'resize', 'on' );
            obj.UIbuild;
        end
        function UIbuild(obj)
            obj.uipanelAxes = uipanel(obj.hfig, 'units', 'normal', 'pos', [0, 0.1, 1, 0.9]);
            obj.axesPic = axes('parent', obj.uipanelAxes, 'pos', [0.001, 0.001, 0.998, 0.998], 'xTick' , [], 'yTick', [], 'xColor', [1 1 1], 'ycolor', [1 1 1],'visible', 'off');
            obj.sliderPic = uicontrol(obj.hfig, 'style', 'slider', 'units', 'normal', 'pos', [0, 0.08, 1, 0.02]);
            obj.CoorDisp = annotation('textbox', [0.1, 0.01, 0.1, 0.05],'edgecolor', [1,1,1]);    % string��Ϣ��Ҫ����model��
            obj.uitoolbarTop = uitoolbar(obj.hfig);
            obj.CDataInput = imresize(imread('icons\Open.png'), [16, 16]);
            obj.btnInput = uipushtool(obj.uitoolbarTop, 'cdata', obj.CDataInput, 'tooltipstring', '����ͼƬ');  % �ص���������Ϊ'clickedcallback'
            obj.CDataRect = imresize(imread('icons\Rect.png'), [16, 16]);
            obj.btnDrawRect = uipushtool(obj.uitoolbarTop, 'cdata', obj.CDataRect, 'tooltipstring', '�����');
            obj.CDataReturn = imresize(imread('icons\return3.png'), [16, 16]);
            obj.CDataReturn = cat(3, obj.CDataReturn, obj.CDataReturn, obj.CDataReturn);
            obj.btnReturn = uipushtool(obj.uitoolbarTop, 'cdata', obj.CDataReturn, 'tooltipstring', '����');
        end
    end
end