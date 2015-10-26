classdef Context < handle
    % ע��ͻ�ȡ����
    % 1.ע��
    % obj1 = ModelDevice('Camera');
    % contextObj = Context.getInstance();    % ���ȫ�������Ķ���
    % contextObj.register('Camera', obj1);   % ע��Camera����
    % 2.��ȡ
    % contextObj = Context.getInstance();
    % hCamera = contextObj.getData('Camera');
    properties
        dataDictionary;
    end
    methods(Access = private)
        function obj = Context()
            obj.dataDictionary = containers.Map();
        end
    end
    methods(Static)
        function obj = getInstance()
            persistent localObj;
            if isempty(localObj) || ~isvalid(localObj)
                localObj = Context();
            end
            obj = localObj;  % ������handle�Ͷ���obj��localObj��ָ��ͬһ������
        end
    end
    methods
        register(obj, ID, data);
        fdata = getData(obj, ID);
    end
end
