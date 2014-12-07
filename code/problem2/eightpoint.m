function F = eightpoint(points1,points2)
%% Computes fundamental matrix from homogeneous coordinates
%
%   INPUTS
%     points1     3x8 eight points from left image in homogenuous coordinates
%     points2     3x8 eigth points from right image in homogenuous coordinates
%
%   OUTPUTS
%       F          3x3 fundamental matrix
%%


F =


% format check
assert(size(points1, 1) == 3 && size(points2, 1) == 3 && ...
       size(points1, 2) == 8 && size(points2, 2) == 8, ...
    'points1 and points2 should be 3x8 matrices each.');
assert(all(size(F) == [3 3]));


