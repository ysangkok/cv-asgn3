
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
%{
[valid1y, valid1x] = find(im1mask);
[valid2y, valid2x] = find(im2mask);%im2mask(ind2);

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
%}

% Keypoint detection using 'detect_keypoints':
% INSERT CODE HERE

im1keypoints = detect_keypoints(im1,im1mask,sigma,fsize,harris_threshold);
im2keypoints = detect_keypoints(im2,im2mask,sigma,fsize,harris_threshold);
%{
% display the keys points in both images
figure,
title('image 1 : key points'),
imshow(im1)
hold on 
plot(im1keypoints(:,1), im1keypoints(:,2),'rx')
hold off

figure,
title('image 2 : valid points'),
imshow(im2)
hold on 
plot(im2keypoints(:,1), im2keypoints(:,2),'rx')
hold off
%}

%===================================================================

% Extract SIFT features for keypoints using 'sift':
% INSERT CODE HERE
siftFeat1 = sift(im1keypoints, im1, sigma);
siftFeat2 = sift(im2keypoints, im2, sigma);

% Compute (squared) Euclidean distance matrix using 'euclidean_square_dist':
D = euclidean_square_dist(siftFeat1,siftFeat2);
% 2 BONUS POINTS: compute distance matrix with 'chi_square_dist' instead
% INSERT CODE HERE

% Find putative matching pairs using 'find_matches':
% INSERT CODE HERE

pairs = find_matches(im1keypoints,im2keypoints,D);

% Display putative matching pairs using 'show_matches':
% INSERT CODE HERE
show_matches(im1,im2,pairs);
%{
figure,
imshow(im1)
hold on 
plot(pairs(2,1),pairs(2,2), 'yx')
hold off

figure,
imshow(im2)
hold on 
plot(pairs(2,3),pairs(2,4) ,'yx')

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
