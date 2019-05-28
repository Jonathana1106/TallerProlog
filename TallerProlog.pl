%2.1 progenitor(padre,hijo)%
% Hecho compuesto de dos elementos en el que se declara
% como primero al padre y de segundo al hijo.
progenitor(clara,jose).
progenitor(tomas,jose).
progenitor(tomas,isabel).
progenitor(jose,ana).
progenitor(jose,patricia).
progenitor(patricia,jaime).

%2.2.1 abuelos(abuelo,nieto)
% Reagla que permite encontrar a los abuelos de alguien
% basado en los hechos anteriores.
abuelos(X,Z):-progenitor(Y,Z),progenitor(X,Y).

%2.2.2 bisabuelo(bisabuelo,nieto)
% Regla que permite encontrar a los bisabuelos de alguien
% basado en lso hechos anteriores y que utiliza la regla
% abuelos.
bisabuelos(X,Z):-abuelos(Y,Z),progenitor(X,Y).

%2.3 Hechos
valioso(oro).
mujer(ana).
%%%%%%%%%%%%%%%%%%%%%%%%
%Grupo especial de 2.4 %
mujer(alice).          %
mujer(victoria).       %
%%%%%%%%%%%%%%%%%%%%%%%%
tiene(juan,oro).
padre(juan,maria).
%presta(objeto,prestamista,beneficiado)%
presta(libro,juan,maria).
presta(lapiz,juan,pedro).
presta(borrador,pedro,juan).

%2.4 Hechos
varon(albert).
varon(edward).
% Las mujeres de este hecho se declaran anteriormente
% en 2.3 para evitar problemas de discontinuidad de hechos.
%padres(hijo, madre, padre)%
padres(edward,victoria,albert).
padres(alice,victoria,albert).
%hermana(mujer,herman@s)%
hermana_de(X,Y):- mujer(X),padres(X,A,B),padres(X,A,B),not(X=Y).

%2.5 miembro(ele, lista)
% Hechos y reglas para encontrar si un elemento es
% miembro de una lista. Si el elemento buscado se
% encuentra es igual a la cabeza de la lista se habra
% encontrado, si no, se llama a la misma regla pero,
% se le pasa el elemento a buscar y el resto de la lista
% sin la cabeza anterior ua que esta ya se ha comparado.
miembro(X,[X|_]).
miembro(X,[_|Resto]):-miembro(X,Resto).

%2.6 inversa(listaOriginal, listaInvertida)
% Regla que recibe una lista y determina su inversa, o
% recibe dos listas y retorna verdadero o falso si una
% es la inversa de la otra.
inversa(O, I):-inversa(O, [], I).
inversa([], Lista, Lista).
inversa([H|T], Lista, I):-inversa(T, [H|Lista], I).

%2.7 longitud(lista, size)
% Regla que recibe una lista y determina el tamaño de
% la misma.
longitud([], 0).
longitud([_|RL],X):-longitud(RL,Y), X is Y+1.
%longitud([_|L],X+1):-longitud(L,X)%

%2.8 acontecimiento(año, evento)%
% Hechos sobre acontecimientos compuesto de dos
% elementos, el año del acontecimiento y en donde
% sucedio el mismo.
% Basado en los mundiales de futbol se tiene el
% año y el campeon en dicho año.
acontecimiento(2018,francia).
acontecimiento(2014,alemania).
acontecimiento(2010,españa).
acontecimiento(2006,italia).
acontecimiento(2002,brasil).
acontecimiento(1998,francia).
acontecimiento(1994,brasil).
acontecimiento(1990,alemania).
acontecimiento(1986,argentina).
acontecimiento(1982,italia).
acontecimiento(1978,argentina).
acontecimiento(1974,alemania).
acontecimiento(1970,brasil).
acontecimiento(1966,inglaterra).
acontecimiento(1962,brasil).
acontecimiento(1958,brasil).
acontecimiento(1954,alemania).
acontecimiento(1950,uruguay).
acontecimiento(1938,italia).
acontecimiento(1934,italia).
acontecimiento(1930,uruguay).

fechaEvento():- write("Ingrese un año de un mundial de futbol, para obtener al campeon de dicho evento")
,nl
,read(X)
,acontecimiento(X, Y)
,write(Y).
