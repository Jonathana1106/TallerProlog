%progenitor(padre, hijo)%

progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

mujer(clara).
mujer(isabel).
mujer(ana).
mujer(paricia).

%hermana(isabel, tomas)%

hermana(X, Y):- mujer(X), progenitor(Z, X), progenitor(Z, Y).
