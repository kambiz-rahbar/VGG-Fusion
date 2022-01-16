clc
clear
close all

net = vgg16();
% net = densenet201();
% net = googlenet();
% disp(net.Layers);
imgSize = net.Layers(1).InputSize;

img = imread('cameraman.tif');
if size(img,3)==1
    img = repmat(img,[1,1,3]);
end
img = imresize(img, imgSize(1:2));

featuremap = activations(net, img, 'conv1_1');
featuremap = imresize(featuremap, imgSize(1:2));

for k=1:6
    subplot(2,3,k); imshow(featuremap(:,:,k),[]);
end