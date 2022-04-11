function dy = blas( t,y )

dy=ones(3,1);
dy(1)=y(2);
dy(2)=y(3);
dy(3)=-0.5.*dy(2).*y(1);

end

