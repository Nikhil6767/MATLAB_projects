%%%%%
% Course: ENCMP 100
% Assignment: 1A
% Name: Nikhil Nayyar
% CCID: nnayyar1
% U of A ID: 1614962
%
% Acknowledgements:
%
% Description: This program calculates a final mark for ENCMP 100 based off
% of user inputs.
%
%%%%%

% Clearing workspace and command window
clearvars
clc

% printing intial text
disp("ENCMP100 Final Mark Calculator")
disp("Please input grades as a percentage.")

% Getting inputs
asn1 = input("Assignment #1: ");
asn2 = input("Assignment #2: ");
asn3 = input("Assignment #3: ");
asn4 = input("Assignment #4: ");
asn5 = input("Assignment #5: ");
mid = input("Midterm Exam: ");
fin = input("Final Exam: ");

% Computing average mark of assignments
asnTot = (asn1*0.06) + (asn2*0.06) + (asn3*0.06) + (asn4*0.06) + (asn5*0.06);

% Computing final mark
finMark = (asnTot) + (mid*(7/30)) + (fin*(7/15));

% Displaying final mark
disp("Your final mark for ENCMP 100 is: " + finMark)