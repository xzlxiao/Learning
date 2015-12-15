function [] = closeparpool
% �������ܣ��ر�parpool
% �޸�ʱ�䣺2015-11-30
% (c) Ф���� 2015
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