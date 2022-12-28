function [F] = EightPointAlgo(pointsImg1, pointsImg2)
% Implementation of the 8 point algorithm, which computes the fundamental
% matrix based on 8 point pairs.
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!) 
% F: Fundamental matrix

%----------------------------------
%------------- Task 2  ------------
%----------------------------------

% TODO: Add your code here
num = size(pointsImg1,2);

T1 = ConditionTrafo(pointsImg1);
T2 = ConditionTrafo(pointsImg2);
pointsImg1_k = T1 * pointsImg1;
pointsImg2_k = T2 * pointsImg2;

A = [];
for i = 1:num
    tmp = kron(pointsImg1(:,i),pointsImg1(:,i));
    A = [A;tmp'];
end

[U,S,V] = svd(A);

if num >= 9
    f_pp = V(:,9);
else
    f_pp = V(:,8);
end
F_pp = reshape(f_pp,[3,3]);

[U1,S1,V1] = svd(F_pp);
S1(3,3) = 0;
F_p = U1 * S1 * V1';

F = T2' * F_p * T1;
end





