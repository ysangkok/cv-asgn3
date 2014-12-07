function [U,T] = condition(points)
%% Returns conditioned points and conditioning matrix
%
%   INPUTS
%       points  3xN matrix of N points in homogeneous coordinates.
%
%   OUTPUTS
%       U       3xN matrix of conditioned points
%       T       3x3 conditioning matrix
%%

% Conditioning: scale and shift points to be in [-1..1]
size(points)
s = 0.5 * norm(points, 1)
tx = mean(mean(points, 1))
ty = mean(mean(points, 2))
%size(t)
T = [1/s 0 -tx/s;
    0 1/s -ty/s;
    0 0 1]
U = imfilter(points, T, 'replicate');

lastMean(U);
assert(lastMean(1) == 0 && lastMean(2) == 0, ...
    'Conditionned matrix should have mean of [0, 0].');
assert(isfloat(U) & min(U(:)) >= 0 & max(U(:)) <= 1, ...
    'The values of U should be floating point numbers between -1 and 1.');

