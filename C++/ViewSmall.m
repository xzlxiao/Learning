classdef ViewSmall < ViewBase
    properties
        % ���ﶨ�����ͼ�ϵĿؼ�
    end
    methods
        function obj = ViewSmall()
            % ViewSmall �ඨ���Լ����ڵĴ�С
            obj = obj@ViewBase([50, 50, 250, 200], 'Small');
        end
    end
end
