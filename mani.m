clc
clear
close all

syms n t
%% asigna un valor a pi
p=pi;
%%
funcion =sqrt(-t^2+((2/5)*sqrt((9*t^2)+1))-9/25);
funcion_2 = -sqrt(-t^2+((2/5)*sqrt((9*t^2)+1))-9/25);

lim_a = -sqrt(19)/5;
lim_b = sqrt(19)/5;
w= pi/(sqrt(19)/5);

disp(lim_a);
disp(lim_b);

%% Encontramos a(0)
%a0=(int(0*t,t,-p,0)+int(t,0,p))/p
Ao = 1/(sqrt(19)/5)*int(funcion,'t',lim_a,lim_b);
Ao_2 = 1/(sqrt(19)/5)*int(funcion_2,'t',lim_a,lim_b);
disp(Ao);

%% Encontramos a(n)
%an=(int(0*cos(n*w*t),t,-p,0)+int(t*cos(n*w*t),t,0,p))/p
intAn = funcion * cos(n*w*t);
intAn_2 = funcion_2 * cos(n*w*t);
An = 1/(sqrt(19)/5)*int(intAn,'t',lim_a,lim_b);
An_2 = 1/(sqrt(19)/5)*int(intAn_2,'t',lim_a,lim_b);
disp(An);

%% Encontramos b(n)
 %bn=(int(0*sin(n*w*t),t,-p,0)+int(t*sin(n*w*t),t,0,p))/p
intBn = funcion * sin(n*w*t);
Bn = 1/(sqrt(19)/5)*int(intBn,'t', lim_a,lim_b);
intBn_2 = funcion_2 * sin(n*w*t);
Bn_2 = 1/(sqrt(19)/5)*int(intBn_2,'t', lim_a,lim_b);
disp(Bn);
 

m = 55;

for n=1:m
 ank=subs(An,'n',n);
 bnk=subs(Bn,'n',n);
 fx(n,:) = sum(ank*cos(w*n*t)+bnk*sin(w*n*t));
 ank_2=subs(An_2,'n',n);
 bnk_2=subs(Bn_2,'n',n);
 fx_2(n,:) = sum(ank_2*cos(w*n*t)+bnk_2*sin(w*n*t));
end
disp(fx);
%y = a0/2 + sum(fx);
t=linspace(lim_a,lim_b,1000);
fy = subs(funcion,'t',t);
plot(t,fy,'b','linewidth', 1);

hold on
fy_2 = subs(funcion_2,'t',t);
plot(t,fy_2,'b','linewidth', 1);

%fx=subs(fx,t);
%fx(n+1,:)=zeros(1,1000);
y = Ao/2 + sum(fx);
fplot(y,[lim_a, lim_b],'r','linewidth', 1.5);
y_2 = Ao_2/2 + sum(fx_2);
fplot(y_2,[lim_a, lim_b],'r','linewidth', 1.5); grid on

%tt=linspace(lim_a,lim_b,1000);

%t1=-lim_a:0.01:0;
%t2=0:0.1:pi;
%plot(t1,0*t1,t2,t2,'r') 

