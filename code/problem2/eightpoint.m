function F = eightpoint(points1,points2)
%% Computes fundamental matrix from homogeneous coordinates
%
%   INPUTS
%     points1     3x8 eight points from left image in homogenuous coordinates
%     points2     3x8 eigth points from right image in homogenuous coordinates
%
%   OUTPUTS
%       F          3x3 fundamental matrix
%%

A = [points1(1,:)*points2(1,:)
     points1(2,:)*points2(1,:)
     points2(1,:)
     points1(1,:)*points2(2,:)
     points1(2,:)*points2(2,:)
     points2(2,:)
     points1(1,:)
     points1(2,:)
     1
     ];
 
[U_A,D_A,V_At] = svd(A);
V_At = 0;
F = U_A*D_A*V_At';
 


F = 0;


% format check
assert(size(points1, 1) == 3 && size(points2, 1) == 3 && ...
       size(points1, 2) == 8 && size(points2, 2) == 8, ...
    'points1 and points2 should be 3x8 matrices each.');
assert(all(size(F) == [3 3]));


