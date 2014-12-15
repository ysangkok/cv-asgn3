function [sample_points1,sample_points2] = pick_samples(keypoints1,keypoints2,k)
%% Randomly picks k points from given keypoints
%
%   INPUTS
%       keypoints1          Mx2 matrix of keypoints from left image
%       keypoints2          Mx2 matrix of keypoints from right image
%       k                   number of points to pick
%
%   OUTPUTS
%       sample_points1      4x2 samples from the first image
%       sample_points2      4x2 samples from the second image
%%

sample_points1 = datasample(keypoints1, k, 'Replace',false);
sample_points2 = datasample(keypoints2, k, 'Replace',false);

% format check
assert(all(size(sample_points1) == [k 2]));
assert(all(size(sample_points2) == [k 2]));
