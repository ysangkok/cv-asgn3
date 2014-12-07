function [u,v] = compute_flow(x,y,dx2,dy2,dxdy,dxdt,dydt)
% Computes optical flow at all given points
%
% INPUTS:
%   x           vector of x-coordinates of interest points
%   y           vector of y-coordinates of interest points
%   dx2         dx*dx
%   dxdy        dx*dy
%   dy2         dy*dy
%   dxdt        dx*dt
%   dydt        dy*dt
%
% OUTPUTS:
%   u           horizontal flow component at interest points
%   v           vertical flow component at interest points

u =
v =

% format check
assert(all(size(u) == size(x)));
assert(all(size(v) == size(y)));

