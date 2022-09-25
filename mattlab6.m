VOut = 0; %NOTE most of the code is from the matlab manual
VIn = 100; %voltage of inner plate
VInouter = -50; %50V lines voltage
NumberOfXPoints = 50; %# of points in the x direction
NumberOfYPoints = NumberOfXPoints;  ; %# of points in the y direction
NumberOfUnKnowns = NumberOfXPoints*NumberOfYPoints; ; %total # of unknown
A = zeros(NumberOfUnKnowns, NumberOfUnKnowns); %matrix of coefficients
b = zeros(NumberOfUnKnowns, 1); %right side vector
EquationCounter = 1; %counter
for i = 1: NumberOfXPoints %repeats for rows
    for j = 1: NumberOfYPoints %repeats for columns
        if((i == 25)&&((j>= 1) && (j<=25))) %sets the bounds of conductor (100V line in middle)
            A(EquationCounter, EquationCounter) = 1; 
            b(EquationCounter, 1) = VIn; %V=100 for all points in inner conductor
        else
            if(((i >= 1) && (i <= 50)) && (j == 1)) %sets bounds of conductor (50V lines)
            A(EquationCounter, EquationCounter) = 1; 
            b(EquationCounter, 1) = VInouter; %V=50 for all points in inner conductor
            end
            A(EquationCounter, EquationCounter) = -4;
            if(j==1)
                b(EquationCounter, 1) = b(EquationCounter, 1) -VOut;
            else
                A(EquationCounter, EquationCounter-1) = 1.0;
            end
            if(j==NumberOfYPoints)
                b(EquationCounter, 1) = b(EquationCounter, 1) - VOut;
            else
                A(EquationCounter, EquationCounter + 1) = 1.0;
            end
            if(i==1)
                b(EquationCounter, 1) = b(EquationCounter, 1) - VOut;
            else %store coefficient of top
                A(EquationCounter, EquationCounter - NumberOfXPoints) = 1;
            end
            if(i==NumberOfXPoints)
                b(EquationCounter, 1) = b(EquationCounter, 1) - VOut;
            else %store coefficient of bottom
                A(EquationCounter, EquationCounter + NumberOfXPoints) = 1.0;
            end
        end
        EquationCounter = EquationCounter + 1;
    end
end
V = A\b;
V_Square = reshape(V, NumberOfXPoints, NumberOfYPoints); %conversion to rectangular matrix
surf(V_Square); %obtain surface figure
figure;
[C,h] = contour(V_Square); %obtain figure contour
set(h,'ShowText', 'on','TextStep', get(h, 'LevelStep')*2)
colormap cool;
figure;
contour(V_Square);
[px,py] = gradient(V_Square);
hold on, quiver(-px,-py), hold off %obtain electric field map