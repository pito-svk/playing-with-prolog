mother_of(Person, Parent) :-
  female(Parent),
  parent_of(Person, Parent).

father_of(Person, Parent) :-
  male(Parent),
  parent_of(Person, Parent).

son_of(Parent, Person) :-
  male(Person),
  parent_of(Person, Parent).

daughter_of(Parent, Person) :-
  female(Person),
  parent_of(Person, Parent).

sibling_of(Person, Sibling) :-
  parent_of(Person, Parent),
  parent_of(Sibling, Parent),
  Person \= Sibling,
  !.

sister_of(Person, Sister) :-
    setof(
      (Person,Sister), 
      (
        Parent^(parent_of(Person, Parent), 
        daughter_of(Parent, Sister), 
        Person \= Sister, 
        not(Parent = god))
      ), 
      Sisters),
      member((Person,Sister), Sisters),
      \+ (Sister @< Person, member((Sister,Person), Sisters)).

brother_of(Person, Brother) :-
    setof(
      (Person,Brother), 
      (
        Parent^(parent_of(Person, Parent), 
        son_of(Parent, Brother), 
        Person \= Brother, 
        not(Parent = god))
      ), 
      Brothers),
      member((Person,Brother), Brothers),
      \+ (Brother @< Person, member((Brother,Person), Brothers)).

uncle_of(Person, Uncle) :-
  male(Uncle),
  parent_of(Person, Parent),
  brother_of(Parent, Uncle).

cousin_of(Person, Cousin) :-
  parent_of(Person, Parent),
  uncle_of(Cousin, Parent). 

% TODO: apply recursively
second_cousin_once_removed(Person, SecondCousinOnceRemoved) :-
  parent_of(Person, Parent),
  parent_of(Parent, GrandFather),
  brother_of(GrandFather, GrandUncle),
  parent_of(FirstCousinOnceRemoved, GrandUncle),
  parent_of(SecondCousinOnceRemoved, FirstCousinOnceRemoved).