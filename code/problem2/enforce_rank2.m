function A = enforce_rank2(A)
%% Enforces rank 2 on a given 3x3 matrix
%
%   INPUTS
%     A   given 3x3 matrix (possibly) of rank 3
%
%   OUTPUTS
%     A   3x3 matrix with rank 2.
%%

A =

% format check
assert(all(size(A) == [3 3]));
