function dy = order_n( n,t,y )

dy=ones(n,1);
for i=1:n-1
dy(i)=y(i+1);
end

dyy(n)=-0.5.*dy.*y(1);

end

