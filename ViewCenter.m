classdef ViewCenter < ViewBase
    properties
        button
        textbox
    end
    properties(Dependent)
        ScreenSize
    end
    methods
        function obj = ViewCenter()
            obj = obj@ViewBase([100, 100, 600, 500], 'Center');
            [x0, y0] = getScreenCenter();
            set(obj.hfig, 'pos',[x0, y0, 600, 500]);
            obj.viewsize = [x0, y0, 600, 500];
            UIbuild(obj);
        end
        function UIbuild(obj)
            obj.button = uicontrol('parent', obj.hfig, 'string', 'test', 'pos', [15, 10, 60, 28]) ;
            obj.textbox = uicontrol('parent', obj.hfig,'style', 'frame','pos', [15, 70, 500, 400]);
        end
        function ScreenSize = get.ScreenSize(obj)
            ScreenSize = get(0, 'ScreenSize');
        end
    end
end
function [x, y] = getScreenCenter()
    ScreenSize = get(0, 'ScreenSize');
    x = ScreenSize(1,3)/2 - 300;
    y = ScreenSize(1,4)/2 - 250;
end
