function AttachToController(obj, controler)
    % 功能绑定回调函数与控制器
    cbF = @controler.ButtonAdd_callback;
    set(obj.ButtonAdd, 'callback', cbF);
    cbF = @controler.ButtonRun_callback;
    set(obj.ButtonRun, 'callback', cbF);
    cbF = @controler.ButtonInput_callback;
    set(obj.ButtonInput, 'callback', cbF);
    cbF = @controler.ButtonOutput_callback;
    set(obj.ButtonOutput, 'callback', cbF);
    cbF = @controler.ButtonDel_callback;
    set(obj.ButtonDel, 'callback', cbF);
    cbF = @controler.buttonInfo_callback;
    set(obj.buttonInfo, 'callback', cbF);
    cbF = @controler.buttonInvert_callback;
    set(obj.buttonInvert, 'callback', cbF);
    cbF = @controler.buttonRun2_callback;
    set(obj.buttonRun2, 'callback', cbF);
    cbF = @controler.ButtonPrj_callback;
    set(obj.ButtonPrj, 'callback', cbF);
    cbF = @controler.pushCoor_callback;
    set(obj.pushCoor, 'callback', cbF);
    cbF = @controler.buttonThumbnail_callback;
    set(obj.buttonThumbnail, 'callback', cbF);
    cbF = @controler.CropInfoBox_callback;
    set(obj.CropInfoBox, 'callback', cbF);
end