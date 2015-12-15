function [] = startmatlabpool(size)
% 函数功能：开启matlabpool
% 修改时间：2015-9-24
% 作者：肖镇龙
% function [] = startmatlabpool(size)
isstart = 0;
nlabs = matlabpool('size');     % 查询开启的并行数量
if nlabs == 0
    isstart = 1;
end
if isstart == 1
    if nargin == 0      % 判断输入参数数量
        matlabpool('open', 'local');    %以默认方式开启matlabpool
    else
        try
            matlabpool('open', 'local', size);      % 开启并行数量为输入的参数值
        catch ce
            matlabpool('open', 'local');    % 如果输入了不正确的参数值，则采用默认方式开启
            size = matlabpool('size');
            display(ce.message);
            display(strcat('输入size不正确，采用默认配置，size = ', num2str(size)));
        end
    end
else
    display('matlabpool 已经启动');
    if nlabs ~= size
        matlabpool close;
        startmatlabpool(size);
    end
end