 function I = I_s(t)
    I=0;
  if (t>=5)&&(t<=5.4)
     I=28; 
     %I=19.8
    elseif (t>=18)&&(t<=18.4)
     I=28*2;
   %   I=19.8*2;
  else
      I=0;
  end
  

 