clc;
clear all;
%Parameters and Values
m1=270;%Kg
m2=520;
m3=340;
m4=4400;
m5=12500;
kt1=847000;%N/m
kt2=2000000;
kt3=2000000;
ks1=300000;
ks2=967430;
ks3=155800;
ks4=20000000;
cd4=200000;%Ns/m
cs1=10000;
cs2=27627;
cs3=44506;
l1=1.2;%m
l2=4.8;
l3=4;
l4=4.134;
l5=6.973;
I1=18311;%kgm^2
I2=251900;
M=[m1 0   0  0  0  0  0;
   0  m2  0  0  0  0  0;
   0  0   m3 0  0  0  0
   0  0   0  m4 0  0  0;
   0  0   0  0  m5 0  0;
   0  0   0  0  0  I1 0;
   0  0   0  0  0  0  I2];


K=[kt1+ks1 0 0 -ks1 0 ks1*l1 0;
    0 kt2+ks2 0 -ks2 0 -ks2*l2 0;
    0 0 kt3+ks3 0 -ks3 0 -ks3*l3;
    -ks1 -ks2 0 ks1+ks2+ks4 -ks4 -ks1*l1+ks2*l2+ks4*l4 ks4*l5;
    0 0 -ks3 -ks4 ks3+ks4 -ks4*l4 ks3*l3-ks4*l5;
    ks1*l1 -ks2*l2 0 -ks1*l1+ks2*l2+ks4*l4 -ks4*l4 ks2*l2^2+ks4*l4^2+ks1*l1^2 ks4*l5*l4;
    0 0 -ks3*l3 ks4*l5 -ks4*l5+ks3*l3 ks4*l4*l5 ks4*l5^2+ks3*l3^2];


C=[cs1 0 0 -cs1 0 cs1*l1 0;
    0 cs2 0 -cs2 0 -cs2*l2 0;
    0 0 cs3 0 -cs3 0 -cs3*l3;
    -cs1 -cs2 0 cs1+cs2+cd4 -cd4 -cs1*l1+cs2*l2+cd4*l4 cd4*l5;
    0 0 -cs3 -cd4 cs3+cd4 -cd4*l4 cs3*l3-cd4*l5;
    cs1*l1 -cs2*l2 0 cs2*l2-cs1*l1+cd4*l4 -cd4*l4 cs2*l2^2+cs1*l1^2+cd4*l4^2 cd4*l5*l4;
    0 0 -cs3*l3 cd4*l5 -cd4*l5+cs3*l3 cd4*l4*l5 cd4*l5^2+cs3*l3^2];

A=inv(M)* K;
[U , omega2]=eig(A);
omega=sqrt(omega2);

%% Q5 acceleration
amax=[8.196e-01,5.18,4.126,5.156,4.275,2.701,2.252];
v=[0.5,1,2,10,20,40,80];

plot(v,amax)
xlabel('v(m/s)')
ylabel('max acceleration')













































































































































































































































