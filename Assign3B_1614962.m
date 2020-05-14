%%%%%
%
% Course: ENCMP 100
% Assignment: 3B
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614962
%
% Acknowledgments: None
%
% Description: This program determines the minimum monthly payment one must
% pay inorder to afford various college tuitions
%
%%%%%

% clear the workspace and command window
clear
clc

% get input of which program from user
program_ask = input("Select a program: 1. Arts; 2. Science; 3. Engineering ");

switch program_ask % Assign the original tutuion value to the respective program via switch
% statement
    case 1
        og_tuition = 6000;
        program = "Arts";
    case 2
        og_tuition = 6500;
        program = "Science";
    case 3
        og_tuition = 7000;
        program = "Engineering";
end

tuition_cost = zeros(1, 22); % initialize vector for tuition cost over 22 years

for i = 1:22 % iterate through 22 years
    
    if i == 1 % if its the first year, use the original tuition amount
        old_cost = og_tuition;
    else
        old_cost = tuition_cost(i-1); % find the previous years tuition amount
    end
    
    new_cost = old_cost + (old_cost*0.0575); % compute the new tuition
    tuition_cost(i) = new_cost; % append the computed value to tuition cost vector
end

tuition_fee = sum(tuition_cost(18:21)); % add up the last 4 years of tuition to find out how much user would have to pay
fprintf("The cost of 4 years of tuition for %s is $ %.2f \n",program, tuition_fee) % print the tuition fee

% intialize the original balance
og_balance = 2000;

% initialize empty vector to add monthly savings into
savings = zeros(1, 216);
total_savings = 0;
month_pay = 50; % initial monthly payment value

while total_savings < tuition_fee % use of while loop to check if savings is enough, otherwise keep changing monthly balance

    for i = 1:215 % every month for 18 years
        
            if i == 1 % for the first month, the old balance in the compound interest formula is the original balance
                old_balance = og_balance;
            else % find the previous months balance to use in computation of savings, by going back 1 month in savings vector
                old_balance = savings(i-1);
            end

            new_balance = old_balance + (old_balance*(0.06/12)) + month_pay;% compute the new balance
            savings(i) = new_balance; % append the new balance into savings vector in appropriate index
            total_savings = savings(i);
          
    end
    
    if total_savings < tuition_fee % if the savings is not enough for the tuition fee, increase the monthly payment
        month_pay = month_pay + 10;
    end
    
end

fprintf("With savings of %.2f per month, you can afford the tuition cost for %s \n", month_pay, program) % print monthly payment neccesary for the chosen tuition