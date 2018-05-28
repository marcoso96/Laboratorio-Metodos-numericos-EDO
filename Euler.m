function u=Euler(func, u0, t)
  n=size(t)(2);
  m=size(u0)(2);
  
  u=zeros(n,m); #soluciones
  
  u(1,:)=u0; #impongo condicion inicial
  
  for i=2:n
    
    delta=feval(func, u(i-1,:), t(i-1));
    h=t(i)-t(i-1);
    
    #Euler explicito
    
    u(i,:)=u(i-1,:)+h*delta;
    
    endfor
endfunction
   
  