classdef ViewFun1 < ViewCenter
    properties
        test_button;    % 控件
        im_axe1;         % 控件
        modelobj;     % 数据模型操作对象
        controller;     % 控制器对象
    end
    methods
        function obj = ViewFun1(modelobj)
            obj = obj@ViewCenter([300, 250]);
            set(obj.hfig, 'resize', 'on');
            UIbuild(obj);
            obj.modelobj = modelobj;
            obj.modelobj.addlistener('picChanged', @obj.imChange);
            obj.controller = obj.makecontroller();
            obj.attachTocontroller(obj.controller);
        end
        function UIbuild(obj)
            obj.test_button = uicontrol('parent', obj.hfig, 'string', 'test', 'pos', [15, 10, 60, 28]) ;
            obj.im_axe1 = axes('parent', obj.hfig, 'pos',  [0, 0.1, 1, 0.9], 'xTick' , [], 'yTick', [], 'xColor', [1 1 1], 'ycolor', [1 1 1]);
        end
        function imChange(obj, event, data)
            axes(obj.im_axe1);
            imshow(obj.modelobj.pictureR);
        end
        function controller = makecontroller(obj)
            controller = Controller(obj, obj.modelobj);
        end
        function attachTocontroller(obj, controller)
            set(obj.test_button, 'callback', @controller.test_button_callback);
        end
    end
end