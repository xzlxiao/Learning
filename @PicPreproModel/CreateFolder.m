function [] = CreateFolder(obj, dir)
if ischar(dir) == 0
    error('��ַ���������ַ���');
end
if exist(dir) == 0
mkdir(dir);
end