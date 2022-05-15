function [fusedimg] = calc_fusedimg(IMG, WMAP)

fimg = zeros([size(IMG{1}),size(WMAP{1},3)]);
for k = 1:length(WMAP)
    weightmap = WMAP{k};
    wimg = zeros(size(IMG{1}));
    for p = 1:size(weightmap,3)
        wmap = weightmap(:,:,p);
        wmap = imresize(wmap, size(IMG{1}));
        wimg(:,:,p) = IMG{k}.*wmap;
    end
    fimg = fimg + wimg;
end
fusedimg = max(fimg,[],3);
end
