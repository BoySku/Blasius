    clc
clearvars 

y=0;
yp=0;

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

v = VideoWriter('allthree','MPEG-4');
v.FrameRate=15;
open(v)

for j=1:length(yp)
    
   
    plot(x(j),yp(j),'o')
        
    hold on
    plot(x(1:j),y(1:j),'g')
    plot(x(1:j),yp(1:j),'b')
    plot(x(1:j),ypp(1:j),'r')
    axis([0 10 0 2])
    
    legend('','y(x)','yp(x)','ypp(x)')
    
    frames=getframe(gcf);
    writeVideo(v,frames);
    
    if j ~= length(yp)
    clf
    end
   
end

close(v)


   