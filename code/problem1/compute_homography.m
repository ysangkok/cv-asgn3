function H = compute_homography(points1,points2)
%% Estimates the homography from given correspondences
%
%   INPUTS
%     points1     4 points from first image
%     points2     4 points from second image
%
%   OUTPUTS
%     H           estimated homography
%

%% Compute homogeneous coordinates
a = ones([1 length(points1(:,1))]);
hpoints1 = cat(1, points1', a);
hpoints2 = cat(1, points2', a);

% Conditionnig 
[U1,T1] = condition(hpoints1); 
[U2,T2] = condition(hpoints2);

A = [  0        0         0    U1(1,1) U1(2,1) 1 -U1(1,1)*U2(2,1) -U1(2,1)*U2(2,1) -U2(2,1);
      -U1(1,1) -U1(2,1)   1    0       0       0  U1(1,1)*U2(1,1)  U1(2,1)*U2(1,1)  U2(1,1); 

       0       0          0    U1(1,1) U1(2,2) 1 -U1(1,1)*U2(2,2) -U1(2,2)*U2(2,2) -U2(2,2);
      -U1(1,1) -U1(2,2)   1    0       0       0  U1(1,2)*U2(1,2)  U1(2,2)*U2(1,2)  U2(1,2); 

       0        0         0    U1(1,3) U1(2,3) 1 -U1(1,3)*U2(2,3) -U1(2,3)*U2(2,3) -U2(2,3);
      -U1(1,3) -U1(2,3)   1    0       0       0  U1(1,3)*U2(1,3)  U1(2,3)*U2(1,3)  U2(1);

        0       0         0    U1(1,4) U1(2,4) 1 -U1(1,4)*U2(2,4) -U1(2,4)*U2(2,4) -U2(2,4);
      -U1(1,4) -U1(2,4)   1    0       0       0  U1(1,4)*U2(1,4)  U1(2,4)*U2(1,4)  U2(1,4) 
	 ];
[U,S,V] = svd(A);
hbar = V(:, size(V,2)) % last column
Hbar = reshape(hbar, [3 3]);
H = inv(T2)*Hbar*T1;

% format check
assert(all(size(H) == [3 3]));
