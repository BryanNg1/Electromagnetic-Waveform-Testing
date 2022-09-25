%part 1
V = 0;
r = 0;
phi = pi/4;
theta = pi/4;

numstepr = 100; %more steps = more accurate
numstepphi = 100;
numsteptheta = 100;

dr = (2-0)/numstepr;
dphi = (pi/2-pi/4)/numstepphi;
dtheta = (pi/2-pi/4)/numsteptheta;

for k=1:numstepr
  for j=1:numstepphi
    for i=1:numsteptheta
      V = V + dr*r*dtheta*r*sin(theta)*dphi; %volume expression
      theta = theta+dtheta;
    end
    r = r+dr; 
    theta=pi/4;
  end
  r = 0;
end


%part 2
theta1=pi/4;
theta2=pi/2;

S1=0;
S2=0;
S3=0;
S4=0;
S5=0;
S6=0;
Stotal =0;

%surface area S3 and S4 (refer to solved example for faces)
r = 0;
for k = 1:numstepr
    for j = 1:numstepphi
        S3 = S3+r*dr*dtheta;
        r = r+dr;
    end
    r = 0;
end
S4 = S3;

%surface area S2 and S5
r = 0;

for k = 1:numstepr
    for j = 1 :numstepphi
        S2 = S2+sin(theta1)*r*dr*dphi;
        S5 = S5+sin(theta2)*r*dr*dphi;
        r = r+dr;
    end
    r = 0;
end



%surface area S1
r = 2;
theta = pi/4;
for k = 1:numstepr
    for j = 1:numstepphi
        S1 = S1+r*r*sin(theta)*dtheta*dphi;
        theta = theta+dtheta;
    end
    theta = pi/4;
end

%total area
Stotal=S1+S2+S3+S4+S5;
