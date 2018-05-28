# Laboratorio-Metodos-numericos-EDO
Metodos numericos para la resolucion de ecuaciones diferenciales ordinarias

Implementaciones
-La implementacion del inciso 1) se encuentra en el archivo Gravedad.m 
-La implementacion del inciso 2) se encuentra en el archivo Energia.m

Programas

-myf.m: Para un vector de velocidades y posiciones de dos cuerpos, la funcion aplica la ley de gravitacion universal para obtener la aceleracion y la velocidad de ambos cuerpos interactuantes.
-Metodo_theta: Aplica el metodo theta, devovliendo una matriz de velocidades y posiciones para cada tiempo de cada uno de los cuerpos. Para la parte implicita, el metodo realiza una iteracion de punto fijo, con la solucion calculada antteriormente como semilla, para hallar la funcion en el punto aun no calculado. Si theta es igual a cero, el metodo directamente aplica el metodo de Euler explicito
-Orbitas.m: grafica las trayectorias de los cuerpos con la primera condicion inicial provista
