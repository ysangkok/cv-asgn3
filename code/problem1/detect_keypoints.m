function keypoints = detect_keypoints(im,mask,sigma,fsize,threshold)
%% detects harris keypoints in an image
%
%   INPUTS
%     im           image
%     mask         mask where keypoints shall be detected
%     sigma        standard deviation for Harris detector
%     fsize        filter size for Harris detector
%     threshold    threshold for Harris detector
%
%   OUTPUTS
%     keypoints    Mx2 matrix with coordinates of keypoints,
%                  where M is the number of detected keypoints.
%%

[maskH, harrisF] = harris(im, sigma, fsize, threshold);
maskKey = mask .* maskH; % logical and
[py, px] = find(maskKey == 1);
keypoints = [px py];

% format check
assert(isfloat(keypoints) && size(keypoints,2) == 2);
