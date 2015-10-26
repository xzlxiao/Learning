function A = img_prj(obj, A, B, k)
% �������ܣ�ͼƬͶӰ
% �޸�ʱ�䣺2015-10-4
% ���ߣ�Ф����
% function A = img_prj( A, B, k)
% ������
% k: 0, minͶӰ�� 1, maxͶӰ
if isequal(size(A), size(B)) == 0
    % ��¼������Ϣ
    error_recode = fopen('missprj_info.txt', 'at');
    err_inf = '�����ͼƬ��С��ͬ';
    fprintf(error_recode, '%s \n', err_inf);
    disp(err_inf);
    return;
end
if k == 0       % minͶӰ
    if A == B
        return;
    else
        [c, r] = size(A);
        for i = 1 : c
            for j = 1 : r
                if A(i, j) > B(i, j)
                    A(i, j) = B(i, j);
                end
            end
        end
        return
    end
elseif k == 1       % maxͶӰ
    if A == B
        return;
    else
        [c, r] = size(A);
        for i = 1 : c
            for j = 1 : r
                if A(i, j) < B(i, j)
                    A(i, j) = B(i, j);
                end
            end
        end
        return
    end
else
    error('��������ȷ�Ĳ���')
end

