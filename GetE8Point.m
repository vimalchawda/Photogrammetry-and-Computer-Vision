function [E] = GetE8Point(pointsImg1, pointsImg2, K)
% Estimates the essential matrix based on the fundamental matrix. Uses the
% "EightPointAlgo" function!
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!)
% K: Calibration matrix
% E: Essential matrix

%----------------------------------
%------------- Task 3  ------------
%----------------------------------

% TODO: Add your code here
pointsImg1_n_p = inv(K) * pointsImg1;
pointsImg2_n_pp = inv(K) * pointsImg2;
E_p = EightPointAlgo(pointsImg1_n_p,pointsImg2_n_pp);

[U,S,V] = svd(E_p);
sigma = (S(1,1) + S(2,2))/2;
S(1,1) = sigma;
S(2,2) = sigma;
S(3,3) = 0;
E = U * S * V';
end