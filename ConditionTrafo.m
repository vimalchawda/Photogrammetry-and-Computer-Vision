function [T] = ConditionTrafo(points)
% Get the conditioning transformation based on the sepcified points.
% points: Matrix containing homogeneous points. (One point per column!)
% T: Transformation matrix.

%----------------------------------
%------------- Task 1  ------------
%----------------------------------

% TODO: Add your code here
center = mean(points,2);
xc = center(1,1);
yc = center(2,1);
average= mean(points,2);  %we have to used mean not variance %resubmission mistakes %imp for exam
s_2d = sqrt(2/(average(1,1)+average(2,1)));



T = diag([s_2d s_2d 1]);
T(1,3) = -s_2d * xc;
T(2,3) = -s_2d * yc;

end