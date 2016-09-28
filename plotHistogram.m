% MATLAB Project: Statistics MATLAB Project
% File: plotHistogram.m
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
% Makes Histogram Plot
% Parameter of the data that will make the histogram

function [] = plotHistogram(data)

try
    clf;
    histogram(data(:,1))
    xlabel('Bin');
    ylabel('Frequency');
    title('Histogram');
    
catch
    warning('Data invalid. Cannot create Hisotgram')
end
end


