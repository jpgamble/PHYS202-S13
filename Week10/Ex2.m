experiment = importdata('radioactivedecay.dat');
t = experiment.data(:,1);
N = experiment.data(:,2);
figure(42)
slope, intercept, delta, slerr, interr = LinearLSQFit(t,N);
plot(t,N,'.b', t, slope*x+intercept)
legend('Time','Decay', 'Fit')