classdef ModelFun1 < handle
    % ���ݲ���ģ�Ͷ���
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
            obj.notify('picChanged');   % �¼�ͬ��֪ͨ
        end
    end
end