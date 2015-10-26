function UIbuild(obj)
    obj.uipanelIO = uipanel(obj.hfig, 'units', 'pixels', 'pos', [1, 1, 400, 441],'backgroundcolor', [1 1 1]);
    obj.text1 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','X','pos',[50, 200, 50, 20], 'backgroundcolor', [1 1 1]);
    obj.editX = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 200, 200, 20]);
    obj.text2 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','Y','pos',[50, 170, 50, 20], 'backgroundcolor', [1 1 1]);
    obj.editY = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 170, 200, 20]);
    obj.text3 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','H','pos',[50, 140, 50, 20], 'backgroundcolor', [1 1 1]);
    obj.editH = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 140, 200, 20]);
    obj.text4 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','W','pos',[50, 110, 50, 20], 'backgroundcolor', [1 1 1]);
    obj.editW = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 110, 200, 20]);
    obj.text7 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','图片裁剪序号','pos',[40, 80, 60, 20], 'backgroundcolor', [1 1 1]);
    obj.editZ1 = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 80, 90, 20]);
    obj.editZ2 = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[220, 80, 90, 20]);
    obj.Zend = uicontrol(obj.uipanelIO,'style', 'text', 'String','-','pos',[200, 80, 20, 20], 'backgroundcolor', [1 1 1]);
    obj.text13 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','备注信息：','pos',[40, 50, 60, 20], 'backgroundcolor', [1 1 1], 'foregroundcolor', [1 0 0]);
    obj.edit13 = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 50, 200, 20]);
    obj.textTest = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Left','String','在备注中填写裁剪区域信息，例：海马CA1区','pos',[110, 20, 200, 20], 'backgroundcolor', [1 1 1]);
    obj.text12 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','后缀','pos',[50, 240, 50, 20], 'backgroundcolor', [1 1 1]);
    obj.Suffix = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 240, 200, 20]);
    obj.text11 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','前缀','pos',[50, 270, 50, 20], 'backgroundcolor', [1 1 1]);
    obj.Prefix = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 270, 200, 20]);
    obj.text12 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','输入文件名','pos',[50, 300, 50, 20], 'backgroundcolor', [1 1 1]);
    obj.Filename = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 300, 200, 20]);
    obj.text6 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','输出路径','pos',[30, 340, 70, 20], 'backgroundcolor', [1 1 1]);
    obj.editOutput = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 340, 200, 20]);
    obj.ButtonOutput = uicontrol(obj.uipanelIO,'style', 'pushbutton','String','浏览','pos',[315, 340, 45, 20]);
    obj.text5 = uicontrol(obj.uipanelIO,'style', 'text', 'horizontalalignment', 'Right','String','读取第一张图片','pos',[30, 370, 70, 20], 'backgroundcolor', [1 1 1]);
    obj.editInput = uicontrol(obj.uipanelIO,'style', 'edit', 'pos',[110, 370, 200, 20]);
    obj.ButtonInput = uicontrol(obj.uipanelIO,'style', 'pushbutton','String','浏览','pos',[315, 370, 45, 20]);
            
    obj.uipanelMessage = uipanel(obj.hfig, 'units', 'pixels', 'pos', [401, 201, 400, 241],'backgroundcolor', [1 1 1]);
    obj.CropInfoBox = uicontrol(obj.uipanelMessage,'style', 'listbox', 'pos',[1, 1, 395, 237], 'backgroundcolor', [1 1 1]);
            
    obj.uipanelControl = uipanel(obj.hfig, 'units', 'pixels', 'pos', [401, 1, 400, 200],'backgroundcolor', [1 1 1]);
    obj.ButtonAdd = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','添加','pos',[5, 175, 60, 20]);
    obj.ButtonDel = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','删除','pos',[70, 175, 60, 20]);
    obj.buttonInvert = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','反色','pos',[135, 175, 60, 20]);
    obj.ButtonPrj = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','投影图制作','pos',[200, 175, 60, 20]);
    obj.buttonThumbnail = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','缩略图制作','pos',[265, 175, 60, 20]);
    obj.buttonInfo = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','说明','pos',[330, 175, 60, 20]);
    obj.pushCoor = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','坐标获取','pos',[5, 150, 60, 20]);
    obj.ButtonRun = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','裁剪','pos',[70, 150, 60, 20]);
    obj.buttonRun2 = uicontrol(obj.uipanelControl,'style', 'pushbutton','String','裁剪及反色','pos',[135, 150, 60, 20]);