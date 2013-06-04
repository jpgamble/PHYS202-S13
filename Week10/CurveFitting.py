

def LinearLeastSquaresFit(x,y):
	from numpy import average
	from numpy import sqrt
    	"""Take arrays x and y for a set of linearly varying data and performs a linear least squares regression. Return the resulting slope and intercept pparamenters of the best fit line with their uncertainties."""
    	slope = ((average(x*y))-(average(x)*average(y)))/(average(x**2) - (average(x)**2))
    	intercept = (average(x**2)*average(y) - (average(x)*average(x*y)))/(average(x**2)- (average(x)**2)) 
    	delta = y - (slope*x + intercept)
    	slerr = sqrt((1/(len(x)-2.))*average(delta**2))/(average(x**2) - (average(x)**2))
    	interr = sqrt((1/(len(x)-2.))*average(delta**2)*average(x**2))/(average(x**2) - (average(x)**2))
    	return slope, intercept, slerr, interr

def WeightedLinearLeastSquaresFit(x,y,w):
	from numpy import average  
	from numpy import sqrt
	"""Take in arrays representing (x,y) values for a set of linearly varying data and a array of weights w.
	perform a weighted linear least squares regression. Return the resulting slope and intercept parameteres of the best fit line with their uncertainties. 

	If the weights are all equal to one, the uncertainties on the paramenters are caluclated using the
	non-weighted least squares equations."""
    	for i in range(len(x)-1):
        	if w[i] == 1:
            		slope, intercept, slerr, interr = LinearLeastSquaresFit(x,y)
        	else:
            		slerr = ((sum(w)*sum(x*y*w)) - (sum(w*x)*sum(w*y)))/(sum(w)*sum(w*(x**2))-(sum(w*x))**2)
            		intercept = ((sum(w*(x**2))*sum(w*y))-(sum(w*x)*sum(w*x*y)))/((sum(w)*sum(w*(x**2))-(sum(w*x)**2)))
            		slope = sqrt((sum(w)/((sum(w)*sum(w*(x**2))) - sum(w*x)**2)))
            		interr = sqrt((sum(w*(x**2)))/((sum(w)*sum(w*(x**2))) - (sum(w*x))**2))
            		return slope, intercept, slerr, interr