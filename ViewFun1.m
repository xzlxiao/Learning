classdef ViewFun1 < ViewCenter
    properties
        button
        textbox
    end
    methods
        function obj = ViewFun1()
            obj = obj@ViewCenter([300, 250]);
            UIbuild(obj);
        end
        function UIbuild(obj)
            obj.button = uicontrol('parent', obj.hfig, 'string', 'test', 'pos', [15, 10, 60, 28]) ;
            obj.textbox = uicontrol('parent', obj.hfig,'style', 'frame','pos', [15, 70, 500, 400]);
        end
    end
end