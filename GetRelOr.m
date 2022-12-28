function [X0,R] = GetRelOr(X01,X02,R21,R22,K1,K2,x1,x2)
% Determines the solution where the object point is in front of both image
% planes out of the 4 possible solutions.
% X01: First projection centre
% X02: Second projection centre
% R21: First rotation matrix
% R22: Second rotation matrix
% K1: First calibration matrix
% K2: Second calibration matrix
% x1: Image coordinates within first image
% x2: Image coordinates within second image
% X0: Projection centre fulfilling the condition explained above
% R: Rotation matrix fulfilling the condition explained above

% correct Rotation matrix
if det(R21) == -1
    R21 = -1*R21;
end
if det(R22) == -1
    R22 = -1*R22;
end

% dummies
R1 = R21;
R2 = R22;

%% check whether the point is at the same side of the image

% first term
x1norm = K1\x1;
x2norm = K2\x2;
r11 = Axiator(X01) * x1norm;
r12 = Axiator(X02) * x1norm;

% second term
r21 = Axiator(X01) * R21 * x2norm;
r22 = Axiator(X01) * R22 * x2norm;
r23 = Axiator(X02) * R21 * x2norm;
r24 = Axiator(X02) * R22 * x2norm;

% one solution for X01
if sign(r11) == sign(r21)
    R1 = R21;
else
    R1 = R22;
end

% one solution for X02
if sign(r12) == sign(r23)
    R2 = R21;
else
    R2 = R22;
end

%% check whether the point is in front of both images

% construct normal equation for first solution
A = [x1norm, -R1 * x2norm];
N = A'*A;

% determine my1
my1 = N\(A'*X01);

% construct normal equation for second solution
A = [x1norm, -R2 * x2norm];
N = A'*A;

% determine my2
my2 = N\(A'*X02);

% get final X0 and R
if sign(my1(1)) > 0
    X0 = X01;
    R = R1;
else
    X0 = X02;
    R = R2;
end