classdef uiread_picture < uiread_base
    % ���ܣ�ͨ��UI�������ͼƬ�ļ�
    % �ӿڣ���
    % ���ԣ�filename��pathname��formats��sizes��path_dir��
    % ��������
    properties
    end
    methods
        function obj = uiread_picture()
            obj = obj@uiread_base('*.jpg; *.bmp; *.tif; *.png; *.gif', 'ͼƬ', 'on');
        end
    end
end