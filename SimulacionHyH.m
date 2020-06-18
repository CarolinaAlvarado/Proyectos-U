%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Modelo de Hodgkin y Huxley%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clc;

%%%%%%%%%
%Periodo%
%%%%%%%%%
    dt=0.01;
    t=0:dt:30;
   

%%%%%%%%%%%%%%%%%%%%%%%
%Condiciones iniciales%
%%%%%%%%%%%%%%%%%%%%%%%    
    m=0.052;
    n=0.32;
    h=0.59;
    Vm=-61;

    y0=[Vm;n;m;h];


 I_a = 28* (t >= 5 & t <= 5.4);

 I_inj= I_a + 28*2*(t>=18 & t <= 18.4);


%%%%%%%
%ODE45%
%%%%%%%

[t,Vm]=ode45(@HH,t,y0);
OD=Vm(:,1);
ODn=Vm(:,2);
ODm=Vm(:,3);
ODh=Vm(:,4);

%%%%%%%%%%
%%%Plot%%%
%%%%%%%%%%
plot(t,OD);
legend('Potencial de Acción');
xlabel('Tiempo (ms)');
ylabel('Voltaje (mV)');
grid on;
title('Cambio de Voltaje en Modelo Hodgkin-Huxley');
figure
plot(t,ODn,t,ODm,t,ODh);
ylabel('Particulas');
xlabel('Tiempo (ms)');
grid on;
legend('n','m','h');
figure
plot(t, I_inj);
ylabel('Corriente');
xlabel('Tiempo');
grid on;
title('CORRIENTE ESTÍMULO');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Alpha y Beta de cada particula%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



 

  


 %%%%%%%%%%%%%%%%%%%%%%%%%%
%Ecuaciones Diferenciales%
%%%%%%%%%%%%%%%%%%%%%%%%%%
