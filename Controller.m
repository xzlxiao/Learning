classdef Controller < handle
    % 控制器对象
    properties
        viewobj       % 显示界面对象
        modelobj    % 数据操作模型对象
    end
    methods
        function obj = Controller(viewobj, modelobj)
            obj.viewobj = viewobj;
            obj.modelobj = modelobj;
        end
        function obj = test_button_callback(obj, event, data)
            % test_button回调函数
            obj.modelobj.picChange();
        end
    end
end

    