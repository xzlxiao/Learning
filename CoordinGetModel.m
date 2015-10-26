classdef CoordinGetModel < handle
    % ���ܣ�CoordinGetModel
    % ���룺��
    % ���ԣ�stack; CurNum; picread; picRec; Coordination;
    % ������picRead; picRect; resizeRect; Retur; ScrollWheel; 
    % �¼���CurNumChange; CoorChange;
    % ��ע��Ф����/2015-10-24
    properties
        stack;      % ��ȡ��ͼƬ
        CurNum; %��ǰͼƬ�����
        returncode = [0, 0, 0, 0];
    end
    properties(Hidden)
        % ����
        picread;  % ͼƬ��ȡ����
        picRec;   % imrect����
    end
    properties(Hidden)
        % ��ʱ����
        picRecCreated = 0;
        lastRectPos;
    end
    properties(Dependent)
        Coordination;  % ����
    end
    events
        CurNumChange;
        CoorChange;
    end
    methods 
        function obj = CoordinGetModel()
        end
        function picRead(obj, scroll_handle)
            % ͼƬ��ȡ����,
            % ����ʵ�֣���������������ĳֵʱ����������ͼ��ͼƬ��������ĳֵʱ������ͶӰͼ
            obj.picread = uiread_picture;
            if obj.picread.state == 1
                pic_waitbar = waitbar(0, 'ͼƬ��ȡ��...');
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
            % ����򴴽�����
            imshow(obj.stack{obj.CurNum})
            obj.picRec = imrect(axes_handle);
            obj.picRecCreated = 1;
            addNewPositionCallback(obj.picRec, @obj.resizeRect);    % �����϶�����ʱ�Ļص�����
            fcn = makeConstrainToRectFcn('imrect',get(axes_handle,'XLim'),get(axes_handle,'YLim'));
            setPositionConstraintFcn(obj.picRec,fcn);
            obj.notify('CoorChange');
        end
        function Coordination = get.Coordination(obj)
            Coordination = getPosition(obj.picRec);
        end
        function resizeRect(obj, event, data)
            % �������������
            obj.notify('CoorChange');
        end
        function Retur(obj)
            %���غ���
            obj.returncode = obj.Coordination;
        end
        function ScrollWheel(obj, scroll_handle, data)
            %���ֺ���
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
            % slider�ĺ���
            obj.CurNum = round(get(scroll_handle, 'value'));
            if obj.picRecCreated == 1
                obj.lastRectPos = obj.Coordination;
            end
            obj.notify('CurNumChange');
        end
    end
end