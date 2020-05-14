%%%%%
%
% Course: ENCMP 100
% Assignment: 5B
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614962
%
% Acknowledgments: None
%
% Description: This program creates a graphical user interface of shapes
% and their properties, from the user inputs, areas of various shapes are
% saved to a file
%%%%%

function [] = Assign5B_1614962() % creates main function
% clear the workspace and command window
clear
clc

% initialize variables as well as two cell arrays that store user inputs
shapecounter = 0;
shparea = 0;
shape = cell([1, 5]);
shapeArea = cell([1, 5]);

while 1
    shapeList = {'Circle', 'Square', 'Ellipse', 'Triangle', 'Rectangle'}; %create a cell array of shapes to chose from
    [selection, ok] = listdlg('PromptString', 'Select the next shape: ',...
        'SelectionMode', 'single', 'OKString', 'Enter', 'CancelString', 'No more',...
        'ListString', shapeList); % make the menu to chose a shape

    % selection now holds the index of the selected shape 
    % ok is 1 if a shape was selected; otherwise, ok is 0 
    if ok == 1
        shapecounter = shapecounter + 1; % add a shape added
    end
    
    if ok == 0 % once the menu is closed, print the results
        fprintf("The number of entered objects was %d \n", shapecounter)
        
        fprintf("No.\t\tID\t\tColour\t\tArea\n")
        
        for i = 1:shapecounter
            fprintf("%d\t\t%s\t\t%s\t\t%.6f \n", i, shape{i}{1}, shape{i}{2}, shape{i}{5}) 
        end
    end
     
     if ~ok break; end
        colourList = {'red', 'yellow', 'blue', 'green', 'orange', 'violet'}; % create a cell array of colours to chose from
        [colour_selec, ok] = listdlg('PromptString', 'Select the colour of the shape: ',...
            'SelectionMode', 'single', 'OKString', 'Enter', 'CancelString', 'Cancel',...
            'ListString', colourList); % make a menu to chose the colour

        % paramters for the dimensions box
        switch selection
            case 1 % circle
                prompt = {'Enter a diameter'};
            case 2 % square
                prompt = {'Enter a side length'};
            case 3 %Ellipse
                prompt = {'Enter a major diameter', 'Enter a minor diameter'};
            case 4 %Triangle
                prompt = {'Enter the base', 'Enter the height'};
            case 5 %Rectangle
                prompt = {'Enter the length', 'Enter the width'};
            % note all of the resulting prompts are cell arrays 
        end
        
        title = 'Shape dimension dialog box';
        numlines = 1;
        defaults = {'0', '0'}; % cell array for default dimensions
        options.Resize = 'on';
        options.WindowStyle = 'normal';
        options.Interpreter = 'none';
        inputvalues = inputdlg(prompt, title, numlines, defaults, options);
        
        % create a cell array that contains the previous entered shape,
        % which then gets stored into shape which contains all the shapes,
        % while shape_temp changes after a new shape is made
        if length(prompt) == 1 % create the shape with either 1 or 2 dimensions based on whats required
            shape_temp = {shapeList{selection}, colourList{colour_selec}, str2num(inputvalues{1}), shparea};
        else
            shape_temp = {shapeList{selection}, colourList{colour_selec}, str2num(inputvalues{1}), str2num(inputvalues{2}), shparea};
        end
        shape{shapecounter} = shape_temp;

        for i = 1:shapecounter % area calc
            % initialize variables
            area = 0;
            areaType =  shape{i}{1}; % first cell % first item of cell
            dim1 = shape{i}{3};
            dim2 = shape{i}{4}; % note this is 0 if 
            
            % use of switch statement to determine what area calculation to
            % utilize
            switch areaType
                case 'Circle'
                    area = pi*(dim1)^2;
                case 'Square'
                    area = (dim1)^2;
                case 'Ellipse'
                    area = pi*dim1*dim2;
                case 'Triangle'
                    area = (dim1*dim2)/2;
                case 'Rectangle'
                    area = dim1*dim2;
            end
            % assign the new area into the shapeArea cell array, which
            % changes after every new area calculation, while all the areas
            % are stored in the shape cell array
            shapeArea{i} = area;      
            shape{i}{5} = shapeArea{i};
        end
end
% call the function to save results to a file
saveToFile(shape, shapecounter)
end

function [] = saveToFile(shape, shapecounter) % sub function that saves results to a file
fid = fopen('NikhilNayyar.txt', 'w'); % 'w' opens the file in "write" mode. 

% check if the file opened properly
if fid == -1
    error('Failed to open the file for writing')
end

% write the results computed in the main function into the file
fprintf(fid, "The number of entered objects was %d \n", shapecounter);
fprintf(fid, "No.\t\tID\t\tColour\t\tArea\n");
for i = 1:shapecounter
    fprintf(fid, "%d\t\t%s\t\t%s\t\t%.6f \n", i, shape{i}{1}, shape{i}{2}, shape{i}{5});
end

% close the filed
result = fclose(fid);

% check if the file closed properly
if result ~= 0
    error('Failed to close the file')
end

end

