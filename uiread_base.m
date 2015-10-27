classdef uiread_base < handle
    % ���ܣ�ͨ��UI��������ļ�
    % �ӿڣ�filetype, '*.jpg; *.tif; ...' ; typename, 'ͼƬ'; ��ѡ���� multiselect,
    % 'on'
    % ���ԣ�filename��pathname��formats��sizes��path_dir��
    % ��������
    properties
        filename
        pathname
        formats
        sizes = 0
    end
    properties(Hidden)
        % ��ȡ״̬
        state = 0;
    end
    properties(Dependent)
        path_dir
    end
    methods
        function obj = uiread_base(filetype, typename, multiselect)
            % ��δ�趨���ͼ���
            if ~ischar(filetype)
                error('filetype����Ϊ�ַ���');
            elseif ~ischar(typename)
                error('typename����Ϊ�ַ���');
            elseif nargin == 2
                obj.formats = typename;
                title_name = strcat(upper(typename), ' �ļ�ѡ��');
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
                     title_name = strcat(upper(typename), ' �ļ�ѡ��');
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
                    error('��������ȷ�Ĳ���');
                end
            end
        end
        function path_dir = get.path_dir(obj)
            path_dir = strcat(obj.pathname, obj.filename);
        end
    end
end