% MATLAB Project: Statistics MATLAB Project
% File: findProb.m
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
%  Asks the user for the probability and then finds the correspodning X or
%  Z value
%  2 Parameters - the data set, outputFileName



function [] = findProb(data, outputFileName)

clc;
normalTest = menu('Is the data normally distributed?','Yes', 'No');

try
    if(normalTest == 1)
        outputFile = fopen(outputFileName,'a+t');
        fprintf(outputFile, '\nThe data is normally distributed');
        
        choice = menu('Is this related to Z or X', 'Z','X');
        if(choice == 1)
            prob = input('Please enter probability value desired: ');
            while(prob<0 || prob>1)
                warning('Invalid input please try again')
                prob = input('Please enter probability value desired: ');
            end
            Z = norminv(prob,0,1);
            fprintf('The Z of %.3f is %.2f', prob, Z);
            fprintf(outputFile, '\nThe Z of %.3f is %.2f', prob, Z);
        else
            prob = input('Please enter probability value desired: ');
            while(prob<0 || prob>1)
                warning('Invalid input please try again')
                prob = input('Please enter probability value desired: ');
            end
            
            %Accounting for Sample Size
            if(length(data(:,1))<30)
                dataStd = std(data(:,1));
            else
                dataStd = std(data(:,1),1);
            end
            
            dataMean = mean(data(:,1));
            x = norminv(prob,dataMean,dataStd);
            fprintf('The X of %.3f is %.2f',prob, x)
            fprintf(outputFile, '\nThe X of %.3f is %.2f',prob, x);
        end
        
    else
        warning('Cannot Perform Desired Operation. Data has to be normally distriubted');
    end
catch
    warning('Cannot Perform Desired Operation. Data has to be normally distriubted');
end

end

