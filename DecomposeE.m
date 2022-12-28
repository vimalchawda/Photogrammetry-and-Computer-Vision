function [X0, R] = DecomposeE(pointsImg1, pointsImg2, K, E)
% Decompose the essential matrix E in order to estimate the relative
% orientation.
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!) 
% K: Calibration matrix
% E: Essential matrix
% X0: Projection center corresponding to second image
% X0: Rotation matrix corresponding to second image

%----------------------------------
%------------ Task 7  -------------
%----------------------------------

% TODO: Add your code here
[U,S,V] = svd(E);
X01 = V(:,3);
X02 = -V(:,3);

W = [0 -1 0;1 0 0;0 0 1];
R1 = V * W * U';
R2 = V * W' * U';

id = unidrnd(1154);
[X0,R] = GetRelOr(X01,X02,R1,R2,K,K,pointsImg1(:,id),pointsImg2(:,id));

% Hint: Use GetRelOr function here

end