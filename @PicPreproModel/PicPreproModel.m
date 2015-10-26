classdef PicPreproModel < handle
    properties
        % 数据
        imgData;    
        
    end
    events
        imgDataChange;
        
    end
    methods
        function obj = PicPreproModel()
        end
        function add(obj, view)
            img_inf = obj.imgData;
            inDir = view.editInput_d;
            outDir = view.editOutput_d;
            prefix = view.Prefix_d;
            suffix = view.Suffix_d;
            filename = view.Filename_d;
            cooX = view.editX_d;
            cooY = view.editY_d;
            width = view.editW_d;
            Height = view.editH_d;
            Z1 = view.editZ1_d;
            Z2 = view.editZ2_d;
            if isempty(inDir)|| ...
                    isempty(outDir)|| ...
                    isempty(cooX)|| ...
                    isempty(cooY)|| ...
                    isempty(width)|| ...
                    isempty(Height )|| ...
                    isempty(Z1 )|| ...
                    isempty(Z2)
                msgbox('请输入输出路径、坐标以及裁剪区域信息');
            else
                list_tmp1 = view.CropInfoBox_str;
                appendinfo = view.edit13_str;
                [n, ~] = size(list_tmp1);
                img_inf(n+1).SrcDir = inDir;
                img_inf(n+1).DstDir = outDir;
                img_inf(n+1).prefix = prefix;
                img_inf(n+1).suffix = suffix;
                img_inf(n+1).filename = filename;
                img_inf(n+1).CropWidthFirstPointCoordinate = str2num(cooX);
                img_inf(n+1).CropHeightFirstPointCoordinate = str2num(cooY);
                img_inf(n+1).CropWidth = str2num(width);
                img_inf(n+1).CropHeight = str2num(Height);
                img_inf(n+1).Zstart = str2num(Z1);
                img_inf(n+1).Zend = str2num(Z2);
                img_inf(n+1).init = n + 1;

                list_tmp2 = strcat('[', num2str(n+1), '] ', ...
                    prefix, 'XXXXX', suffix, ...
                    ' CropCoordinate X：', ...
                    num2str(img_inf(n+1).CropWidthFirstPointCoordinate), ' Y：', ...
                    num2str(img_inf(n+1).CropHeightFirstPointCoordinate), ' CropWidth：', ...
                    num2str(img_inf(n+1).CropWidth),  ' CropHeight：', ...
                    num2str(img_inf(n+1).CropHeight), ' ZRange：', ...
                    num2str(img_inf(n+1).Zstart), ' - ' , ...
                    num2str(img_inf(n+1).Zend), ' 备注信息：', ...
                    appendinfo);

                if n == 0
                    list_cat{1} = list_tmp2;
                else
                    list_cat(1:n) = list_tmp1;
                    list_cat{n+1} = list_tmp2;
                end
                set(view.CropInfoBox, 'string', list_cat);

                set(view.editX, 'string', '');
                set(view.editY, 'string', '');
                set(view.editW, 'string', '');
                set(view.editH, 'string', '');
                set(view.editZ1, 'string', '');
                set(view.editZ2, 'string', '');
            end
            obj.imgData = img_inf;
        end
        function Run()
            
        end
        function Input()
            
        end
        function Output()
            
        end
        function DeleteInfo()
            
        end
        function Information()
            
        end
        function Invert()
            
        end
        function Run2()
            
        end
        function ImProject()
            
        end
        function getCoordination()
            
        end
        function MkThumbnail()
            
        end
        function CropInfo()
            
        end
    end
end
    