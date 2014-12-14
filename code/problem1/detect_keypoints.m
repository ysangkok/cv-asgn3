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

valid = find(mask);
imvalid = im(valid);
size(im); size(imvalid);
img = rgb2gray(im(invalid));
[mask, harris] = harris(img, sigma, fsize, threshold);
[py, px] = find(mask == 1);
keyspoints = [px py];
size(keypoints)

% format check
assert(isfloat(keypoints) && size(keypoints,2) == 2);
