/* KNOWLEDGE BASE */

/* People Data */
male(naruto).
female(hinata).

/* Display Data */
disp("Do you have fever?", fever).
disp("Do you have cough?", cough).
disp("Do you headache?", headache).
disp("Do you vomit?", vomit).
disp("Do you have red eyes", redeyes).
disp("Do you have white spots on mouth?", mouth_whitespots).

/* Symptoms Data */
symptom(sakura, fever).
symptom(sakura, headache).
symptom(sakura, cough).

/* SYMPTOMS LIST */
symplst([fever, cough, headache,
         vomit, redeyes, mouth_whitespots]).

/* TO ENABLE TO ADD NEW PREDICATES */
:- dynamic(male/1).
:- dynamic(female/1).
:- dynamic(symptom/2).

/* MAIN PROGRAM */
start :-
    write("Enter your name: "), nl,
    read(Name),
    write("Enter your gender: (m/f)"), nl,
    read(Gender),
    (Gender = 'm' -> G = male(Name), !;
    Gender = 'f' -> G = female(Name)),
    asserta(G),
    symplst([H|T]),
    disp(D,H),
    write(D), nl,
    read(Answer),
    (Answer = 'y' -> S = symptom(Name, H), asserta(S),
                     check_symptoms(Name,T), !;
     Answer = 'n' -> check_symptoms(Name, T)).

/* FUNCTIONS */
check_symptoms(Name, T) :-
   (T = [H|T1],
    disp(D, H),
    write(D),nl,
    read(Answer),
    (Answer = 'y' -> S = symptom(Name, H), asserta(S),
                     check_symptoms(Name,T1), !;
     Answer = 'n' -> check_symptoms(Name, T1))).
/*
 * MISSING ITEMS
 * 1. Confirmation if there's already a matching disease, so no need to
 * traverse all symptoms.
 * 2. Completion of knowledge base
*/

hypohesis(X, measles) :-
    symptom(X, fever),
    symptom(X, cough),
    symptom(X, headache).
