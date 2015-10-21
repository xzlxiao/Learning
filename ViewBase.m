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
            set(obj.hfig, 'resize', 'off', ...      % ������resize
                'menubar', 'none', ...            % û��menubar
                'numbertitle', 'off', ...             % title��û������
                'name', 'Demo');                   % ��������ͬ
        end
        function delete(obj)
            delete(obj.hfig);
            clear obj;
        end
    end
end
