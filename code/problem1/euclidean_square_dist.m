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
assert(size(features1, 2) == 128, ...
    'features1 should be a Nx128 matrix.');
assert(size(features2, 2) == 128, ...
    'features2 should be a Nx128 matrix.');

for i=1:size(features1,1)
  for j=1:size(features2,1)
    diff = features2(j,:) .- features1(i,:);
    D(i,j) = sqrt(sum(diff.^2, 2));
  end
end

% format check
assert(isfloat(D) && all(size(D) == [size(features1,1) size(features2,1)]));
