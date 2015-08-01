source ("LeastSquare.m");
%% input parameter: 
%        W: input matrix containing points for feature extraction
%% output parameter: 
%          f: output vector containing features
function [f] = ExtractFeatures(W )
f = zeros(1, 5);
  % check for dimension
 %if(size(W)(1) != 2)
     %error ("not enough input arguments");
 % endif

  % check for size
   n = size(W)(1);                                                  % numbers of points
  
   % calculate pca
   c = mean(W); 
   Xm = bsxfun(@minus, W, c); 
   C = cov(Xm);
   [V,D] = eig(C);

   % calculate features from eigen values
   eigen = [D(1,1), D(2,2)];    
         
   % linearity
   f(1) = eigen(1) / (eigen(1) + eigen(2));
   
   % circularity 
   f(2) = eigen(2) / (eigen(1) + eigen(2)); 

   % standard deviation from centroid 
   sumUp = 0; 
   for(i=1:n)
%      sumUp =  sumUp + sum((W(i)-c)).^2;
      sumUp = sumUp + dot((W(i) - c), (W(i) - c));
   end
   
   f(3) = sqrt((1/(n-1)) * sumUp); 
   
   % mean deviation
   sumUp = 0; 
   for(i=1:n)
      sumUp =  sumUp + norm((W(i)-c));
   end
   f(4) = 1/n * sumUp;
   
   % linearity with a line equation.
   [ m, t ] = LineLeastSquare(W);
   for i = 1 : n
      f(5) = f(5) + (m * W(i, 1) + t - W(i, 2)) .^2;
   endfor
   f
endfunction