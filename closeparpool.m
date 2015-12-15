function [] = closeparpool
% 函数功能：关闭parpool
% 修改时间：2015-11-30
% (c) 肖镇龙 2015
% function [] = closeparpool
poolobj = gcp('nocreate'); % If no pool, do not create new one.
if isempty(poolobj)
    poolsize = 0;
else
    poolsize = poolobj.NumWorkers;
end
if poolsize > 0
    delete(poolobj);
end