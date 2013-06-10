function [ slope, intercept, delta, slerr, interr ] = LinearLSQFit( x,y ) %#ok<*STOUT>
%   """Take arrays x and y for a set of linearly varying data and performs a linear least squares regression. Return the resulting slope and intercept pparamenters of the best fit line with their uncertainties."""
slope = ((mean(x*y))-(mean(x)*mean(y)))/(mean(x^2) - (mean(x)^2));
    intercept = (mean(x^2)*mean(y) - (mean(x)*mean(x*y)))/(mean(x^2)- (mean(x)^2)); 
    delta = y - (slope*x + intercept);
    slerr = sqrt((1/(length(x)-2.))*mean(delta^2))/(mean(x^2) - (mean(x)^2));
    interr = sqrt((1/(length(x)-2.))*mean(delta^2)*mean(x^2))/(mean(x^2) - (mean(x)^2));
end

