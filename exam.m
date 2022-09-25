clc;        %clear the command line
clear;      %remove all previous
close all;  %closes all figures

VOut=-5;     %voltage on outer conductor
VIn=5;  %voltage on inner conductor
middle=50;                      %is the middle of all the points
points=middle*2;                %number of points in the x & y direction
A=zeros(points^2, points^2);    %this is the matrix of coefficients
b=zeros(points^2,1);            %this is the right hand side vector
EquationCounter=1;              %this is the counter of the equations

for i=1:points  %repeat for all rows (down to up therefore first row is bottom boundary)
    for j=1:points %repeat for all columns (left to right therefore first column is left boundary)
        %V=100 for all points inside the inner conductor
        %which is just a line at the center from middle to top
        if( ((i>50)&(i<80))&((j<70)&(j>30)) )
            A(EquationCounter, EquationCounter)=1;
            b(EquationCounter,1)=VIn;
        else
            A(EquationCounter, EquationCounter)=-4;
            if(j==1) %this is the first column
                b(EquationCounter, 1)=b(EquationCounter,1)-VOut; %left point is on boundary
            else%store the coefficient of the left point
                A(EquationCounter,EquationCounter-1)=1.0;
            end
            if(j==points) %this is the last column
                b(EquationCounter, 1)= b(EquationCounter,1)-VOut;%on right boundary
            else%store coefficient of right boundary
                A(EquationCounter, EquationCounter+1)=1.0;
            end
            if(i==1) %this is the first row
                b(EquationCounter,1)=b(EquationCounter,1)-VOut; %top point is on boundary
            else%store coefficient of top point
                A(EquationCounter, EquationCounter-points)=1;
            end
            if(i==points)
                b(EquationCounter,1)=b(EquationCounter,1)-VOut; %bottom point is on boundary
            else%store coefficient of bottom point
                A(EquationCounter, EquationCounter+points)=1.0;
            end
        end
        EquationCounter=EquationCounter+1;
    end
end

%graph voltage
V=A\b; %obtain the vector of voltages
V_Square=reshape(V, points, points);%convert values into a rectangular matrix
surf(V_Square); %obtain the surface figure
title('Voltage (V)')
zlabel('Voltage');
figure;

%graph h
[C,h] = contour(V_Square);% obtain the contour figure
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
colormap cool;
title('Magnetic Field Strength (H)')
figure;

%graph electric fields
contour(V_Square);
title('Electric Field (E)')
[px,py] = gradient(V_Square);
hold on, quiver(-px,-py), hold off%obtain the electric field map by using E=-Gradient(V)