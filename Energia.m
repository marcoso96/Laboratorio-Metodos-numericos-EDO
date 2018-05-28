Tini=0;
Tfin=pi;
u0=[0 0.5 1 0 0 -0.5 -1 0];
n=10000;
h=(Tfin-Tini)/n;
t=Tini:h:Tfin;

[u_0, ~]=Metodo_theta('myf', u0, t, 0);
[u05, ~]=Metodo_theta('myf', u0, t, 0.5);
[u1, ~]=Metodo_theta('myf', u0, t, 1);
ulsode=lsode('myf', u0, t);   

#normalizada por la masa
Energia0=zeros(n+1,1);
Energia05=zeros(n+1,1);
Elsode=zeros(n+1,1);
Energia1=zeros(n+1,1);

Energia1=((u1(:,1).^2+u1(:,2).^2+u1(:,5).^2+u1(:,6).^2)*2)-16./((u1(:,3)-u1(:,7)).^2+(u1(:,4)-u1(:,8)).^2).^0.5;
Energia05=((u05(:,1).^2+u05(:,2).^2+u05(:,5).^2+u05(:,6).^2)*2)-16./((u05(:,3)-u05(:,7)).^2+(u05(:,4)-u05(:,8)).^2).^0.5;
Energia0=((u_0(:,1).^2+u_0(:,2).^2+u_0(:,5).^2+u_0(:,6).^2)*2)-16./((u_0(:,3)-u_0(:,7)).^2+(u_0(:,4)-u_0(:,8)).^2).^0.5;
Elsode=((ulsode(:,1).^2+ulsode(:,2).^2+ulsode(:,5).^2+ulsode(:,6).^2)*2)-16./((ulsode(:,3)-ulsode(:,7)).^2+(ulsode(:,4)-ulsode(:,8)).^2).^0.5;
  
figure(5);
plot(t, Energia0, 'mo', 'markersize', 7,'markerfacecolor', 'm',t,Energia05,'kdiamond', 'markersize', 7,'markerfacecolor', 'k',t, Energia1,'bs', 'markersize', 7, 'markerfacecolor', 'b',  t,Elsode, 'markersize', 7,'r^','markerfacecolor', 'r');
ha=legend({'Euler Explicito', 'Craig-Nicholson','E. Implicito','LSODE'}, 'location', 'northeastoutside' );
set (ha, "fontsize", 22) 
set(gca(), 'fontsize', 26);
xlabel('Tiempo[s]', 'fontname', 'Helvetica', 'fontsize', 30);
ylabel('Energia mecanica del sistema [J]', 'fontname', 'Helvetica', 'fontsize', 30);
