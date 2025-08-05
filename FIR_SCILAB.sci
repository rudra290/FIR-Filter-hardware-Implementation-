clc ; 
close ; 
disp("EC037 Program to Design FIR Low Pass Filter"); 
M = input ('Enter the odd Fileter length = ' ); 
// Filter length 
Wc = input ('Enter the Digital Cutoff frequency = '); 
// Digital Cut off frequency 
Tuo = (M -1) /2 // C ent er Value 
for n = 1:M 
if (n == Tuo +1) 
hd(n) = Wc/ %pi ; 
else 
hd(n) = sin(Wc *((n -1) -Tuo)) /(((n -1) -Tuo )*%pi); 
end 
end 
// Rectangular Window 
for n = 1:M 
W(n) = 1; 
end 
// Windowing Fitler Coefficients 
h = hd .*W; 
disp (h, 'Filter Coefficientsare') 
[hzm ,fr ]= frmag (h ,256) ; 
hzm_dB = 20* log10 (hzm)./ max ( hzm ); 
subplot (3 ,1 ,1) 
plot (2*fr , hzm ) 
xlabel('Normalized Digital Frequency W'); 
ylabel('Magnitude'); 
title ('EC037 Frequency Response of FIR LPF using Rectangular window ') 
xgrid (1) 
subplot (3 ,1 ,2) 
plot (2*fr , hzm_dB ) 
xlabel ('Normalized Digital Frequency W'); 
ylabel ('Magnitude in dB'); 
title ('EC037 Frequency Response of FIR LPF using Rectangular window ') 
xgrid (1)
//, Sine wave  
t=0:0.00001:0.1; 
x2=sin(2*%pi*50*t) + sin(2*%pi*100*t) + sin(2*%pi*500*t);
y = zeros(1,length(x2))
for i = 10:length(x2)-1
    for j = 1:M
        y(i) = y(i) + h(j)*x2(i-j+1);
    end
end
subplot (3 ,1 ,3)
plot (t , x2) 
plot (t,y) 
xlabel ('Normalized Digital Frequency W'); 
ylabel ('Magnitude in dB'); 
title ('EC037 Frequency Response of FIR LPF using Rectangular window ')
