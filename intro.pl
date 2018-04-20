pais(mexico).
pais(coreaDelSur).
pais(eua).
pais(argentina).
pais(suecia).

leGusta(maluma, gasolina).
leGusta(miguel, fer).
leGusta(fer, miguel).
leGusta(tomasElTren, carbon).
leGusta(bill, helado).

persona(maluma).
persona(miguel).
persona(fer).
persona(bill).

esPropiedad(bill, alto).

transporte(tomasElTren).

combustible(gasolina).
combustible(carbon).

comida(chocolate).
comida(bananas).
comida(cheese).

animal(gato).

come(bill, chocolate).
come(bill, cheese).
come(bill, bananas).
come(gato, custard).
come(perro, custard).

owns(fred, lapiz).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
golpeo_a_con(jane, jimmy, bate).
toma_de_un(bill, jane, edamCheese).
direccion(16, throgmorton).
vive_numero_calle_en(jimmy, 16, throgmorton, londres).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
relacion(X, Y) :- leGusta(X, Y), leGusta(Y, X), persona(X), persona(Y).
isAnimalBecauseFood(X, Y) :- Y=custard, animal(X).
% likesOfFred(P, O) :- P=jim, owns(fred, O).
likesOfFred(jim, O) :- owns(fred, O).