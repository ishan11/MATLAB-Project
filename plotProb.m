% MATLAB Project: Statistics MATLAB Project
% File: plotProb.m
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
% Creates NormPlot
% takes in the data that is being evaluated and creates a probplot using
% normplot function
%



function [] = plotProb(data)

try
    normplot(data(:,1));
    
catch
    warning('Data invalid. Cannot create Probability Plots')
end
end

