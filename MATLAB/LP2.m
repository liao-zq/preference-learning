clear;close all;clc;
a=[0.5	0.5	0.5	0.2	0.3	0.5
    0.5	0.5	0.4	0.2	0.3	0.5
    0.9	0.9	0.9	0.8	0.9	0.9
    0.8	0.7	0.8	0.8	0.5	0.8
    0.9	0.9	0.9	0.9	0.8	0.9
    0.9	0.9	0.9	0.7	1.0	0.9
    0.9	0.9	0.9	0.8	0.9	0.9
    0.9	0.9	0.9	0.9	0.8	0.9
    0.8	0.9	0.8	0.8	0.8	0.8
    0.7	0.9	0.6	0.5	0.8	0.7
    0.7	0.9	0.6	0.4	0.9	0.7
    0.7	0.9	0.6	0.6	0.7	0.7
    0.4	0.0	0.5	0.6	0.7	0.4
    0.1	0.9	0.1	0.0	0.8	0.0
    0.0	0.9	0.1	0.0	0.8	0.0
    0.0	0.9	0.0	0.0	0.8	0.0
    0.4	0.0	0.4	0.3	0.7	0.4
    0.4	0.0	0.4	0.4	0.6	0.4
    0.4	0.0	0.4	0.2	0.8	0.4
    0.8	0.8	0.8	0.6	0.8	0.8
    0.7	0.5	0.6	0.5	0.0	0.6
    0.6	0.3	0.7	0.8	0.9	0.6
    0.7	0.5	0.7	0.8	0.9	0.7
    0.7	0.5	0.7	0.6	0.3	0.7
    0.7	0.5	0.7	0.6	0.4	0.7
    0.8	0.9	0.8	0.8	0.8	0.8
    ];
f(1,26)=0;
h=0;
time=zeros(1,10);
% for ii=1:10
%     tic
for i=18 %a
    for j=19 %b
        x=nchoosek(1:6,2);
        y=a(i,:);
        y1=a(j,:);

        c=[a([3 5 6 7 8],:);y;y1];
        Z(7,15)=0;
        for k=1:7
            z=c(k,:);
            z1=min(z(x'));
            Z(k,:)=z1;
        end
        z2=[c Z];
       
        zz=z2([2 3 3 5 6],:)-z2([1 1 4 4 7],:);%7 6--possible,6 7---necessary
        q=[zeros(1,21),-1];
        A=[zz [1 1 1 1 1]' %preference constraints #last 0 means possible, 1 means necessary
            zeros(1,7) 1 zeros(1,13) 1
            zeros(1,8) 1 zeros(1,12) 1
            zeros(1,10) 1 zeros(1,10) 1
            zeros(1,13) -1 zeros(1,7) 1
            zeros(1,14) -1 zeros(1,6) 1  %creteria constraints
            -1 zeros(1,5) -1.*ones(1,5) zeros(1,11)
            0 -1 zeros(1,4) -1 zeros(1,4) -1.*ones(1,4) zeros(1,7)
            0 0 -1 zeros(1,4) -1 zeros(1,3) -1 zeros(1,3) -1.*ones(1,3) zeros(1,4)
            zeros(1,3) -1 zeros(1,4) -1 zeros(1,3) -1 0 0 -1 0 0 -1 -1 0 0
            zeros(1,4) -1 zeros(1,4) -1 zeros(1,3) -1 0 0 -1 0 -1 0 -1 0
            zeros(1,5) -1 zeros(1,4) -1 zeros(1,3) -1 0 0 -1 0 -1 -1 0  % each mobius>0
            -1 zeros(1,5) -1 zeros(1,15)
            -1 zeros(1,6) -1 zeros(1,14)
            -1 zeros(1,7) -1 zeros(1,13)
            -1 zeros(1,8) -1 zeros(1,12)
            -1 zeros(1,9) -1 zeros(1,11)  %mobius m1+other>0
            0 -1 zeros(1,4) -1 zeros(1,15)
            0 -1 zeros(1,9) -1 zeros(1,10)
            0 -1 zeros(1,10) -1 zeros(1,9)
            0 -1 zeros(1,11) -1 zeros(1,8)
            0 -1 zeros(1,12) -1 zeros(1,7)  %mobius m2+other>0
            0 0 -1 zeros(1,4) -1 zeros(1,14)
            0 0 -1 zeros(1,8) -1 zeros(1,10)
            0 0 -1 zeros(1,12) -1 zeros(1,6)
            0 0 -1 zeros(1,13) -1 zeros(1,5)
            0 0 -1 zeros(1,14) -1 zeros(1,4)  %mobius m3+other>0
            zeros(1,3) -1 zeros(1,4) -1 zeros(1,13)
            zeros(1,3) -1 zeros(1,8) -1 zeros(1,9)
            zeros(1,3) -1 zeros(1,11) -1 zeros(1,6)
            0 0 0 -1 zeros(1,14) -1 zeros(1,3)
            0 0 0 -1 zeros(1,15) -1 zeros(1,2)  %mobius m4+other>0
            zeros(1,4) -1 zeros(1,4) -1 zeros(1,12)
            zeros(1,4) -1 zeros(1,8) -1 zeros(1,8)
            zeros(1,4) -1 zeros(1,11) -1 zeros(1,5)
            zeros(1,4) -1 zeros(1,13) -1 zeros(1,3)
            zeros(1,4) -1 zeros(1,15) -1 0  %mobius m5+other>0
            zeros(1,5) -1 zeros(1,4) -1 zeros(1,11)
            zeros(1,5) -1 zeros(1,8) -1 zeros(1,7)
            zeros(1,5) -1 zeros(1,11) -1 zeros(1,4)
            zeros(1,5) -1 zeros(1,13) -1 zeros(1,2)
            zeros(1,5) -1 zeros(1,14) -1 0];  %mobius m6+other>0
        B=zeros(46,1);
        lb=[zeros(6,1);ones(16,1).*(-10)];
        ub=ones(22,1);
        aeq=[ones(1,21) 0
            1 -1 zeros(1,5) ones(1,4) -1.*ones(1,4) zeros(1,7)
            1 0 -1 zeros(1,3) 1 0 ones(1,3) -1 zeros(1,3) -1.*ones(1,3) zeros(1,4)
            1 0 0 -1 0 0 1 1 0 ones(1,3) -1 0 0 -1 0 0 -1 -1 zeros(1,2)
            1 zeros(1,3) -1 zeros(1,8) -1 0 0 -1 0 -1 0 -1 0
            1 zeros(1,4) -1 zeros(1,8) -1 0 0 -1 0 -1  -1 0]; % sum(m)=0
        beq=[1;zeros(5,1)];
        [X,fval]=linprog(q,A,B,aeq,beq);
%         if isempty(X)
%             fval=0;
%         end    %possible relation
        f(i,j)=fval;
                
    end
    

end
% time(ii)=toc;
% end
% mean(time)
% min(time)
% max(time)
