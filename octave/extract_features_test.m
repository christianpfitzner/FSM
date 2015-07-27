clear all; clf; clc;
%% may be that are only octave commands.
source ("ExtractFeatures.m")
source ("create_scan.m")

%% extract features.
scan = create_scan();

window = 9;
%f = zeros(size(scan)(1));
f = [];
for row = window / 2 + 1 : window / 3 : size(scan)(1) - window / 2
   f = [ f ; ExtractFeatures(scan(round(row - window / 2) : round(row + window / 2), :)) ]
endfor

figure(1);
plot(scan(:,1), scan(:,2), "xr", "linewidth", 3);

figure(2);
hold on;
x = 1 : 1 : size(f)(1);
plot( x, f( : , 1), 'k', 'linewidth', 3);
plot( x, f( : , 2), 'r', 'linewidth', 3);
plot( x, f( : , 3), 'g', 'linewidth', 3);
plot( x, f( : , 4), 'b', 'linewidth', 3);