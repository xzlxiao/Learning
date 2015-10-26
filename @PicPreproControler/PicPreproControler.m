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
            obj.model.add;
        end
        function ButtonRun_callback(obj, event, data)
            obj.model.Run;
        end
        function ButtonInput_callback(obj, event, data)
            obj.model.Input;
        end
        function ButtonOutput_callback(obj, event, data)
            obj.model.Output;
        end
        function ButtonDel_callback(obj, event, data)
            obj.model.DeleteInfo;
        end
        function ButtonInfo_callback(obj, event, data)
            obj.model.Information;
        end
        function buttonInvert_callback(obj, event, data)
            obj.model.Invert;
        end
        function buttonRun2_callback(obj, event, data)
            obj.model.Run2;
        end
        function ButtonPrj_callback(obj, event, data)
            obj.model.Project;
        end
        function pushCoor_callback(obj, event, data)
            obj.model.getCoordination;
        end
        function buttonThumbnail_callback(obj, event, data)
            obj.model.Thumbnail;
        end
        function CropInfoBox_callback(obj, event, data)
            obj.model.CropInfo;
        end
    end
end