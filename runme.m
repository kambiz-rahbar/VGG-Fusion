clc
clear
close all

net = vgg19();

img1 = imread('dataset/Power_Line_Database (Infrared-IR and Visible Light-VL)/Visible Light (VL)/TV_VL_0001.bmp');
img2 = imread('dataset/Power_Line_Database (Infrared-IR and Visible Light-VL)/Infrared (IR)/TV_IR_0001.bmp');
if size(img1,3)>1
    img1 = rgb2gray(img1);
end
if size(img2,3)>1
    img2 = rgb2gray(img2);
end
IMG = {double(img1), double(img2)};

%sel_layer = {'conv1_1','conv1_2','conv2_1','conv3_1','conv4_1'}; % for vgg16
sel_layer = {'conv1_1','conv1_2','conv2_1','conv2_2','conv3_1','conv3_2','conv3_3','conv3_4','conv4_1','conv4_2','conv4_3','conv4_4','conv5_1','conv5_1','conv5_2','conv5_3','conv5_4'}; % for vgg19
levelmap1 = calc_levelmap(net, sel_layer, img1);
levelmap2 = calc_levelmap(net, sel_layer, img2);

LMAP = {levelmap1, levelmap2};
WMAP = calc_weightmap(LMAP);
fusedimg = calc_fusedimg(IMG, WMAP);

figure(1);
subplot(1,3,1); imshow(img1,[]); title('visable img');
subplot(1,3,2); imshow(img2,[]); title('IR image');
subplot(1,3,3); imshow(fusedimg,[]); title('fused image');


