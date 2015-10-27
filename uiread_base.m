classdef uiread_base < handle
    % 功能：通过UI界面调用文件
    % 接口：filetype, '*.jpg; *.tif; ...' ; typename, '图片'; 可选参数 multiselect,
    % 'on'
    % 属性：filename；pathname；formats；sizes；path_dir；
    % 方法：无
    properties
        filename
        pathname
        formats
        sizes = 0
    end
    properties(Hidden)
        % 读取状态
        state = 0;
    end
    properties(Dependent)
        path_dir
    end
    methods
        function obj = uiread_base(filetype, typename, multiselect)
            % 暂未设定类型检验
            if ~ischar(filetype)
                error('filetype必须为字符串');
            elseif ~ischar(typename)
                error('typename必须为字符串');
            elseif nargin == 2
                obj.formats = typename;
                title_name = strcat(upper(typename), ' 文件选择');
                [filename_tmp, pathname_tmp] =  uigetfile({filetype, typename}, title_name);
                if filename_tmp~=0
                    obj.filename = filename_tmp;
                    obj.pathname = pathname_tmp;
                    obj. sizes = 1;
                    obj.state = 1;
                end
            elseif nargin == 3
                if (ischar(multiselect))&&(strcmp(multiselect, 'on'))
                     obj.formats = typename;
                     title_name = strcat(upper(typename), ' 文件选择');
                     [filename_tmp, pathname_tmp] =  uigetfile({filetype, typename}, title_name, 'MultiSelect', 'on');
                    if iscell(filename_tmp)||ischar(filename_tmp)
                        obj.filename = filename_tmp;
                        obj.pathname = pathname_tmp;
                        if ~iscell(filename_tmp)
                            obj. sizes = 1;
                        else
                            [~, obj.sizes] = size(filename_tmp);
                        end
                        obj.state = 1;
                    end
                else
                    error('请输入正确的参数');
                end
            end
        end
        function path_dir = get.path_dir(obj)
            path_dir = strcat(obj.pathname, obj.filename);
        end
    end
end