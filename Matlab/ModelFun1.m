classdef ModelFun1 < handle
    % 数据操作模型对象
    properties
        pictureR
    end
    events
        picChanged
    end
    methods
        function obj = ModelFun1()
            obj.pictureR = im2uint8(rand([100, 100]));
        end
        function picChange(obj)
            obj.pictureR = im2uint8(rand([100, 100]));
            obj.notify('picChanged');   % 事件同步通知
        end
    end
end