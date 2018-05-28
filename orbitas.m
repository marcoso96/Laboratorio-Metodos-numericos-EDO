
t=linspace(Tini, Tfin, n);
u=Metodo_theta('myf', u0, t, theta);

figure(1)
plot(u(:,7), u(:,8), 'kdiamond')
axis('square')
xlabel('x','fontsize', 25)
ylabel('y', 'fontsize', 25)
title('Posicion de cuerpos 1 y 2 en el plano de movimiento - Euler implicito','fontsize', 30)

theta=0.5;
u=Metodo_theta('myf', u0, t, theta);

figure(2)
plot(u(:,7), u(:,8), 'kdiamond')
xlabel('x','fontsize', 25)
ylabel('y', 'fontsize', 25)
title('Posicion de cuerpos 1 y 2 en el plano de movimiento - Craig Nicholson','fontsize', 30)

theta=0;
u=Metodo_theta('myf', u0, t, theta);

figure(3)
plot(u(:,7), u(:,8), 'kdiamond')
xlabel('x','fontsize', 25)
ylabel('y', 'fontsize', 25)
title('Posicion de cuerpos 1 y 2 en el plano de movimiento - Euler explicito','fontsize', 30)
