classdef Context < handle
    % 注册和获取方法
    % 1.注册
    % obj1 = ModelDevice('Camera');
    % contextObj = Context.getInstance();    % 获得全局上下文对象
    % contextObj.register('Camera', obj1);   % 注册Camera对象
    % 2.获取
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
            obj = localObj;  % 由于是handle型对象，obj和localObj都指向同一个对象
        end
    end
    methods
        register(obj, ID, data);
        fdata = getData(obj, ID);
    end
end
