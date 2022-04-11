clc
clearvars 

y=0;
yp=0;
ypf=1;
%y'''=-(1/2)y''y

dx=0.1;
x=0:dx:10;
ecart=1e-6;

diff=1;
est=[0 2];
k=0

while abs(diff)>ecart
   
    ypp=(est(1)+est(2))./2;
    
for i=1:length(x)-1
    
    h(i)=-0.5.*ypp(i).*y(i);
    g(i)=ypp(i);
    f(i)=yp(i);
    
    yepp12(i)=ypp(i)+(dx./2).*h(i);
    yep12(i)=yp(i)+(dx./2).*g(i);
    ye12(i)=y(i)+(dx./2).*f(i);
    
    he12(i)=-0.5.*yepp12(i).*ye12(i);
    ge12(i)=yepp12(i);
    fe12(i)=yep12(i);
    
    yeepp12(i)=ypp(i)+(dx./2).*he12(i);
    yeep12(i)=yp(i)+(dx./2).*ge12(i);
    yee12(i)=y(i)+(dx./2).*fe12(i);
    
    hee12(i)=-0.5.*yeepp12(i).*yee12(i);
    gee12(i)=yeepp12(i);
    fee12(i)=yeep12(i);
    
    yepp1(i)=ypp(i)+(dx./2).*hee12(i);
    yep1(i)=yp(i)+(dx./2).*gee12(i);
    ye1(i)=y(i)+(dx./2).*fee12(i);
    
    he1(i)=-0.5.*yepp1(i).*ye1(i);
    ge1(i)=yepp1(i);
    fe1(i)=yep1(i);
    
    hbar(i)=h(i)+2.*he12(i)+2.0*hee12(i)+he1(i);
    gbar(i)=g(i)+2.*ge12(i)+2.0*gee12(i)+ge1(i);
    fbar(i)=f(i)+2.*fe12(i)+2.0*fee12(i)+fe1(i);
    
    ypp(i+1)=ypp(i)+(dx./6).*hbar(i);
    yp(i+1)=yp(i)+(dx./6).*gbar(i);
    y(i+1)=y(i)+(dx./6).*fbar(i);
end
diff=yp(end)-ypf;
    if diff>0
        est(2)=ypp(1);
    elseif diff<0
        est(1)=ypp(1);
    end
  k=k+1
end

plot(x,y,'r',x,yp,'b',x,ypp,'g')