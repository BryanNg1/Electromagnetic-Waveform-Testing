K=200.0;%number of turns
I=5.0;%current
Rin=1.5;%inner radius
Rout=2.5;%outer radius
Rav=0.5*(Rin+Rout); %avg radius
a=(Rout-Rin)/2; %cross section radius
Numberofsegments=2000;%biot savart
xpoint=20.0;
ypoint=20.0;
Xmin=-4.0;%min x
Xmax=4.0;% max x
Ymin=-4.0;%min y
Ymax=4.0;%max y
[datax,datay]=meshgrid(Xmin:0.4:Xmax,Ymin:0.4:Ymax);%array plot plane
plotz=0.0;%x-y plane points z =0
Hx=zeros(xpoint+1,ypoint+1);%x component
Hy=zeros(xpoint+1,ypoint+1);%y component

for i=1:(xpoint+1) %repeat x direction
    for j=1:(ypoint+1)%repeat y direction
       currx=datax(i,j);%x coordinate plot point
       curry=datay(i,j);%y coordinate plot point
       observeR=[currx curry plotz];%position vector
       for n=1:Numberofsegments-1
         alphn=((2*pi*K)*(n-1))/Numberofsegments;%parametric angle
         phin= 2*pi*(n-1)/Numberofsegments;%angular position
         rn=Rav+a*cos(alphn);%radial position
         xs=rn*cos(phin);%x coordinate starting point current segment
         ys=rn*sin(phin);%y coordinate starting point current segemnt
         zs=-a*sin(alphn); %Z coordinate starting point current segment
         alphn_plus=((2*pi*K)*(n))/Numberofsegments;%parametric angle current segment
         phin_plus= 2*pi*(n)/Numberofsegments;% angular position of the end point
         rn_plus=Rav+a*cos(alphn_plus);%radial pos
         xe=rn*cos(phin_plus);
         ye=rn_plus*sin(phin_plus);
         ze=-a*sin(alphn_plus);
         delt1=[(xe-xs) (ye-ys) (ze-zs)];%vector diff length
         Rcent= 0.5*[(xs+xe) (ys+ye) (zs+ze)];%position vector center of the segment
         R=observeR-Rcent;
         magr=norm(R);%distance between the two points
         unitr=R/magr;%unit vector direction of R
         dH=(I/(4*pi*magr*magr))*cross(delt1,unitr);%Biot savart law
         Hx(i,j)=Hx(i,j)+dH(1,1);  %add
         Hy(i,j)=Hy(i,j)+dH(1,2); %add
       end% end of loop n
  end % end of loop j
end % end of loop i
quiver(datax,datay,Hx,Hy)
xlabel('x(m)');
ylabel('y(m)');