
% If not yet implemented you will have to implement function condition
% of problem1. This will make you have the function available for this problem..
addpath(genpath('../problem1'));
addpath(genpath('../../data'));


% Load the images and data:
im1 = im2double(imread('a3p2a.png'));
im2 = im2double(imread('a3p2b.png'));
load('points.mat'); % gives you points1 and points2 variables

% Display the correspondences:
figure,
imshow(im1)
hold on 
plot(points1(:,1),points1(:,2), 'yx')
hold off

figure,
imshow(im2)
hold on 
plot(points2(:,1),points2(:,2) ,'yx')
hold off

%% Compute homogeneous coordinates
siz = size(points1);
a = ones([siz(1) 1]);
hpoints1 = cat(2, points1, a)
hpoints2 = cat(2, points2, a)

% Compute the fundamental matrix using 'eightpoint':
%% Compute the mean
condition(hpoints1)

% Draw epipolar lines using 'show_epipolar':


% Check the epipolar constraints by computing the reprojection error:







