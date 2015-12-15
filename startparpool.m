function [] = startparpool(size)
% �������ܣ�����parpool
% �޸�ʱ�䣺2015-11-30
% (c) Ф���� 2015
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
    if nargin == 0      % �ж������������
        poolobj = parpool('local');    %��Ĭ�Ϸ�ʽ����matlabpool
    else
        try
            poolobj = parpool('local', size);      % ������������Ϊ����Ĳ���ֵ
        catch ce
            poolobj = parpool('local');    % ��������˲���ȷ�Ĳ���ֵ�������Ĭ�Ϸ�ʽ����
            size = poolobj.NumWorkers;
            display(ce.message);
            display(strcat('����size����ȷ������Ĭ�����ã�size = ', num2str(size)));
        end
    end
else
    display('parpool �Ѿ�����');
    if nargin == 1
        if poolsize ~= size
            delete(poolobj);
            startparpool(size);
        end
    end
end