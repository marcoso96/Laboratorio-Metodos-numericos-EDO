#Prueba ejercicio 1, dos cuerpos con metodo theta

Tini=0;
Tfin=2*pi;
u0=[0 1 1 0 0 -1 -1 0];
n=100:200:2000;
e0=zeros(length(n),1);
e05=zeros(length(n),1);
e1=zeros(length(n),1);
elsode=zeros(length(n),1);
h=zeros(length(n),1);
t0=zeros(length(n),1);
t05=zeros(length(n),1);
t1=zeros(length(n),1);
tlsode=zeros(length(n),1);

lsode_options("integration method", "adams"); 

for i=1:length(n)

  h(i)=(Tfin-Tini)/n(i);
  t=Tini:h(i):Tfin;
  
  terr=time();
  u=lsode('myf', u0, t);
  elsode(i)=norm([u0(3);u0(4)] - [u(end, 3);u(end, 4)]);
  tlsode(i)=time()-terr;
  
  clear u
  terr=time();
  [u, e0(i,1)]=Metodo_theta('myf', u0, t, 0);
  t0(i)=time()-terr;
  
  clear u
  
  terr=time();
  [u, e05(i,1)]=Metodo_theta('myf', u0, t, 0.5);
  t05(i)=time()-terr;
  
  clear u
  
  terr=time();
  [u, e1(i,1)]=Metodo_theta('myf', u0, t, 1);  
  t1(i)=time()-terr;
  
  clear u
endfor
        
figure(5);
loglog(h, elsode, '--mo', 'markersize', 18,'markerfacecolor', 'm',h,e05,'--kdiamond', 'markersize', 18,'markerfacecolor', 'k',h, e0,'--bs', 'markersize', 18, 'markerfacecolor', 'b',  h,e1, 'markersize', 18,'--r^','markerfacecolor', 'r');
ha=legend({'LSODE', 'Craig-Nicholson','E. Explicito','E. Implicito'},'FontSize', 30, 'location', 'northeastoutside' );
set (ha, "fontsize", 24) 
set(gca(), 'fontsize', 26);
xlabel('Paso de tiempo h', 'fontname', 'Helvetica', 'fontsize', 30);
ylabel('Error', 'fontname', 'Helvetica', 'fontsize', 30);

figure(6);
loglog(h, tlsode, '--mo', 'markersize', 18,'markerfacecolor', 'm',h,t05,'--kdiamond', 'markersize', 18,'markerfacecolor', 'k',h, t0,'--bs', 'markersize', 18, 'markerfacecolor', 'b',  h,t1, 'markersize', 18,'--r^','markerfacecolor', 'r');
ha=legend({'LSODE', 'Craig-Nicholson','E. Explicito','E. Implicito'},'FontSize', 30, 'location', 'northeastoutside' );
set (ha, "fontsize", 20) 
set(gca(), 'fontsize', 26);
xlabel('Paso de tiempo h', 'fontname', 'Helvetica', 'fontsize', 30);
ylabel('Tiempo de computo[s]', 'fontname', 'Helvetica', 'fontsize', 30);


