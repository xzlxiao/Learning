classdef CoordinGetView < ViewCenter
    properties
        % �ؼ�
        % ͼƬ����
        uipanelAxes;
        axesPic;
        sliderPic;
        % ������ʾ
        % CoorDisp;
        % ��ť
        uitoolbarTop;
        btnInput;
        btnDrawRect;
        btnReturn;
    end
    properties
        % ����
        Controller;
        Model;
    end
    properties
        % �ؼ���������
        CDataInput;
        CDataRect;
        CDataReturn;
    end
    methods
        function obj = CoordinGetView(Model)
            obj = obj@ViewCenter([500, 400]);
            set(obj.hfig, 'color', [1,1,1],'menubar', 'none','toolbar', 'none', 'name', '�����ȡ', 'resize', 'on' );
            obj.Model = Model;
            obj.Model.addlistener('CoorChange', @obj.CoordinationUpdate);
            obj.Model.addlistener('CurNumChange', @obj.CurPicUpdate);
            obj.UIbuild;
            obj.MakeController;
            obj.AttachControll(obj.Controller);
        end
        function UIbuild(obj)
            obj.uipanelAxes = uipanel(obj.hfig, 'units', 'normal', 'pos', [0, 0.02, 1, 0.98]);
            obj.axesPic = axes('parent', obj.uipanelAxes, 'pos', [0.001, 0.001, 0.998, 0.998], 'xTick' , [], 'yTick', [], 'xColor', [1 1 1], 'ycolor', [1 1 1],'visible', 'off');
            obj.sliderPic = uicontrol(obj.hfig, 'style', 'slider', 'units', 'normal', 'pos', [0, 0, 1, 0.02]);
            % obj.CoorDisp = annotation('textbox', [0.1, 0.01, 0.1, 0.05],'edgecolor', [1,1,1]);    % string��Ϣ��Ҫ����model��
            obj.uitoolbarTop = uitoolbar(obj.hfig);
            obj.CDataInput = imresize(imread('icons/Open.png'), [16, 16]);
            obj.btnInput = uipushtool(obj.uitoolbarTop, 'cdata', obj.CDataInput, 'tooltipstring', '����ͼƬ');  % �ص���������Ϊ'clickedcallback'
            obj.CDataRect = imresize(imread('icons/Rect.png'), [16, 16]);
            obj.btnDrawRect = uipushtool(obj.uitoolbarTop, 'cdata', obj.CDataRect, 'tooltipstring', '�����');
            obj.CDataReturn = imresize(imread('icons/return3.png'), [16, 16]);
            obj.CDataReturn = cat(3, obj.CDataReturn, obj.CDataReturn, obj.CDataReturn);
            obj.btnReturn = uipushtool(obj.uitoolbarTop, 'cdata', obj.CDataReturn, 'tooltipstring', '����');
        end
        function CoordinationUpdate(obj, event, data)
            set(obj.hfig, 'name', mat2str(obj.Model.Coordination));
        end
        function CurPicUpdate(obj, event, data)
            axes(obj.axesPic);
            imshow(obj.Model.stack{obj.Model.CurNum});
        end
        function MakeController(obj)
            obj.Controller = CoordinGetController(obj, obj.Model);
        end
        function AttachControll(obj, controller)
            cbF = @controller.WheelScrollFcn;
            set(obj.hfig, 'WindowScrollWheelFcn', cbF);
            cbF = @controller.sliderPic_callback;
            set(obj.sliderPic, 'callback', cbF);
            cbF = @controller.btnInput_callback;
            set(obj.btnInput, 'clickedcallback', cbF);
            cbF = @controller.btnDrawRect_callback;
            set(obj.btnDrawRect, 'clickedcallback', cbF);
            cbF = @controller.btnReturn_callback;
            set(obj.btnReturn, 'clickedcallback', cbF);
        end
    end
end