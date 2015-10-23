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
        uipanelButton;
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
    end
    methods
        function obj = CoordinGetView()
            obj = obj@ViewCenter([500, 400]);
            set(obj.hfig, 'color','menubar', 'none','toolbar', 'none' , [1,1,1]);
            
        end
        function UIbuild(obj)
            obj.uipanelAxes = uipanel('parent' , a, 'units', 'normal', 'pos', [0, 0.1, 1, 0.9]);
            obj.axesPic = axes('parent', b, 'pos', [0.001, 0.001, 0.998, 0.998], 'xTick' , [], 'yTick', [], 'xColor', [1 1 1], 'ycolor', [1 1 1],'visible', 'off');
            obj.sliderPic = uicontrol('parent', a, 'style', 'slider', 'units', 'normal', 'pos', [0, 0.08, 1, 0.02]);
            obj.CoorDisp = annotation('textbox', [0.1, 0.01, 0.1, 0.05],'edgecolor', [1,1,1]);    % string��Ϣ��Ҫ����model��
        end
    end
end