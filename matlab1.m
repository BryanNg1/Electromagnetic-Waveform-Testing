%Part 1 Dot Product of Vectors

R1=[1,2,3];
R2=[3,2,1];
O=[0,0,0];


dotprodR1R2 = dot(R1,R2); %dot product of the vectors R1 and R2

%Part 2 Vector Projection

MagR2 = norm(R2); %magnitude R2
Scalarprod = dotprodR1R2/MagR2; %scalar product of R1 and R2
UnitVec = R2/MagR2; %unit vector R2
Vectorprod = Scalarprod*UnitVec; %vector projection of R1 on R2

%Part 3 Angle

MagR1 = norm(R1); %magnitude R1
costheta = (dotprodR1R2/(MagR1*MagR2)); %finding cos theta
theta = acos(costheta); %theta (angle between R1 and R2


