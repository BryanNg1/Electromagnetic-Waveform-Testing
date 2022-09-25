W = 0; %varaible initialize
rlow = 2;
rup = 3;
philow = 0;
phiup = 2*pi;
thetalow = 0;
thetaup = pi;
r = 2;
theta = 0;

numstepr = 100; %more steps = more accurate
numstepphi = 100;
numsteptheta = 100;

enot = 8.89e-12; %e not constant
Q = (8*pi)*e-6; %q calculated shown in physical calculations

dr = (rup-rlow)/numstepr; 
dphi = (phiup-philow)/numstepphi;
dtheta = (thetaup-thetalow)/numsteptheta;

for k=1:numstepr
  for j=1:numstepphi
    for i=1:numsteptheta
      W = W + ((Q^2/(32*pi^2*enot*r^4))*r^2*dr*sin(theta)*dtheta*dphi); %energy expression
      r = rlow +dr/2+(i-1)*dr; %increment r, phi ,theta
      phi = philow +dphi/2+(j-1)*dphi;
      theta = thetalow +dtheta/2+(k-1)*dtheta;
    end
  end
end


