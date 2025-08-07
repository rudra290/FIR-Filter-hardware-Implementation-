clc;
clear;
frequency = 1000
time = 0:0.01/frequency:10/frequency
out = sin(2*%pi*frequency*time);
plot(time,out);
