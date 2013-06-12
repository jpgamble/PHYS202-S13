def newpos(pos, vel, index):
    import numpy
    import math
    import random 
    pos[index] = pos[index] + vel[index]
    if pos[index] > road:
        pos[index] = pos[index] - 40
    return pos


def ASEP(pos, vel, road, cars):
    """Takes three arguments Pos,vel, road, cars and outputs pos[index], vel[index], spacing according to rules
    of ASEP"""
    import numpy
    import math
    import random 
    pos = zeros(cars)
    vel = zeros(cars)
    for i in range(len(pos)-1):
        pos[i] = randint(0, road)
    for k in range(len(vel)-1):
        vel[k] = randint(0, road-cars)
    index = randint(0, len(pos)-1)
    carpos = pos[index]
    sortedpos = sort(pos)
    random.randint(0, 1)
    if carpos == (len(pos)-1):
        gi = sortedpos[0]
        if gi == 0:
            vel = 0
    else:
        gi = (sortedpos[index+1] - sortedpos[index])
        if gi == 0:
            vel[index] = 0
    if vel[index] > gi:
        vel[index] == gi
    elif vel[index] < gi and vel[index] < max(vel):
        vel[index] = vel[index] + 1
    newpos(pos, vel, index)
    print "ASEP Position is: " + str(pos[index])
    print "ASEP Velocity is: " + str(vel[index])
    print "ASEP Space between car and car before: " + str(gi)
    return pos[index], vel[index], gi