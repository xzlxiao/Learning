function [] = startmatlabpool(size)
% �������ܣ�����matlabpool
% �޸�ʱ�䣺2015-9-24
% ���ߣ�Ф����
% function [] = startmatlabpool(size)
isstart = 0;
nlabs = matlabpool('size');     % ��ѯ�����Ĳ�������
if nlabs == 0
    isstart = 1;
end
if isstart == 1
    if nargin == 0      % �ж������������
        matlabpool('open', 'local');    %��Ĭ�Ϸ�ʽ����matlabpool
    else
        try
            matlabpool('open', 'local', size);      % ������������Ϊ����Ĳ���ֵ
        catch ce
            matlabpool('open', 'local');    % ��������˲���ȷ�Ĳ���ֵ�������Ĭ�Ϸ�ʽ����
            size = matlabpool('size');
            display(ce.message);
            display(strcat('����size����ȷ������Ĭ�����ã�size = ', num2str(size)));
        end
    end
else
    display('matlabpool �Ѿ�����');
    if nlabs ~= size
        matlabpool close;
        startmatlabpool(size);
    end
end