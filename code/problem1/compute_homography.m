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

%% Compute homogeneous coordinates
a = ones([1 length(points1(:,1))]);
hpoints1 = cat(1, points1', a);
hpoints2 = cat(1, points2', a);

% Conditionnig 
[U1,T1] = condition(hpoints1);
[U2,T2] = condition(hpoints2);

% TODO

H = 

% format check
assert(all(size(H) == [3 3]));
