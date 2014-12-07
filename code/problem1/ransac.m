function [best_inliers,best_pairs,best_H] = ransac(pairs,threshold,niterations)
%%
% RANSAC algorithm.
%
% INPUTS:
%   pairs           Mx4 coordinates of matching correspondences,
%                   where M is the number of overall one-to-one mappings.
%   threshold       RANSAC inlier threshold
%   niterations     number of iterations to run
%
% OUTPUTS:
%   best_inliers    vector with the indices of all inliers for the homography
%                   that has been estimated using the 4 best matching pairs,
%                   where N is the number of inliers.
%   best_pairs      4x4 best matching pairs with format [x1 y1 x1 x2]
%   best_h          best homography estimated
%%

best_inliers =
best_pairs =
best_h =

% format check
assert(isfloat(best_inliers) && isvector(best_inliers));
assert(isfloat(best_pairs) && all(size(best_pairs) == [4 4]));
assert(isfloat(best_H) && all(size(best_H) == [3 3]));
