function add(obj, view)
    img_inf = obj.imgData;
    inDir = view.editInput_d;
    outDir = view.editOutput_d;
    prefix = view.Prefix_d;
    suffix = view.Suffix_d;
    filename = view.Filename_d;
    cooX = view.editX_d;
    cooY = view.editY_d;
    width = view.editW_d;
    Height = view.editH_d;
    Z1 = view.editZ1_d;
    Z2 = view.editZ2_d;
    if isempty(inDir)|| ...
            isempty(outDir)|| ...
            isempty(cooX)|| ...
            isempty(cooY)|| ...
            isempty(width)|| ...
            isempty(Height )|| ...
            isempty(Z1 )|| ...
            isempty(Z2)
        msgbox('���������·���������Լ��ü�������Ϣ');
    else
        list_tmp1 = view.CropInfoBox_str;
        appendinfo = view.edit13_str;
        [n, ~] = size(list_tmp1);
        img_inf(n+1).SrcDir = inDir;
        img_inf(n+1).DstDir = outDir;
        img_inf(n+1).prefix = prefix;
        img_inf(n+1).suffix = suffix;
        img_inf(n+1).filename = filename;
        img_inf(n+1).CropWidthFirstPointCoordinate = str2num(cooX);
        img_inf(n+1).CropHeightFirstPointCoordinate = str2num(cooY);
        img_inf(n+1).CropWidth = str2num(width);
        img_inf(n+1).CropHeight = str2num(Height);
        img_inf(n+1).Zstart = str2num(Z1);
        img_inf(n+1).Zend = str2num(Z2);
        img_inf(n+1).init = n + 1;
        img_inf(n+1).appendinfo = appendinfo;

        set(view.editX, 'string', '');
        set(view.editY, 'string', '');
        set(view.editW, 'string', '');
        set(view.editH, 'string', '');
        set(view.editZ1, 'string', '');
        set(view.editZ2, 'string', '');
    end
    obj.imgData = img_inf;
    obj.notify('imgDataChange');
end