function [u, e]=Metodo_theta(func, u_0, t, theta)
  
  n=size(t)(2);
  m=size(u_0)(2);
  k=20; #iteraciones para encontrar delta2
   
  u(1,:)=u_0; #impongo condicion inicial
  
  if(theta!=0)
    
    for j=2:n 

      h=t(j)-t(j-1);
      
      delta1=u(j-1,:)+h*(1-theta)*feval(func, u(j-1, :), t(j-1)); #parte explicita
      u(j,:)=u(j-1,:); #lo mas trucho del programa, consultar. Seria mi semilla
      
      for i=1:k
        viejo=u(j,:);  
        delta2=feval(func,u(j,:), t(j));
        u(j,:)=h*theta*delta2+delta1; #implicita por punto fijo
        
        if(norm(viejo-u(j,:))<1e-6) 
          break
        endif
      endfor      
      i
      
    endfor
  
  else 
    
    u=Euler("myf", u_0, t);   
      
  endif
  
  e=norm([u(1, 3);u(1,4)] - [u(end, 3);u(end, 4)]);

endfunction