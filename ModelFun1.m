classdef ModelFun1 < handle
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
            notify('picChanged');
        end
    end
end