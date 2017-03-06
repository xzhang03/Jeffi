function [ outputmat ] = jeffi( x, n, alpha, deci )
%Jeffi calculates the confidence interval of a given alpha from the data
%set. Results are expressed in any number of decimal places. Default is 95%
%confidence interval in 3 decimals.
%   [ mean, lowerbound, upperbound ] = jeffi( x, n, alpha, deci)

% Default 3 decimal places
if nargin < 4
    deci = 3;
end

% For better accuracy, calculate one more decimal to round off in the end
deci2 = deci + 1;

% Default 95% CI
if nargin < 3
    alpha = 0.05;
end

% Calculate the mean
mean = round(x/n, deci);

% Set the beta distribution to obtain 3-decimal accuracy.
betax = 0 : 10^-deci2 : 1;

% Get the beta cdf using Jeffrey's posterior
betay = betacdf(betax, x+0.5, n-x+0.5);

% Use the alpha value to get the confidence interval
% Lowerbound is set to 0 if x = 0
if x==0
    lowerbound = 0;
else
    lowerbound = find(betay >= alpha / 2, 1) / (10 ^ deci2);
    lowerbound = round(lowerbound, deci);
end

% Upperbound is set to 1 if x = n
if x== n
    upperbound = 1;
else
    upperbound = find(betay <= 1 - alpha / 2, 1, 'last') / (10 ^ deci2);
    upperbound = round(upperbound, deci);
end

% Display the results
disp(['Mean: ', num2str(mean)])
disp(['Lower bound: ', num2str(lowerbound)])
disp(['Upper bound: ', num2str(upperbound)])

% Show a vector for copying
outputmat = [mean;upperbound;lowerbound];

end

