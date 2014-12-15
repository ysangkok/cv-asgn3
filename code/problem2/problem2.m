
% If not yet implemented you will have to implement function condition
% of problem1. This will make you have the function available for this problem..
addpath(genpath('../problem1'));
addpath(genpath('../../data'));


%% Load the images and data:
im1 = im2double(imread('a3p2a.png'));
im2 = im2double(imread('a3p2b.png'));
load('points.mat'); % gives you points1 and points2 variables

%% Display the correspondences:
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
a = ones([1 length(points1(:,1))]);
hpoints1 = cat(1, points1', a);
size(hpoints1)
hpoints2 = cat(1, points2', a);
size(hpoints2)

% Test homography
H = compute_homography(points1,points2)

%% Compute the fundamental matrix using 'eightpoint':

% Conditionnig 
condition(hpoints1)
condition(hpoints2)


%% Draw epipolar lines using 'show_epipolar':


%% Check the epipolar constraints by computing the reprojection error:







