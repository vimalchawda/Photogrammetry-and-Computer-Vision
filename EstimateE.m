function [ E ] = EstimateE( pointsImg1, pointsImg2, K )
% Implementation of the RANSAC algorithm, which should determine a  
% essential matrix robustly.
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!) 
% Note: pointsImg1 and pointsImg2 have to be equally sorted, so that the
% points corresponding to the same pair have the same index.
% K: Calibration matrix
% E: Best estimation of the essential matrix.

%----------------------------------
%------------- Task 4  ------------
%----------------------------------

% TODO: Define number of iterations for RANSAC
w = 0.70;
S = 8.00;
P = 0.995;
Num_Iteration = ceil(log(1-P)/log(1-w^S));

%----------------------------------
%------------- Task 6  ------------
%----------------------------------

% TODO: Add your code here
E = zeros(3,3);
score = 0;

for i = 1:Num_Iteration
    Ind = randperm(1154,8);
    Points_1 = pointsImg1(:,Ind);
    points2 = pointsImg2(:,Ind);
    
    E_tmp = GetE8Point(Points_1,points2,K);
    score_tmp = DetermineConsensusSetScore(pointsImg1,pointsImg2,E_tmp,K);
    
    if score_tmp > score
        E = E_tmp;
        score = score_tmp;
    end  
end

end
