classdef CoordinGetController < handle
    % ���ܣ�CoordinGetController
    % ���룺��
    % ���ԣ�
    % ������
    % �¼���
    % ��ע��Ф����/2015-10-24
    properties
        View;
        Model;
    end
    methods
        function obj = CoordinGetController(View, Model)
            obj.View = View;
            obj.Model = Model;
        end
        function WheelScrollFcn(obj, event, data)
            % ���ֻص�����
            obj.Model.ScrollWheel(obj.View.sliderPic, data)
        end
        function sliderPic_callback(obj, event, data)
            % �������ص�����
            obj.Model.SliderFcn(obj.View.sliderPic);
        end
        function btnInput_callback(obj, event, data)
            obj.Model.picRead(obj.View.sliderPic);
        end
        function btnDrawRect_callback(obj, event, data)
            axes(obj.View.axesPic);
            obj.Model.picRect(obj.View.axesPic);
        end
        function btnReturn_callback(obj, event, data)
            obj.Model.Retur;
            close(obj.View.hfig);
        end
    end
end