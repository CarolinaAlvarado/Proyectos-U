function [dydt] = HH(t,y)
  
 
 %A temperatura ambiente
 RTF=25;
 %Capacitancia de la membrana
 Cm=1;
 
 %Conductancias
 g_Na=120;
 g_K=36;
 g_L=0.3;
 
 %Concentraciones
 %CNa_e=490;
 CNa_e=122.5;
 CK_e=20;
 CNa_i=50;
 CK_i=400;
 
 %Calculo de potenciales de Nernst
 E_Na=(-RTF*log(CNa_i/CNa_e));
 E_K=(-RTF*log(CK_i/CK_e));
 %Potencial de fuga
 E_L=-50;


 Vm = y(1);
 n = y(2);
 m = y(3);
 h = y(4);
 %%%%%%%%%%
 %Estimulo%
 %%%%%%%%%%
 
 
 %I_s= 50* (t >=5 & t<= 5.04) + 100*(t>=5.08 & t <= 5.12);
 %plot(t, I_s);
 
 %Corrientes
 I_Na=g_Na*m^3*h*(Vm-E_Na);
 I_K= g_K*n^4*(Vm-E_K);
 I_L= g_L*(Vm-E_L);  

%corrientes=[I_s;I_Na; I_K; I_L];
%corrientes
 %Hodgkin-Huxley
 dEdt=((1/Cm)*(I_s(t)-(I_Na+I_K+I_L)));
 dndt=alpha_n(Vm)*(1-n)- beta_n(Vm)*n;
 dmdt= alpha_m(Vm)*(1-m)-beta_m(Vm)*m;
 dhdt= alpha_h(Vm)*(1-h)-beta_h(Vm)*h;
 dydt = [dEdt;dndt;dmdt;dhdt];
 %dydt
end