function xdot=myf(x, t)
  
  r=sqrt((x(7)-x(3))^2+(x(8)-x(4))^2)^3;
  
  #Calculo el valor de v1_punto y v1, equivalentes a x1_2punto y x1_punto 
  xdot(1)=4*(x(7)-x(3))/r;
  #Calculo el valor de w1_punto y w1, equivalentes a y1_2punto y y1_punto
  xdot(2)=4*(x(8)-x(4))/r;
  xdot(3)=x(1);
  xdot(4)=x(2);
  xdot(5)=4*(x(3)-x(7))/r;
  xdot(6)=4*(x(4)-x(8))/r;
  xdot(7)=x(5);
  xdot(8)=x(6);
  
endfunction