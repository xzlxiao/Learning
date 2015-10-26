classdef CoordinGetModel < handle
    % 功能：CoordinGetModel
    % 输入：无
    % 属性：stack; CurNum; picread; picRec; Coordination;
    % 方法：picRead; picRect; resizeRect; Retur; ScrollWheel; 
    % 事件：CurNumChange; CoorChange;
    % 备注：肖镇龙/2015-10-24
    properties
        stack;      % 读取的图片
        CurNum; %当前图片的序号
        returncode = [0, 0, 0, 0];
    end
    properties(Hidden)
        % 对象
        picread;  % 图片读取对象
        picRec;   % imrect对象
    end
    properties(Hidden)
        % 临时属性
        picRecCreated = 0;
        lastRectPos;
    end
    properties(Dependent)
        Coordination;  % 坐标
    end
    events
        CurNumChange;
        CoorChange;
    end
    methods 
        function obj = CoordinGetModel()
        end
        function picRead(obj, scroll_handle)
            % 图片读取函数,
            % （待实现）如果横纵坐标大于某值时，生成缩略图；图片数量大于某值时，生成投影图
            obj.picread = uiread_picture;
            if obj.picread.state == 1
                pic_waitbar = waitbar(0, '图片读取中...');
                steps = obj.picread.sizes;
                for i = 1 : obj.picread.sizes
                    pic_tmp = imread(obj.picread.path_dir{1, i});
                    obj.stack{i} = pic_tmp;
                    waitbar(i/steps, pic_waitbar);
                end
                close(pic_waitbar);
                obj.CurNum = 1;
                set(scroll_handle, 'value', obj.CurNum, 'Min', 1, 'Max', obj.picread.sizes, 'SliderStep', [1/obj.picread.sizes, 1/obj.picread.sizes]);
                obj.notify('CurNumChange');
            end
        end
        function picRect(obj, axes_handle)
            % 坐标框创建函数
            imshow(obj.stack{obj.CurNum})
            obj.picRec = imrect(axes_handle);
            obj.picRecCreated = 1;
            addNewPositionCallback(obj.picRec, @obj.resizeRect);    % 设置拖动方框时的回调函数
            fcn = makeConstrainToRectFcn('imrect',get(axes_handle,'XLim'),get(axes_handle,'YLim'));
            setPositionConstraintFcn(obj.picRec,fcn);
            obj.notify('CoorChange');
        end
        function Coordination = get.Coordination(obj)
            Coordination = getPosition(obj.picRec);
        end
        function resizeRect(obj, event, data)
            % 坐标框修正函数
            obj.notify('CoorChange');
        end
        function Retur(obj)
            %返回函数
            obj.returncode = obj.Coordination;
        end
        function ScrollWheel(obj, scroll_handle, data)
            %滚轮函数
            if (data.VerticalScrollCount > 0)&&(obj.CurNum < obj.picread.sizes)
                obj.CurNum = obj.CurNum + 1;
                set(scroll_handle, 'value', obj.CurNum);
            elseif (data.VerticalScrollCount < 0)&&(obj.CurNum > 1)
                obj.CurNum = obj.CurNum - 1;
                set(scroll_handle, 'value', obj.CurNum);
            end
            if obj.picRecCreated == 1
                obj.lastRectPos = obj.Coordination;
            end
            obj.notify('CurNumChange');
        end
        function SliderFcn(obj, scroll_handle)
            % slider的函数
            obj.CurNum = round(get(scroll_handle, 'value'));
            if obj.picRecCreated == 1
                obj.lastRectPos = obj.Coordination;
            end
            obj.notify('CurNumChange');
        end
    end
end