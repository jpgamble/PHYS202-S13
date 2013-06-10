function [slope, intercept, delta, slerr, inter] = WeightedLSQFit(x,y,w) %#ok<STOUT,*FNDEF,*NODEF,*NASGU>

% Take arrays x and y for a set of linearly 
%varying data and performs a linear least 
%squares regression. Return the resulting slope 
%and intercept pparamenters of the best fit line 
%with their uncertainties.
for i=1:(len(x))
    if w(i) == 1
    slope = ((mean(x*y))-(mean(x)*mean(y)))/(mean(x^2) - (mean(x)^2));
    intercept = (mean(x^2)*mean(y) - (mean(x)*mean(x*y)))/(mean(x^2)- (mean(x)^2)); 
    delta = y - (slope*x + intercept);
    slerr = sqrt((1/(length(x)-2.))*mean(delta^2))/(mean(x^2) - (mean(x)^2));
    interr = sqrt((1/(length(x)-2.))*mean(delta^2)*mean(x^2))/(mean(x^2) - (mean(x)^2));
    else
    slerr = (((w)*(x*y*w)) - ((w*x)*(w*y)))/((w)*(w*(x^2))-((w*x))^2);
       intercept = (((w*(x^2))*(w*y))-((w*x)*(w*x*y)))/(((w)*(w*(x^2))-((w*x)^2)));
       slope = sqrt(((w)/(((w)*(w*(x^2))) - (w*x)^2)));
            interr = sqrt(((w*(x^2)))/(((w)*(w*(x^2))) - ((w*x))^2));
    end
end

