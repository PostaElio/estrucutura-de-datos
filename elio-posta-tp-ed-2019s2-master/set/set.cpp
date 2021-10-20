#include "set.h"
#include "../common/Common.h"

struct Node {
   Hechizo elem; // el elemento que este nodo almacena
   Node* next; // siguiente nodo de la cadena de punteros
};

struct SetSt {
   int size; // cantidad de elementos del conjunto
   Node* first; // puntero al primer elemento
};

typedef SetSt* Set;

/**
  Invariantes de representacion:
    - size es la cantidad de nodos
    - no hay nodos con hechizos repetidos
**/

/// Proposito: retorna un conjunto de hechizos vacio
/// Costo: O(1)
Set emptyS() {
    Set s = new SetSt;
    s->size = 0;
    s->first = NULL;
    return s;
}

/// Proposito: retorna la cantidad de hechizos
/// Costo: O(1)
int sizeS(Set s) {
    return s->size;
}

/// Proposito: indica si el hechizo pertenece al conjunto
/// Costo: O(h), h = cantidad de hechizos
bool belongsS(Hechizo h, Set s){
    bool res = false;
    Node* pAux = s->first;
    while (pAux != NULL){
        res = res || mismoHechizo(h,pAux->elem);
        pAux= pAux->next;
    }
    return res;
}

/// Proposito: agrega un hechizo al conjunto
/// Costo: O(h), h = cantidad de hechizos
void agregarElemento(Hechizo h, Set s){
    if (!belongsS(h,s)){
    Node* n = new Node;
    n->elem = h;
    n->next= s->first;
    s->first= n;
    s->size= s->size + 1;
}}

void addS(Hechizo h, Set s) {
    if (not(belongsS(h,s))){
        agregarElemento(h,s);
    }
}

/// Proposito: borra un hechizo del conjunto (si no existe no hace nada)
/// Costo: O(h), h = cantidad de hechizos
void eliminarHechizo(Hechizo h, Set s){
    Node* n = s->first;
    if(n!=NULL && n->elem == h){
        Node* tmp = n;
        s->first = n->next;
        delete tmp;
        s->size = s->size - 1;
    }else{
        while(n->next!=NULL && n->next->elem==h){
            n = n->next;
        }
        if (n->next->elem==h){
        Node* l = n->next;
        n->next = n->next->next;
        delete l;
        s->size = s->size - 1;
        }

    }
}

void removeS(Hechizo h, Set s) {
    if(belongsS(h,s)){
      eliminarHechizo(h,s);
    }
}


/// Proposito: borra toda la memoria consumida por el conjunto (pero no la de los hechizos)
/// Costo: O(n)s
void destroyS(Set s) {
    delete s;
}

Set copiar(Set s){
    Set se = emptyS();
    Node* n = s-> first;
    while (n!= NULL){
        addS(n->elem,se);
        n = n->next;
    }
    return se;
}

/// Proposito: retorna un nuevo conjunto que es la union entre ambos (no modifica estos conjuntos)
/// Costo: O(h^2), h = cantidad de hechizos
Set unionS(Set s1, Set s2) {
    Set s3 = copiar(s1);
    Node* n = s2->first;
    while (not(n == NULL)){
        addS(n->elem, s3);
        n = n->next;
    }
    return s3;
}
