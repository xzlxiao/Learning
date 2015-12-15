function [] = startparpool(size)
% 函数功能：开启parpool
% 修改时间：2015-11-30
% (c) 肖镇龙 2015
% function [] = startparpool(size)
isstart = 0;
poolobj = gcp('nocreate');      % If no pool, do not create new one.
if isempty(poolobj)
    poolsize = 0;
else
    poolsize = poolobj.NumWorkers;
end
if poolsize == 0
    isstart = 1;
end
if isstart == 1
    if nargin == 0      % 判断输入参数数量
        poolobj = parpool('local');    %以默认方式开启matlabpool
    else
        try
            poolobj = parpool('local', size);      % 开启并行数量为输入的参数值
        catch ce
            poolobj = parpool('local');    % 如果输入了不正确的参数值，则采用默认方式开启
            size = poolobj.NumWorkers;
            display(ce.message);
            display(strcat('输入size不正确，采用默认配置，size = ', num2str(size)));
        end
    end
else
    display('parpool 已经启动');
    if nargin == 1
        if poolsize ~= size
            delete(poolobj);
            startparpool(size);
        end
    end
end