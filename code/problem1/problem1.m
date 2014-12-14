
% Makes given functions and data available through Matlab path
addpath(genpath('../common'));
addpath(genpath('../../data'));

% mask parameter
boundary = 10;           % width of boundary

% Keypoint detection parameters
harris_threshold = 1e-7; % Harris threshold for keypoint detection
sigma = 1.4;             % standard deviation
fsize = 15;              % filter size

% RANSAC Parameters
ransac_threshold = 50;  % inlier threshold
p = 0.5;                % probability that any given correspondence is valid
k = 4;                  % number of samples drawn per iteration
z = 0.99;               % total probability of success after all iterations

%===================================================================

% Load the images
im1 = im2double(imread('a3p1a.png'));
im2 = im2double(imread('a3p1b.png'));

% Make masks for left/right half of images using 'make_masks':
% INSERT CODE HERE
[height,width] = size(im1);
[im1mask,im2mask] = make_masks(height,width,boundary);
ind1 = find(im1mask);
[valid1y, valid1x] = im1mask(ind1);
ind2 = find(im2mask);
[valid2y, valid2x] = im2mask(ind2);

% display the valid points in both images
figure,
title('image 1 : valid points'),
imshow(im1)
hold on 
plot(valid1x, valid1y,'yx')
hold off

figure,
title('image 2 : valid points'),
imshow(im2)
hold on 
plot(valid2x, valid2y,'yx')
hold off

% Keypoint detection using 'detect_keypoints':
% INSERT CODE HERE
%{
im1keypoints = detect_keypoints(im1,im1mask,sigma,fsize,harris_threshold);
im2keypoints = detect_keypoints(im2,im2mask,sigma,fsize,harris_threshold);


%===================================================================

% Extract SIFT features for keypoints using 'sift':
% INSERT CODE HERE
siftFeat1 = sift(im1keypoints, rgb2gray(im1), sigma);
siftFeat2 = sift(im2keypoints, rgb2gray(im2), sigma);

% Compute (squared) Euclidean distance matrix using 'euclidean_square_dist':
D = euclidean_square_dist(siftFeat1,siftFeat2);
% 2 BONUS POINTS: compute distance matrix with 'chi_square_dist' instead
% INSERT CODE HERE

% Find putative matching pairs using 'find_matches':
% INSERT CODE HERE
pairs = find_matches(im1keypoints,im2keypoints,D);

% Display putative matching pairs using 'show_matches':
% INSERT CODE HERE
figure,
imshow(im1)
hold on 
plot(pairs(:,1),points1(:,2), 'yx')
hold off

figure,
imshow(im2)
hold on 
plot(points2(:,3),points2(:,4) ,'yx')
hold off
%}
%===================================================================

% Estimate number of iterations using 'compute_ransac_iterations':
% INSERT CODE HERE

% apply RANSAC algorithm using 'ransac':
% INSERT CODE HERE

% Show 4 best matching pairs using 'show_matches':
% INSERT CODE HERE

% Show all inlier matches for these pairs using 'show_matches'
% INSERT CODE HERE

%===================================================================

% Image stitching: You can use the given homography for doing the stitch
load('H.mat'); % overwrites variable 'H'

% apply image stitching using 'show_stich'
% INSERT CODE HERE
