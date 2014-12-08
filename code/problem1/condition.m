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

normsXi = [];
for i=1:length(points(1,:))
    normsXi(i) = norm(points(:,i));
end
s = 0.5 * max(normsXi);

t = mean(points');

T = [1/s 0 -t(1)/s;
     0 1/s -t(2)/s;
     0 0 1]
size(T)
size(points)

U = T * points ;
 
% Verification
meanU = mean(U');
espilon = 1e-10;
assert(meanU(1) < espilon && meanU(2) < espilon, ...
     'Conditionned matrix should have mean of [0, 0].');
assert(isfloat(U) && min(U(:)) >= -1 && max(U(:)) <= 1, ...
     'The values of U should be floating point numbers between -1 and 1.');
