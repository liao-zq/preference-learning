clear;close all;clc;
a=[0.9 0.9 0.9 0.8 0.9 0.9
    0.9	0.9	0.9	0.9	0.8	0.9
    0.9	0.9	0.9	0.7	1.0	0.9
    0.9	0.9	0.9	0.8	0.9	0.8
    0.9	0.9	0.9	0.9	0.8	0.9
    ];
% b=a-min(a);
c=(a-min(a)).^0.473;
u_w=sum(1/6.*a,2);
u_c=sum(c,2);
b=a(:,[1 2 3 6]);
s=[0.9 0.9 0.9 0.9];
[c,ic]=ismember(b,s,'rows');
x=find(ic);
aa=a(x,:);
% [~,ia,ic]=unique(a,'rows');
% splitapply(@(x){x}, find(ic), ic);
% bar(a');