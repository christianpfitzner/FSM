%% input parameter: 
%        W: input matrix containing points for feature extraction
%% output parameter: 
%          f: output vector containing features
function [f] = maxmin(W )

  % check for dimension
  n = length(W')

   % calculate pca
   
   n = length(W)

   % calculate features from eigen values
   eig = [1.0, 1.0]; 
   
   % linearity
   f(1) = eig(1) / (eig(1) + eig(2));
   
   % circularity 
   f(2) = eig(2) / (eig(1) + eig(2)); 

   % standard deviation from centroid 
   c = mean(W); 
   f(3) = sqrt(1/2); 

endfunction