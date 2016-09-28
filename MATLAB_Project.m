% MATLAB Project: Statistics MATLAB Project
% File: MATLAB_Project.m
% Date:    20 April 2016
% By:      Ishan Vasandani
%          ishan11
% Section: 202
% Team:    2
%
% ELECTRONIC SIGNATURE
% Ishan Vasandani
%q
% The electronic signature above indicates the script
% submitted for evaluation is my individual work, and I 
% have a general understanding of all aspects of its
% development and execution.
%
% Main class of the project. Shows menu for the user to interact with and
% make calls to  functions.
%


clc; clear;

keepGoing =  true;
goOn = false;

while(keepGoing) %Continuously run the program until the user wants to leave
    choice = menu('MATLAB Project', 'Start', 'Close');  %First menu to start program
    
    if(choice == 1)
        
        try
            [userName, fileName, outputFileName] = start(); %Asking user for info about files
            file = load(fileName);
            
            if(isnumeric(file))
                twoColumn = size(file); %One or two Set of data
                if(twoColumn(2) == 2)
                    dependentColumn = menu('Does the data contain a dependent column?', 'YES', 'NO'); %Seeing if the data contains an dependent set
                    if(dependentColumn == 1)
                        file = load(fileName);
                        goOn = true;
                    else
                        file = load(fileName);
                        file = [file(:,1); file(:,2)];
                        goOn = true;
                    end
                else
                    dependentColumn = false;
                    goOn = true;
                end
            end
        catch
            warning('Incorret File. Please Try again');
        end
        
        
        while (goOn) %Continuosly run the second menu  unitl user wants to leave
            choice = menu('Please choose one', 'Statistics', 'Plot Histogram','Plot Histogram Fit','Plot Probability' ,'Regression of y on x', 'Find Probaibilty of given x or z', 'Find x or z given Probability','Clear Data');
            switch choice
                case 1
                    mystat(file,outputFileName)
                case 2
                    plotHistogram(file)
                case 3
                    plotHistogramFit(file)
                case 4
                    plotProb(file)
                case 5
                    regression(file, dependentColumn, outputFileName)
                case 6
                    findXZ(file, outputFileName)
                case 7
                    findProb(file, outputFileName)
                case 8
                    clear file fileName userName outputFileName;
                    clc;
                    goOn = false;
            end
        end
        
    elseif (choice == 2)
        keepGoing = false;
    end
end

%Cleaning up everything before closing program
fclose('all');
clear variables;
clc;

%Testing of First
