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
    properties(Hidden, SetAccess = protected)
        % ����
        picread;  % ͼƬ��ȡ����
        picRec;   % imrect����
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
        function picRect(obj, axes_handle)
            % ����򴴽�����
            % (��ʵ�֣���Ҫ���imrect�����������ٴΰ��°�ťʱ�������һ��imrect
            obj.picRec = imrect(axes_handle);
            addNewPositionCallback(obj.picRec, @obj.resizeRect);
            fcn = makeConstrainToRectFcn('imrect',get(axes_handle,'XLim'),get(axes_handle,'YLim'));
            setPositionConstraintFcn(obj.picRec,fcn);
            obj.notify('CoorChange');
        end
        function Coordination = get.Coordination(obj)
            Coordination = getPosition(obj.picRec);
        end
        function resizeRect(obj)
            % (��ʵ�֣��������������
            obj.notify('CoorChange');
        end
        function Coordi = Retur(obj)
            %���غ���
            Coordi = obj.Coordination;
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
            obj.notify('CurNumChange');
        end
        function SliderFcn(obj, scroll_handle)
            % slider�ĺ���
            obj.CurNum = round(get(scroll_handle, 'value'));
            obj.notify('CurNumChange');
        end
    end
end