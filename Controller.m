classdef Controller < handle
    % ����������
    properties
        viewobj       % ��ʾ�������
        modelobj    % ���ݲ���ģ�Ͷ���
    end
    methods
        function obj = Controller(viewobj, modelobj)
            obj.viewobj = viewobj;
            obj.modelobj = modelobj;
        end
        function obj = test_button_callback(obj, event, data)
            % test_button�ص�����
            obj.modelobj.picChange();
        end
    end
end

    