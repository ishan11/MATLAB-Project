% MATLAB Project: Statistics MATLAB Project
% File: mystat.m
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
% Calculate Statistics
% takes the data inputed displays the basic statistics and writes to a file




function [] = mystat(data,outputFileName)

clc;
try
    %Opening file to write values to
    outputFile = fopen(outputFileName, 'a+t');
    fprintf(outputFile,'\nStatistics\n');
    
    count = length(data(:,1));
    
    dataMean = mean(data(:,1));
    fprintf('Mean     =%15.2f\n',dataMean);
    fprintf(outputFile,'Mean     =%15.2f\n',dataMean);
    
    dataMedian = median(data(:,1));
    fprintf('Median   =%15.2f\n',dataMedian);
    fprintf(outputFile,'Median   =%15.2f\n',dataMedian);
    
    dataMode = mode(data(:,1));
    fprintf('Mode     =%15.2f\n',dataMode);
    fprintf(outputFile,'Mode     =%15.2f\n',dataMode);
    
    dataVar = var(data(:,1));
    fprintf('Var      =%15.2f\n',dataVar);
    fprintf(outputFile,'Var      =%15.2f\n',dataVar);
    
    %Using appropiate standard deviation
    if(count<30)
        dataStd = std(data(:,1));
        fprintf('Stdev.S  =%15.2f\n', dataStd);
        fprintf(outputFile,'Stdev.S  =%15.2f\n', dataStd);
    else
        dataStd = std(data(:,1),1);
        fprintf('Stdev.P  =%15.2f\n', dataStd)
        fprintf(outputFile,'Stdev.P  =%15.2f\n', dataStd);
    end
    
    dataMin = min(data(:,1));
    fprintf('Min      =%15.2f\n',dataMin);
    fprintf(outputFile,'Min      =%15.2f\n',dataMin);
    
    dataMax = max(data(:,1));
    fprintf('Max      =%15.2f\n',dataMax);
    fprintf(outputFile,'Max      =%15.2f\n',dataMax);
    
    fprintf('Count    =%15.0f\n', count);
    fprintf(outputFile,'Count    =%15.0f\n\n', count);
    
    
catch
    warning('Data invalid. Cannot create Statistics');
end


end

