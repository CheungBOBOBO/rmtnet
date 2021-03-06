%Experiment:GaussianRandom
%Plot:HistogramoftheeigenvaluesofX'X/m
%Theory:Marcenko−Pasturasn−>infinity
%%Parameters
clear all;
close all;
t=10; %trials
r=1; % aspectratio
n=2000; % matrixcolumnsize
m=round(n/r);
v=[]; % eigenvaluesamples
dx=.05; % binsize

%%Experiment
for i=1:t
    X=sqrt(12)*(rand(m,n) - 0.5); %random mxn matrix with 0 mean and 1 variance, equal to randn(m,n)
    s=X'*X; %symposdef matrix
    v=[v;eig(s)]; %eigenvalues
end
v=v/m;%normalizedeigenvalues
a=(1-sqrt(r))^2;
b=(1+sqrt(r))^2;
%%Plot
[count,x]=hist(v,a:dx:b);
cla reset
bar(x,count/(t*n*dx),'y');
hold on;
%%Theory
x=linspace(a,b);
plot(x,sqrt((x-a).*(b-x))./(2*pi*x*r),'LineWidth',2);
axis([0 ceil(b) -.1 1.5]);
hold off;