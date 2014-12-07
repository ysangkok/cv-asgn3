addpath(genpath('../../data'));

% load the frames
im1 = im2double(imread('frame09.png'));
im2 = im2double(imread('frame10.png'));

% smoothing parameters
smooth_sigma = 2; % standard deviation for smoothing
smooth_fsize = 25; % filter size

% coefficients parameters
coeff_sigma = 2;
coeff_fsize = 11;

% parameters for Harris keypoint detection
harris_sigma = 1;
harris_fsize = 15;
harris_threshold = 1e-7;


% Presmooth image using 'presmooth':


% first-order derivatives of smoothed images using 'compute-derivatives':


% compute coefficients using 'compute_coefficients':


% Detect interest points using 'detect_interestpoints':


% Compute optical flow for interest points using 'compute_flow':


% display optical flow on top of the image using 'show_flow':

