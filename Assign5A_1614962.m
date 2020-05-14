%%%%%
%
% Course: ENCMP 100
% Assignment: 5A
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614962
%
% Acknowledgments: None
%
% Description: This program creates a graphical user interface where a user
% can select various shapes and assign properties to them.
%%%%%

% clear the workspace and command window
clear
clc

% initialize variables
shapecounter = 0;

while 1
    shapeList = {'Circle', 'Square', 'Ellipse', 'Triangle', 'Rectangle'}; %create a cell array of shapes to chose from
    [selection, ok] = listdlg('PromptString', 'Select the next shape: ',...
        'SelectionMode', 'single', 'OKString', 'Enter', 'CancelString', 'No more',...
        'ListString', shapeList); % make the menu to chose a shape
    
     if ok == 0 % if the menu is closed, print the amount of objects entered in
         fprintf("The number of entered objects was %d \n", shapecounter)
     end
    
    % selection now holds the index of the selected shape 
    % ok is 1 if a shape was selected; otherwise, ok is 0 
    if ok == 1
        shapecounter = shapecounter + 1; % add a shape added
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

end


    