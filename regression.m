% MATLAB Project: Statistics MATLAB Project
% File: regression.m
% Date:    20 April 2016
% By:      Ishan Vasandani
%          ishan11
% Section: 202
% Team:    2
%
% ELECTRONIC SIGNATURE
% Ishan Vasandani
%
% The electronic signature above indicates the script
% submitted for evaluation is my individual work, and I 
% have a general understanding of all aspects of its
% development and execution.
%
% Creates a regression
% Asks the user what degree regression is desired and then creates proper
% regression


function [] = regression(data, twoSet, outputFileName)
clc;

try
    if(twoSet == 1) %Ensuring that the data is two columed
        n = input('What degree regression do you want?');
        
        clf;
        x = data(:,1);
        y = data(:,2);
        
        if(length(x) == length(y)) %Checking to see if the lenghts are the same
            scatter(x,y)
            hold on
            
            p1 = polyfit(x,y,n);
            
            slope = p1(1);
            intercept = p1(2);
            fprintf('Slope is %.3f, and the intercept is %.3f', slope, intercept);
            outputFile = fopen(outputFileName, 'a+t');
            fprintf(outputFile,'\nSlope is %.3f, and the intercept is %.3f', slope, intercept);
            
            yfit = polyval(p1,x);
            plot(x,yfit);
        else
            warning('Vectors are not equal. Cannot complete regression');
        end
    else
        warning('Cannot Perform Operation')
    end
catch
    warning('Data invalid. Cannot create Regression Plots');
end

