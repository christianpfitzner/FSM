clear all; 
close all; 
%% may be that are only octave commands.
source ("ExtractFeatures.m")
source ("create_scan.m")

%% extract features.
scan = create_scan();

% select point using a window
f = [];

A = ones(5,5); 

for window_size = 1:20
  for row = window_size / 2 + 1 : window_size / 3 : size(scan)(1) - window_size / 2
    f = [ f ; ExtractFeatures(scan(round(row - window_size / 2) : round(row + window_size / 2), :)) ];
  endfor
endfor

figure(1);
plot(scan(:,1), scan(:,2), "xr", "linewidth", 3);

figure(2);
hold on;
x = 1 : 1 : size(f)(1);
plot( x, f( : , 1), 'k;linearity;',   'linewidth', 3);
plot( x, f( : , 2), 'r;circularity;', 'linewidth', 3);

figure (3);
hold on;
plot( x, f( : , 3), 'g;standard deviation from centroid;', 'linewidth', 3);
plot( x, f( : , 4), 'b;mean deviation;',                    'linewidth', 3);


figure(4);
plot( x, f( : , 5), 'm;linearity with a line equation;', 'linewidth', 3);