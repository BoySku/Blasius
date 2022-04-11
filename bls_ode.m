clc
clearvars 

eps=10^-6;
diff=1;
est=[0.1 2];
ypf=1;

while abs(diff)>eps
   
    ypp=(est(1)+est(2))./2;
    
[x,y]=ode45('blas',[0 10],[0 0 ypp]);

diff=y(end,2)-ypf;
    if diff>0
        est(2)=ypp(1);
    elseif diff<0
        est(1)=ypp(1);
    end

end

%% Partie animation 
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