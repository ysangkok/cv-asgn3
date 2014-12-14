function [im1mask,im2mask] = make_masks(height,width,boundary)
%% creates masks for left and right image such that only the right half of the
%  left image and the left half of the right image are valid. Pixels within a
%  boundary are also invalid.
%
%   INPUTS
%     height      image heigth
%     width       image width
%     boundary    boundary width (these should be zero!)
%
%   OUTPUTS
%     im1mask     mask for left image
%     im2mask     mask for right image
%%

im = zeros(height, width);
im(:,:) = 1;
im1mask = im;
im1mask(:, width-boundary:width) = 0; % invalid pixels
im2mask = im;
im2mask(:, 1:boundary) = 0; % invalid pixels

% format check
assert(islogical(im1mask) && islogical(im2mask));
