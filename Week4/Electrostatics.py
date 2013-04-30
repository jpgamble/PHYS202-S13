def pointPotential(x,y,q,posx,posy):
    """Arguements taken as (x,y,q,posx,posy) This function will take in the arguements of the bounds for the graphs as x and y, it will then take the size of charge to calculate the potential at that the coordinates of posx and posy"""
    k = 8.987e9 #N m^2/C^2
    Vxy = (k*q)/(((x-posx)**2 + (y-posy)**2)**(1/2.)) 
    return Vxy

def dipolePotential(x,y,q,d):
    """takes the potential between two charges based on charge and distance as (x,y,q,d)"""
    posx = x+ d/2
    posy = y 
    o = pointPotential(x,y,q,posx,posy)
    posx = x- d/2
    posy = y
    b = pointPotential(x,y,q,posx,posy)
    Vxy2 = o+b
    return Vxy2