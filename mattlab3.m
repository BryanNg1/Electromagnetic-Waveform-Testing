P = 2e-6; %surface charge density
E = 0; %initialize field
k = 8.99e9; %permitivity of surface charge density
numpstep = 100;
numphistep = 100;
plow = 0; %lower bound p
pup = 1;  %upper bound p
philow = 0;  %phi lower and upper bounds
phiup = 2*pi;
 
dp = (pup- plow)/numpstep; %increment of width
dphi = (phiup- philow)/numphistep; %increment length

for j = 1: numphistep %loop for integration
 for i = 1: numpstep
 p = plow +dp/2+(i-1)*dp; %x and y components
 phi = philow +dphi/2+(j-1)*dphi;
 E = E+((p*P*dp*dphi*k)/(((p*p+1).^(3/2)))); %equation of E (shown in the written)
 end
end
