% m: gradient
% t: offset
% P: line points, each row is one point, row(1) = x, row(2) = y.
function [m, t] = LineLeastSquare(P)
   xMean = sum(P( : , 1));
   yMean = sum(P( : , 2));
   m = sum((P( : , 1) - xMean) .* (P( : , 2) - yMean)) / sum((P( : , 1) - xMean) .^2);
   t = yMean - m * xMean;
endfunction