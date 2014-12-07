function d2 = compute_homography_distance(H,keypoints1,keypoints2)
%% computes distances for the given homography w.r.t. the given keypoints.
%
%   INPUTS
%     H             homography
%     keypoints1    Mx2 keypoints from first image
%     keypoints2    Mx2 keypoints from second image
%
%   OUTPUTS
%    d2             vector of (squared) Euclidean distances between keypoints
%%

d2 =

% format check
assert(isfloat(d2) && length(d2) == size(keypoints1,1));
