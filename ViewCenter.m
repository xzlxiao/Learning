classdef ViewCenter < ViewBase
    % 功能：创建一个位于屏幕中央的窗口
    % 接口：newsize是中央向左下便宜的坐标
    % 作者：肖镇龙
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
