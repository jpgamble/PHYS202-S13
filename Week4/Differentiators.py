def PtFiniteDiff(x,y):
	""" This function takes one array as an arguments(x), and returns the derivative of the second input (y) with repect to x based on 4 pts instead of 2"""
    	dydx= zeros(y.shape, float)
   	dydx[0] = (y[1] - y[0])/(x[0]-x[1])
   	dydx[-1]  = (y[-1] - y[-2])/(x[-1]-x[-2])
    	dydx[1] = (y[1] - y[0])/(x[1] - x[0])
    	dydx[-2] = (y[0] - y[-2] )/(x[0]- x[-2])
    	for n in (y[-2:2]):
        	dydx[n] = (y[n-2] - (8*y[n-1]) - (8*y[n-1])- y[n+2])/(12*(x[n+1] - x[n]))
    	return dydx

def finiteDifference(x,y):
    """This function takes one array as an arguments(x), and returns the derivative of the second input (y) with repect to x based on 2 pts."""
    dydx = diff(y)/(diff(x))
    return dydx
