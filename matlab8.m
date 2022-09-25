
H = (0.04^2)/(2*(0.04^2 + 0.1^2)^(1.5)); 
u = (4*pi)*(10^-7);
x = 0.1;
r1 = 0.01;
r2 = 0.04;
B = u*H;
stepr = 1000.0;
stepphi = 1000.0;
rlower = 0.0; %bounds
rupper = 0.01; 
philower = 0.0; 
upperphi = 2*pi; 
flux = 0.0;
r = 0.0;

dr = (rupper - rlower)/stepr; 
dphi = (upperphi - philower)/stepphi;

for i = 1:stepr %dbl integral for calculation of flux
    for j = 1:stepphi
        flux = (r*dphi*dr)+flux; 
    end
    r = dr + r;
end

M = flux * B; 