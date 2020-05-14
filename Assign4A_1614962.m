%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4A
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614962
%
% Acknowledgements: none
%
% Description: This program displays various results based off of olympic
% data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = Assign4A_1614962() % creates main function
% clear workspace and command window
clear
clc

load ('olympics.mat'); % loads in olympics matrix
results = zeros(size(countries,1),4); % initializes results matrix

for j=1:length(countries) % computes the amount of medals for each country via function, then adds it into results array
    results(j,:) = compute_medals(gold,silver,bronze,countries(j,:));
end

print_results(countries, results) % prints the standings based off of medals

for i = 1:3 % print the three cases of results, where the ith index produces a different result from the function
    print_best_countries(results, countries, i)
end

end

function [results] = compute_medals(gold,silver,bronze,countries)
% intialize local variables
gold_med = 0;
silver_med = 0;
bronze_med = 0;
t = 0;

for j = 1:length(gold) % length of gold is same as silver and bronze
    if countries == gold(j,:) % if a country has a gold medal add one to the count
        gold_med = gold_med + 1;
    end
    if countries == silver(j,:) % if a country has a silver medal add one to the count
        silver_med = silver_med + 1;
    end
   if countries == bronze(j,:) % if a country has a silver medal add one to the count
        bronze_med = bronze_med + 1;
    end
end

t = gold_med + silver_med + bronze_med; % add up the total amount of medals
results = [gold_med, silver_med, bronze_med, t];  % return an output of the amount of each medal and the total medals for a given country
end% define function that computes the amount of medals for a country

function [] = print_results(countries, results) % define function that prints results
fprintf(" Country   Gold   Silver   Bronze   Total \n") % print the inital line

for i = 1:length(countries)-1 % use of -1 so that the XXX country is not printed
   fprintf('%5s\t%5d\t%3d\t%3d\t%3d\n', countries(i, :), results(i, :)) % print the country followed by the medal catagories
     %use of /t for spacing
end
end

function [] = print_best_countries(results, countries, selection)
% initalize local variables
most_medals = 0;
most_gold = 0;
medals_20 = zeros(1, 27);

switch selection % use of switch to determine what to print
    case 1
        [row,~] = find(results(:,4) == max(results(:, 4))); % use of find command to locate which row has the most medals
        most_medals = countries(row,:); % find which country had the most medals from the index (s) returned prior
        fprintf('Countries with the most medals: %s \n', most_medals) % print which country has the most medals
        
    case 2
        [row,~] = find(results(:,1) == max(results(:, 1))); % use of find command to locate which row has the most gold medals
        most_gold = countries(row,:);  % find which country had the most gold medals from the index (s) returned prior
        fprintf('Countries with the most gold medals: %s \n', most_gold) % print which country has the most medals
        
    case 3
        [row,~] = find(results(:,4) >= 20); % use of find command to locate which row (s) has at least 20 medals
        medals_20 = countries(row,:); % find which countries have at least 20 medals
         fprintf('Countries with at least 20 medals: '); % print initial statement
        for i=1:length(medals_20) 
            fprintf('%s ', medals_20(i,:)');% display the countries that have at least 20 medals
        end
        fprintf('\n'); % print new line
end
end % define function that prints different catagories of results





