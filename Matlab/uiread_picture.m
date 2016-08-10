classdef uiread_picture < uiread_base
    % 功能：通过UI界面调用图片文件
    % 接口：无
    % 属性：filename；pathname；formats；sizes；path_dir；
    % 方法：无
    properties
    end
    methods
        function obj = uiread_picture()
            obj = obj@uiread_base('*.jpg; *.bmp; *.tif; *.png; *.gif', '图片', 'on');
        end
    end
end