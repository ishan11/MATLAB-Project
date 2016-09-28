% MATLAB Project: Statistics MATLAB Project
% File: start.m
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
% Start function that asks the user for name, fileName, and outputFile name
%


function [ userName,fileName, outputFile ] = start()
clc;
try
    userName = input('Please enter username:', 's');
    
    fileName = input('Please enter file name with extension .txt: ', 's');
    while(exist(fileName,'file') ~= 2) %Checking to see if the file exists
        clc;
        warning('File does not exist. Please enter another file name');
        fileName = input('Please enter file name with extension .txt: ', 's');
    end
    
    outputFile = input('Please enter the output file name with extension .txt: ', 's');  
    outputFileSize = length(outputFile);
    while(exist(outputFile,'file') == 2 || strcmp(outputFile((outputFileSize-3):outputFileSize),'.txt') == 0) %Checking to see if the file exists
        clc;
        warning('Incorrect File Entered. Please enter a new file name')
        outputFile = input('Please enter the output file name with extension .txt: ', 's');
        outputFileSize = length(outputFile);
    end
    
    oFile = fopen(outputFile, 'a+t'); %Opening file and putting name and date to start
    fprintf(oFile,'File Name: %s\t\t Name: %s\t\t Date: %s\n',outputFile,userName,date);
catch
    warning('Incorrect values have been entered')
end
end





