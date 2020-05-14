%%%%%
%
% Course: ENCMP 100
% Assignment: 2
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614962
%
% Description: This program takes in a code from a user and attempts to
% match it to a rescue time and place, or tells you if the input was
% invalid.
%
%%%%%

% Clear command window and workspace
clear
clc

% empty array for input digits to go into
nums = 0:9;

% Getting Inputs
Ask_input = input("Please enter a code to break: ", 's' );

% Converting input to numbers and adding to vector
nums = Ask_input - char(48);
sum_nums = sum(nums);

% Checking if 9 digit number was inputed
if length(nums) < 9 || length(nums) > 9
    fprintf("Decoy Message: Not a nine-digit number. \n")
else
    % Checking if the sum of digits is even or odd by using modulus to find remainder
    if mod(sum_nums,2) == 1
        % sum was odd
        fprintf("Decoy Message: Sum is odd. \n")
    else
        % sum was even, so calculate rescue number 
        rescue_num = nums(1)*nums(3)-nums(5);       
        % take the afformentioned rescue number and assign a rescue day to it via switch
        % statement
        switch rescue_num
            case 1
                rescue_day = "Monday";
            case 2
                rescue_day = "Tuesday";
            case 3
                rescue_day = "Wednesday";
            case 4
                rescue_day = "Thrusday";
            case 5
                rescue_day = "Friday";
            case 6
                rescue_day = "Saturday";
            case 7
                rescue_day = "Sunday";
            otherwise % the otherwise stores the rescue_day variable as 'invalid' to indicate it is invalid
                rescue_day = "invalid";
        end
        % checks if a non valid rescue day was obtained
            if rescue_day == "invalid"
                fprintf("Decoy Message: Invalid rescue day. \n")
            else
                % Finding a rescue location number
                rescue_placeTest = nums(2)*nums(4)-nums(6);
                % Check if first part was divisble by 3 to further
                % calculate rescue location
                if mod(rescue_placeTest, 3) == 0
                    rescue_place = nums(7)-nums(9);
                else
                    rescue_place = nums(8)-nums(9);
                end        
                % using the rescue location number and assinging a value to
                % it via switch statement
                switch rescue_place
                    case 1
                        rescue_place = "bridge";
                    case 2
                        rescue_place = "library";
                    case 3
                        rescue_place = "river crossing";
                    case 4
                        rescue_place = "airport";
                    case 5
                        rescue_place = "bus terminal";
                    case 6
                        rescue_place = "hospital";
                    case 7
                        rescue_place = "St. Petes Church";
                    otherwise % the otherwise stores the rescue_location variable as 'invalid' to indicate it is invalid
                        rescue_place = "invalid";
                end
            % checks if a non valid rescue location was obtained
            if rescue_place == "invalid"
                fprintf("Decoy Message: Invalid rendezvous point.  \n")
            else
                % displays the final message if all the code tests were
                % passed
                fprintf("Rescue on %s at %s. \n", rescue_day, rescue_place)
            end     
            end             
    end
end


