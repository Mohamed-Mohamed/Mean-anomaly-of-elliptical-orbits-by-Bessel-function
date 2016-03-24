%% Coded by
% Mohamed Mohamed El-Sayed Atyya
% mohamed.atyya94@eng-st.cu.edu.eg



% Mean anomaly of elliptical orbits by Bessel function
close all; clear all; clc;
%% inputs
Me=linspace(0,2*pi,100);   % Mean anomaly
e=0.9;  % eccentricity
N=[3,10];  % number of sumution 
X = 0:0.1:20; % dummy variable to plot Bessel function
%% calculations
% exact solution
Me2=Me-e*sin(Me);
% Bessel solution
E1=Me;
E=zeros(length(N),length(Me));
for m=1:length(N)
    for n=1:N(m)
        E(m,1:length(Me))=E(m,1:length(Me))+2/n*besselj(n,n*e)*sin(n*Me);
    end
    E(m,1:length(Me))=E(m,1:length(Me))+E1;
end
% Bessel function
for i = 0:4
    J(i+1,:) = besselj(i,X);
end
%% plotting
figure(1);
set(gcf,'color','w');
hold all;
% exact solution
plot(Me,Me2,'linewidth',2);
legendInfo1{1} = ['Exact soluion']; 
% Bessel solution
for b=1:length(N)
    plot(E(b,1:length(Me)),Me,'linewidth',2);
    legendInfo1{b+1} = ['N = ' num2str(N(b))];
end
xlabel('E','fontsize',18);
ylabel('M_e','fontsize',18);
title('Mean anomaly vs True anomaly with Bessel solution','fontsize',18);
legend(legendInfo1,'location','northwest');
grid on;
xlim([0,2*pi]);
ylim([0,2*pi]);
%---------------------------------------------------------------------------------------------------------------------------------------------------------
% error
figure(2);
set(gcf,'color','w');
hold all;
for b1=1:length(N)
    plot(Me,(Me-E(b1,1:length(Me))),'linewidth',2);
    legendInfo1{b1} = ['Error of N = ' num2str(N(b1))];
end
xlabel('Me','fontsize',18);
ylabel('Exact-Bessel solution','fontsize',18);
title('Error in Eccentric anomaly  E','fontsize',18);
legend(legendInfo1,'location','northwest');
grid on;
%---------------------------------------------------------------------------------------------------------------------------------------------------------
% Bessel function
figure(3);
set(gcf,'color','w');
hold all;
plot(X,J,'LineWidth',2);
axis([0 20 -.5 1]);
grid on;
legend('J_0','J_1','J_2','J_3','J_4','Location','Best');
title('Bessel Functions of the First Kind for v = 0,1,2,3,4','fontsize',18);
xlabel('X','fontsize',18);
ylabel('J_n(X)','fontsize',18);