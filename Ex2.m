clear all; close all; dbstop error;
% Main file for the second exercise.
% This script will call the other functions and should be run.

%-------------------------------------------------------------
%------ The Fundamental Matrix and the Essential Matrix ------
%-------------------------------------------------------------

% Hint: To test your implementation, just comment out all function calls
% that you have not implemented yet.

% Import Data
[pointsLeft, pointsRight, K] = ImportData();

% Estimate fundamental matrix
F = EightPointAlgo(pointsLeft, pointsRight);

% Estimate essential matrix
E = GetE8Point(pointsLeft, pointsRight, K);

% Estimate essential matrix robustly
robustE = EstimateE(pointsLeft, pointsRight, K);

% Estimate the relative orientation
[X0, R] = DecomposeE(pointsLeft, pointsRight, K, robustE);
