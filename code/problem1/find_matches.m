function pairs = find_matches(keypoints1,keypoints2,D)
%%
% Find one-to-one mappings between keypoints of left/right image by means of
% the distance matrix. The number of correspondences should be chosen
% depending on the number of keypoints: As a reference for one-to-one mappings
% we take the image that has a smaller number of keypoints.
%
%   INPUTS
%     keypoints1    keypoints of left image
%     keypoints2    keypoints of right image
%     D             pairwise distance matrix
%
%   OUTPUTS
%     pairs         Mx4 correspondences (putative matching pairs)
%%
%%

pairs =

% format check
assert(isfloat(pairs) && size(pairs,2) == 4);
