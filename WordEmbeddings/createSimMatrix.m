load('data/NYTw2vSenseN');
simM=distMC;
[pmin,~]=preferenceRange(simM);
save('C:\Users\Mike\Desktop\simCos','simM','pmin','-v7.3')
clear simM pmin pmax