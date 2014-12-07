function H = compute_homography(points1,points2)
%% Estimates the homography from given correspondences
%
%   INPUTS
%     points1     4 points from first image
%     points2     4 points from second image
%
%   OUTPUTS
%     H           estimated homography
%

H =

% format check
assert(all(size(H) == [3 3]));
