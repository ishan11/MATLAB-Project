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
% Ask the user for either a X or Z value and outputs the probability of
% that fucntion
% 2 parameters - the data set, outputFileName


function [] = findXZ(data, outputFileName)

clc;

%Ask the user if the data is normally distributed
normalTest = menu('Is the data normally distributed?','Yes', 'No');


if(normalTest == 1)
    
        %Writing to the file that the data is normally distrivuted
        outputFile = fopen(outputFileName,'a+');
        fprintf(outputFile, '\nThe data is normally distributed');
        
        choice = menu('Do you know the Z or X value', 'Z','X');
        
        %Asking for the wheter Z or X values is known
        if(choice == 1)
            Z = input('Please Enter Z value desired: ');
            
            prob = normcdf(Z,0,1);
            fprintf('\nThe probability of %.3f is %.2f', Z, prob);
            fprintf(outputFile, '\nThe probability of %.3f is %.2f', Z, prob);
        else
            x = input('Please enter X value desired: ');
            
            %Accounting for the size of the sample
            if(length(data(:,1))<30)
                dataStd = std(data(:,1));
            else
                dataStd = std(data(:,1),1);
            end
            
            dataMean = mean(data(:,1));
            
            prob = normcdf(x,dataMean,dataStd);
            fprintf('\nThe probability of %.3f is %.2f',x,prob)
            fprintf(outputFile, '\nThe probability of %.3f is %.2f',x,prob);
        end    
else
    warning('Cannot Perform Desired Operation. Data has to be normally distriubted');
end
end


