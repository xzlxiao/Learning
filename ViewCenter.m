classdef ViewCenter < ViewBase
    % ���ܣ�����һ��λ����Ļ����Ĵ���
    % �ӿڣ�newsize�����������±��˵�����
    % ���ߣ�Ф����
    properties(Dependent)
        ScreenSize
    end
    methods
        function obj = ViewCenter(newsize)
            obj = obj@ViewBase([1, 1, 1, 1], 'Center');
            [x0, y0] = getScreenCenter();
            set(obj.hfig, 'pos',[x0 - newsize(1,1), y0 - newsize(1,2), ...
                newsize(1,1)*2, newsize(1,2)*2]);
            obj.viewsize = newsize;
        end
        function ScreenSize = get.ScreenSize(obj)
            ScreenSize = get(0, 'ScreenSize');
        end
    end
end
function [x, y] = getScreenCenter()
    ScreenSize = get(0, 'ScreenSize');
    x = ScreenSize(1,3)/2;
    y = ScreenSize(1,4)/2;
end
