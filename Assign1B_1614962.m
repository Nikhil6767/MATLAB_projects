%%%%%
% Course: ENCMP 100
% Assignment: 1A
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614963
%
% Acknowledgements:
%
% Description: This program plots position vs time and height vs time
% graphs using user inputs.
%
%%%%%

% Clear workspace and command window
clear
clc

% Getting inputs
initial_v = input("Enter the intial velocity of the ball: ");
initial_h = input("Enter the intial height of the ball: ");

% Intializing x array for 10 seconds
x = [0:1:10];

% Computing h(t) and v(t) functions 
h = (1/2).*(-9.81).*x.^2 + initial_v.*x + initial_h;
v = (-9.81).*x + initial_v;

% Creating the graph with both lines
figure(1);
plot(x, h); % Height vs Time graph
hold on;
plot(x, v, '--og'); % Veloctiy vs Time graph

% Adding graph elements
title("Plot of height and velocity vs time")
grid 
xlabel("Time (s)")
ylabel("Height (m) and Velocity (m/s)")
legend('Height', 'Velocity')
xlim([0,10])
xticks([0:1:10])