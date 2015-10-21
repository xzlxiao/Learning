classdef ViewBase < handle
    properties
        hfig
        viewsize
        ID
    end
    methods
        function obj = ViewBase(viewsize, ID)
            obj.viewsize = viewsize;
            obj.ID = ID;
            obj.hfig = figure('pos', viewsize);
            set(obj.hfig, 'resize', 'off', ...      % 不允许resize
                'menubar', 'none', ...            % 没有menubar
                'numbertitle', 'off', ...             % title中没有数字
                'name', 'Demo');                   % 窗口名相同
        end
        function delete(obj)
            delete(obj.hfig);
            clear obj;
        end
    end
end
