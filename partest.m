startparpool;
tic;
parfor i = 1:10000
    for j = 1 : 10000
        n = rand(3);
    end
end
toc;
closeparpool;

tic;
for i = 1:10000
    for j = 1 : 10000
        m = rand(3);
    end
end
toc;