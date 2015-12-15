function [] = closematlabpool
% 函数功能：关闭matlabpool
% 修改时间：2015-9-24
% 作者：肖镇龙
% function [] = closematlabpool
nlabs = matlabpool('size');
if nlabs > 0
    matlabpool close;
end