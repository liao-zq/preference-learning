clear;clc;close all; 
x=rand(100,1);
[K,X]=sort(x);
y=rand(100,1);
[J,Y]=sort(y);
a=zeros(200,200);
for k=1:98
    for j=1:98
        z=[x(k:k+2),y(j:j+2)];
        zz=(z-min(z)).^0.2;
        cci=sum(zz.*[.4 .3],2)+min(zz,[],2).*.3;
%         ci =sum(z.*[.4 .3],2)+min(z,[],2).*.3;
        if cci(1)>0.5
            a(k,j)=cci(1);
        else
            a(k,j)=0;
        end
    end
    
end
A=a(X,Y);
bar3(A,'blue');
hold on;
set(gca,'YDir','normal')