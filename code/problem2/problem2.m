
% If not yet implemented you will have to implement function condition
% of problem1. This will make you have the function available for this problem..
addpath(genpath('../problem1'));
addpath(genpath('../../data'));


% Load the images and data:
im1 = im2double(imread('a3p2a.png'));
im2 = im2double(imread('a3p2b.png'));
load('points.mat'); % gives you points1 and points2 variables

% Display the correspondences:


% Compute the fundamental matrix using 'eightpoint':


% Draw epipolar lines using 'show_epipolar':


% Check the epipolar constraints by computing the reprojection error:







