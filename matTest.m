mat1 = [4 2 5; 2 2 4; 6 3 4];
[gx, gy] = gradient(mat1, 0.5, 0.5);
gxx = gx./255
gyy = gy./255
% a = Neuro_imprepro({'2.jpg'});