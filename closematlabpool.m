function [] = closematlabpool
% �������ܣ��ر�matlabpool
% �޸�ʱ�䣺2015-9-24
% ���ߣ�Ф����
% function [] = closematlabpool
nlabs = matlabpool('size');
if nlabs > 0
    matlabpool close;
end