load FaceVideo.mat
[ap.idx,ap.netsim,ap.dpsim,ap.expref]=apcluster(S,pref,'details');
rand('state',1); % run VSH deterministically (to exactly duplicate results)
[vsh.idx,vsh.netsim,vsh.dpsim,vsh.expref]=vshcluster(S,k,'details','preference',pref);
Relative_Error_Pct = (ap.dpsim(end)-max(vsh.dpsim))/abs(max(ap.dpsim(end),max(vsh.dpsim)))*100
