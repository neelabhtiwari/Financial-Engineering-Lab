%This code is written by Neelabh Tiwari - 160123024 for MA 374 - 2019
clear; clc; format short g

clear all;
format long;



option = xlsread('nifty.xlsx','Sheet1');
strike = xlsread('nifty.xlsx','Sheet2');
maturity = xlsread('nifty.xlsx','Sheet3');

maturity

surf(maturity,strike,option)
