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

half = fix(width/2);
im = zeros(height, width);

im1mask = im;
im1mask(1+boundary:height-boundary, half:width-boundary) = 1; % right half of the left image outside of the boundary

im2mask = im;
im2mask(1+boundary:height-boundary,, 1+boundary:half) = 1; % left half of the right image outside of the boundary

% format check
assert(islogical(im1mask) && islogical(im2mask));
