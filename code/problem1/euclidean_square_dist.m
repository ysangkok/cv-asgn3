function D = euclidean_square_dist(features1,features2)
%% Computes pairwise (squared) Euclidian distances for given
% features
%
%   INPUTS
%     features1      [M1x128] sift features of left image
%     features2      [M2x128] sift features of right image
%
%   OUTPUTS
%     D              pairwise distance matrix of size M1xM2
%%

D =

% format check
assert(isfloat(D) && all(size(D) == [size(features1,1) size(features2,1)]));
