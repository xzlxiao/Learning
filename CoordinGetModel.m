classdef CoordinGetModel < handle
    properties
        stack;      % 读取的图片
        CurNum; %当前图片的序号
        Coordination;  % 坐标
        picread;  % 图片读取对象
    end
    events
        CurNumChange;
        CoorChange;
    end
    methods 
        function obj = CoordinGetModel()
        end
        %图片读取函数
        %坐标框创建函数
        %坐标框修正函数
        %返回函数
        %滚轮函数
    end
end