clc
clearvars 

y=0;
yp=0;

%y'''=-(1/2)y''y

dx=0.1;
x=0:dx:10;
eps=10^-6;

diff=1;
est=[0.1 2];
ypf=1;
while abs(diff)>eps
   
    ypp=(est(1)+est(2))./2;
    
for i=1:length(x)-1
    
    h(i)=-0.5.*ypp(i).*y(i);
    g(i)=ypp(i);
    f(i)=yp(i);
    
    ypp12(i)=ypp(i)+(dx./2).*h(i);
    yp12(i)=yp(i)+(dx./2).*g(i);
    y12(i)=y(i)+(dx./2).*f(i);
    
    h12(i)=-0.5.*ypp12(i).*y12(i);
    g12(i)=ypp12(i);
    f12(i)=yp12(i);
    
    ypp(i+1)=ypp(i)+dx.*h12(i);
    yp(i+1)=yp(i)+dx.*g12(i);
    y(i+1)=y(i)+dx.*f12(i);
end
diff=yp(end)-ypf;
    if diff>0
        est(2)=ypp(1);
    elseif diff<0
        est(1)=ypp(1);
    end
  
end

ypp(1)
plot(x,y,'r',x,yp,'b',x,ypp,'g')