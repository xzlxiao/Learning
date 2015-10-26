classdef PicPreproControler < handle
    properties
        model;
        view;
    end
    methods
        function obj = PicPreproControler(view, model)
            obj.view = view;
            obj.model = model;
        end
        function ButtonAdd_callback(obj, event, data)
            obj.model.add(obj.view);
        end
        function ButtonRun_callback(obj, event, data)
            obj.model.Run(obj.view);
        end
        function ButtonInput_callback(obj, event, data)
            obj.model.Input(obj.view);
        end
        function ButtonOutput_callback(obj, event, data)
            obj.model.Output(obj.view);
        end
        function ButtonDel_callback(obj, event, data)
            obj.model.DeleteInfo(obj.view);
        end
        function buttonInfo_callback(obj, event, data)
            obj.model.Information;
        end
        function buttonInvert_callback(obj, event, data)
            obj.model.Invert;
        end
        function buttonRun2_callback(obj, event, data)
            obj.model.Run2(obj.view);
        end
        function ButtonPrj_callback(obj, event, data)
            obj.model.ImProject;
        end
        function pushCoor_callback(obj, event, data)
            obj.model.getCoordination;
        end
        function buttonThumbnail_callback(obj, event, data)
            obj.model.MkThumbnail;
        end
        function CropInfoBox_callback(obj, event, data)
            obj.model.CropInfo;
        end
    end
end