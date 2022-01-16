function [levelmap] = calc_levelmap(net, sel_layer, img)
imgSize = net.Layers(1).InputSize;

if size(img,3)==1
    img = repmat(img,[1,1,3]);
end
img = imresize(img, imgSize(1:2));

misregistration_mask = ones(3)/9;
levelmap = zeros([imgSize(1:2) length(sel_layer)]);
for k = 1:length(sel_layer)
    featuremap = activations(net, img, sel_layer{k});
    featuremap = imresize(featuremap, imgSize(1:2));

    lmap = zeros(imgSize(1:2));
    for r=1:size(featuremap,1)
        for c=1:size(featuremap,2)
            fmap = featuremap(r,c,:);
            lmap(r,c) = norm(fmap(:),1);
        end
    end

    lmap = conv2(lmap,misregistration_mask,'same');

    levelmap(:,:,k) = lmap;
end
end