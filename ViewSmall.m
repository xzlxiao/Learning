classdef ViewSmall < ViewBase
    properties
        % 这里定义该视图上的控件
    end
    methods
        function obj = ViewSmall()
            % ViewSmall 类定制自己窗口的大小
            obj = obj@ViewBase([50, 50, 250, 200], 'Small');
        end
    end
end
