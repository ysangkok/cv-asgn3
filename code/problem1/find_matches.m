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
pairs = [];
M1 = size(keypoints1, 1)
M2 = size(keypoints2, 1)
nbPairs = 0;
if (M1 > M2)
  % reference = im1 
  for i=1:M1
    nbPairs = nbPairs + 1;
    j = min(D(i,:));
    pairs(nbPairs,:) = [keyspoints1(i,1) keyspoints1(i,2) keyspoints2(j,1), keyspoints2(j,2)];
  end
else
  % reference = im2
  for j=1:M2
    nbPairs = nbPairs + 1;
    i = min(D(:,j));
    pairs(nbPairs,:) = [keyspoints1(i,1) keyspoints1(i,2) keyspoints2(j,1), keyspoints2(j,2)];
  end
end

% format check
assert(isfloat(pairs) && size(pairs,2) == 4);
assert( size(pairs, 1) == min([size(keypoints1, 1)) size(keypoints2, 1)]) );
