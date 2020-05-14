%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4B
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614962
%
% Acknowledgements: none
%
% Description: This program displays various results based off of olympic
% data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = Assign4B_1614962() % creates main function
% clear workspace and command window
clear
clc

load ('olympics.mat'); % loads in olympics matrix

data = struct('country', countries, 'gold_med', gold, 'silver_med', silver, 'bronze_med', bronze, 'total_med', 0); % creates data structure with contents of olmypics file

for j=1:length(data.country) % computes the amount of medals for each country via function, then adds it into results array
    results(j, :) = compute_medals(data.gold_med, data.silver_med,data.bronze_med,data.country(j,:));
end

print_results(results) % prints the standings based off of medals

for i = 1:3 % print the three cases of results, where the ith index produces a different result from the function
    print_best_countries(results, i)
end

end

function [results] = compute_medals(gold, silver, bronze, country)
% initialize local variables including temporary structure
sresults = struct('gold', 0, 'silver', 0, 'bronze', 0, 'total', 0, 'country', country);
t = 0;

for j = 1:length(gold) % length of gold is same as silver and bronze
    if country == gold(j,:) % if a country has a gold medal add one to the count
        sresults.gold = sresults.gold+ 1;
    end
    if country ==  silver(j,:) % if a country has a silver medal add one to the count
        sresults.silver = sresults.silver + 1;
    end
   if country == bronze(j,:) % if a country has a silver medal add one to the count
        sresults.bronze = sresults.bronze + 1;
    end
end
sresults.total = sresults.gold + sresults.silver+ sresults.bronze; % add up the total amount of medals

results = sresults; % output the results
end% define function that computes the amount of medals for a country

function [] = print_results(results) % define function that prints results
fprintf(" Country   Gold   Silver   Bronze   Total \n") % print the inital line
for i = 1:length(results)-1 % use of -1 so that the XXX country is not printed
    fprintf('%5s\t%5d\t%3d\t%3d\t%3d\n',results(i).country(1,:),results(i).gold(1), results(i).silver, results(i).bronze, results(i).total)
end


end

function [] = print_best_countries(results, selection)
% initialize local variables
most_medals = 0;
most_gold = 0;

switch selection % use of switch to determine what to print
    case 1
        [~, ind] = max([results.total]); % use of max command to locate which row has the most medals
        most_medals = results(ind,:).country; % find which country had the most medals from the index (s) returned prior
        fprintf('Countries with the most medals: %s \n', most_medals) % print which country has the most medals
        
    case 2
        [~, ind] = max([results.gold]); % use of max command to locate which row has the most gold medals
        most_gold = results(ind,:).country; % find which country had the most medals from the index (s) returned prior
        fprintf('Countries with the most gold medals: %s \n', most_gold) % print which country has the most gold medals
        
    case 3   
        [~, ind] = find([results.total]>=20);
        fprintf('Countries with at least 20 medals: '); % print initial statement
        for i = 1:length(ind) 
              fprintf('%s ', results(ind(i),:).country'); % display the countries that have at least 20 medals
        end
         fprintf('\n'); % print new line
        
end

end% define function that prints different catagories of results

