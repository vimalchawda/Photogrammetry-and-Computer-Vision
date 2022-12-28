function [ score ] = DetermineConsensusSetScore( pointsImg1, pointsImg2, E, K )
% Determine the quality of the essential matrix coressponding to the point pairs.
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!) 
% Note: pointsImg1 and pointsImg2 have to be equally sorted, so that the
% points corresponding to the same pair have the same index.
% E: Essential matrix
% K: Calibration matrix
% score: Percentage of points contained in the consensus set.

%----------------------------------
%------------- Task 5  ------------
%----------------------------------

% TODO: Add your code here
F = inv(K)' * E * inv(K);
threshold = 3;

I_pp = F * pointsImg1;
d = I_pp' * pointsImg2 ./ sqrt(I_pp(1,:).^2 + I_pp(2,:).^2); 

n = size(d,2);
count = 0;
for i = 1:n
    if d(1,i)<threshold
        count = count+1;
    end
end

score = count/n;

end