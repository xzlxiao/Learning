classdef PicPreproModel < handle
    properties
        % 数据
        imgData;    
        
    end
    events
        imgDataChange;
        
    end
    methods  % 成员方法
        Crop_img(obj, img_inf);
        varargout = img_invert(obj, img_file);
        CropIn_img(obj, img_inf);
        CreateFolder(obj, dir);
        A = img_prj(obj, A, B, k);
    end
    methods  % 回调函数
        function obj = PicPreproModel()
        end
        add(obj, view);
        function Run(obj, view)
            img_inf = obj.imgData;
            
            [~, col] = size(img_inf);
            waitbar_crop = waitbar(0, '图片裁剪中');
            steps = col;
            for i = 1 : col
                obj.Crop_img(img_inf(i));
                waitbar(i/steps, waitbar_crop, strcat('总进度：图片序列',num2str(i)));
            end
            close(waitbar_crop);
            Outprint = get(view.CropInfoBox, 'string');
            file1 = fopen('CropInfo.txt', 'at');
            fprintf(file1, '%s \n', date);
            [n, ~] = size(Outprint);
            filename_info = 'info.txt';
            for i = 1 : n
                fprintf(file1, '%s \n', Outprint{i,1});
            end
            fclose(file1);
            for i = 1 : n
                SavDir = strcat(img_inf(i).DstDir, filename_info);
                file2 = fopen(SavDir, 'at');
                fprintf(file2, '%s \n', date);
                fprintf(file2, '%s \n', Outprint{i,1});
                fclose(file2);
            end
        end
        function Input(obj, view)
            [filename, indir] = uigetfile({'*.jpg'},'选择需要裁剪的第一张图片');
            if indir ~= 0
                set(view.editInput, 'string', indir);
                set(view.Filename, 'string', filename);
            end
        end
        function Output(obj, view)
            outdir = uigetdir({},'选择文件夹');
            if outdir ~= 0
                outdir = strcat(outdir,'\');
                set(view.editOutput, 'string', outdir);
            end
        end
        function DeleteInfo(obj, view)
            img_inf = obj.imgData;
            [~,n] = size(img_inf);
            CurPt = get(view.CropInfoBox, 'Value');
            
            % 列表框当前选中项
            if CurPt == 1
                img_inf = img_inf(2:n);
            elseif CurPt == n
                set(view.CropInfoBox, 'Value', n-1);
                img_inf = img_inf(1:(n-1));
            else
                img_tmp(1:CurPt-1) = img_inf(1:CurPt-1);
                img_tmp(CurPt:(n-1)) = img_inf((CurPt+1):n);
                img_inf = img_tmp;
            end
            obj.imgData = img_inf;
            obj.notify('imgDataChange');
        end
        function Information(obj)
            open('图片裁剪GUI设计说明.txt');
        end
        function Invert(obj)
            obj.img_invert;
        end
        function Run2(obj, view)
            img_inf = obj.imgData;
            [~, col] = size(img_inf);
            for i = 1 : col
                obj.CropIn_img(img_inf(i));
            end
            Outprint = get(view.CropInfoBox, 'string');
            file1 = fopen('CropInfo.txt', 'at');
            fprintf(file1, '%s \n', date);
            [n, ~] = size(Outprint);
            filename_info = 'info.txt';
            for i = 1 : n
                fprintf(file1, '%s \n', Outprint{i,1});
            end
            fclose(file1);
            for i = 1 : n
                SavDir = strcat(img_inf(i).DstDir, filename_info);
                file2 = fopen(SavDir, 'at');
                fprintf(file2, '%s \n', date);
                fprintf(file2, '%s \n', Outprint{i,1});
                fclose(file2);
            end
        end
        function ImProject(obj, view)
            [filename, pathname] = uigetfile({'*.jpg', 'JPG文件';'*.tif', 'TIF文件'}, '选取图片', 'MultiSelect', 'on');
            prj_property = -1;
            if pathname ~= 0
                prj_ptmp = questdlg('请确定投影图片背景颜色，已决定正确地投影参数', ...
                    '投影参数选择', '黑色', '浅色', '取消', '黑色');
                switch prj_ptmp
                    case '黑色'
                        prj_property = 1;
                    case '浅色'
                        prj_property = 0;
                    case '取消'
                        prj_property = -1;
                end
            end
            if prj_property ~= -1
                %   判断叠加的图片数量
                stack_num = 100;
                %   设置投影图储存地址
                save_path = strcat(pathname, 'prj\');
                obj.CreateFolder(save_path);
                %   设置图片读取的路径信息
                [~, up_lim] = size(filename);
                filedir = cell(1, up_lim);
                for i = 1 : up_lim
                    filedir{1, i} = strcat(pathname, filename{1, i});
                end
                fix_lim = fix(up_lim/stack_num);
                rem_lim = rem(up_lim, stack_num);
                %   按顺序读取图片
                if rem_lim > 0
                    waitbar_1 = waitbar(0, '进度');
                    steps = up_lim;
                    for i = 0 : (fix_lim - 1)
                        img_first = imread(filedir{(i*stack_num) + 1});
                        for j = 1 : stack_num
                            img_next = imread(filedir{(i * stack_num) + j});
                            img_first = obj.img_prj(img_first, img_next, prj_property);
                            waitbar(((i * stack_num) + j)/steps,waitbar_1,num2str((i * stack_num) + j));
                        end
                        [filename2, ~] = strtok(filename{(i*stack_num) + 1}, '.');
                        ImgInvert = obj.img_invert(img_first);
                        obj.CreateFolder(strcat(save_path, 'INVERT\'));
                        imwrite(ImgInvert, strcat(save_path, 'INVERT\' , filename2, 'stack.tif'));
                        imwrite(img_first, strcat(save_path, filename2, 'stack.tif'));
                    end
                    img_first = imread(filedir{(fix_lim*stack_num) + 1});
                    for i = 1 : rem_lim
                        img_next = imread(filedir{(fix_lim*stack_num) + i});
                        img_first = obj.img_prj(img_first, img_next, prj_property);
                        waitbar(((fix_lim*stack_num) + i)/steps, waitbar_1, num2str((fix_lim*stack_num) + i));
                    end
                    [filename2, ~] = strtok(filename{(fix_lim*stack_num) + 1}, '.');
                    ImgInvert = obj.img_invert(img_first);
                    CreateFolder(strcat(save_path, 'INVERT\'));
                    imwrite(ImgInvert, strcat(save_path, 'INVERT\' , filename2, 'stack.tif'));
                    imwrite(img_first, strcat(save_path, filename2, 'stack.tif'));
                    close(waitbar_1);
                else
                    waitbar_2 = waitbar(0, '进度');
                    steps = up_lim;
                    for i = 0 : (fix_lim - 1)
                        img_first = imread(filedir{(i*stack_num) + 1});
                        for j = 1 : stack_num
                            img_next = imread(filedir{(i * stack_num) + j});
                            img_first = obj.img_prj(img_first, img_next, prj_property);
                            waitbar(((i * stack_num) + j)/steps, waitbar_2, num2str((i * stack_num) + j));
                        end
                        [filename2, ~] = strtok(filename{(i*stack_num) + 1}, '.');
                        ImgInvert = obj.img_invert(img_first);
                        obj.CreateFolder(strcat(save_path, 'INVERT\'));
                        imwrite(ImgInvert, strcat(save_path, 'INVERT\' , filename2, 'stack.tif'));
                        imwrite(img_first, strcat(save_path, filename2, 'stack.tif'));
                    end
                    close(waitbar_2);
                end
            end
        end
        function getCoordination()
            % 调用坐标获取GUI
            
            
        end
        function MkThumbnail(obj)
            thumbNail = thumbnail;
            thumbNail.write;
        end
    end
end
    