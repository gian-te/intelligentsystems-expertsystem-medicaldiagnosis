/* KNOWLEDGE BASE */

/* People Data */
male(naruto).
female(hinata).

/* Display Data */

/* measles */
disp("Do you have fever?", fever).
disp("Do you have cough?", cough).
disp("Do you headache?", headache).
disp("Do you vomit?", vomit).
disp("Do you have red eyes", redeyes).
disp("Do you have white spots on mouth?", mouth_whitespots).

/* chickenpox */
disp("Do the spots become blisters?", blisters).

/* allergy */
disp("Do you have hives (itchy, raised swelts) in your skin?", hives).
disp("Does your face, mouth, throat swell?", swell).
disp("Do you have itchy or watery eyes?", itchy_watery_eyes).
disp("Are you experiencing dizziness?", dizzy).

/* dengue rash */
disp("Do you bleed from your nose or gums?", bleed).

/* coronavirus rash */
disp("Do you have purple discoloration on fingers or toes (chilblain)?", discoloration).
disp("Do you have fishnet red-blue pattern on the skin?", fishnet).
disp("Are you losing hair?", losing_hair).

/* heat rash */
disp("Are your rashes in sweat-prone areas?", sweat_prone_area).
disp("Do you wear tight-fitting clothing around these areas (groin , armpits)?", tight_fitting_clothing).
disp("Do you live in an area with a tropical climate, causing you to sweat a lot?", sweaty).

/* Shingles */
disp("Do the rashes cause pain, burning sensation, numbness, or tingling?", painful).
disp("Does it only involve a small section of your skin?", small_section_only).
disp("Does it itch?", itch).
disp("Are you fatigued?", fatigued).

/* Common rash, itch, insect bite */
disp("Have you been bitten by, or stung by, insects such as mosquitoes, bees, or fire ants?", bitten).

/* Acne */
disp("Are the rashes in your face, forehead, chest, or upper back?", face_forehead_chest_back).
disp("Do you have oily skin, causing whiteheads/blackheads/pimples?", oily).

/*atopic dermatitis (eczema)*/
disp("Have the rashes been around for a long time (chronic)?", chronic).
disp("Are your rashes red?", red).
disp("Does it occur in large patches of skin?", large_section).
disp("Is it thickened, cracked, or scaly?", cracked).


/* Symptoms Data */
symptom(sakura, fever).
symptom(sakura, headache).
symptom(sakura, cough).

/* SYMPTOMS LIST */
symplst([fever, cough, headache,
         vomit, redeyes, mouth_whitespots, blisters, hives, swell, itchy_watery_eyes, dizzy, bleed, discoloration, fishnet, losing_hair, sweat_prone_area, tight_fitting_clothing, sweaty, painful, small_section_only, itch, fatigued, bitten, face_forehead_chest_back, oily, chronic, red, large_section, cracked]).

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

hypothesis(X, measles) :-
    symptom(X, fever),
    symptom(X, cough),
    symptom(X, headache).

hypothesis(X, chickenpox) :-
    symptom(X, red),
    symptom(X, fever),
    symptom(X, blisters),
    symptom(X, itch),
    symptom(X, headache).   

hypothesis(X, allergy) :-
    symptom(X, red),
    symptom(X, hives),
    symptom(X, swell),
    symptom(X, itch),
    symptom(X, dizzy),
    symptom(X, itchy_watery_eyes),
    symptom(X, vomit).

hypothesis(X, dengue) :-
    symptom(X, red),
    symptom(X, bleed),
    symptom(X, fever),
    symptom(X, vomit),
    symptom(X, headache).

hypothesis(X, coronavirusrash) :-
    symptom(X, discoloration),
    symptom(X, fishnet),
    symptom(X, losing_hair),
    symptom(X, redeyes),
    symptom(X, itch),
    symptom(X, red).

hypothesis(X, heat_rash):-
    symptom(X, sweat_prone_area),
    symptom(X, tight_fitting_clothing),
    symptom(X, sweaty).

hypothesis(X, shingles):-
    symptom(X, painful),
    symptom(X, small_section_only),
    symptom(X, itch),  
    symptom(X, fever),
    symptom(X, fatigued).

hypothesis(X, common_rash_insect_bite):-
    symptom(X, bitten).  
    
hypothesis(X, acne):-
    symptom(X, face_forehead_chest_back),
    symptom(X, oily).  
    
hypothesis(X, eczema):-
    symptom(X, chronic),
    symptom(X, large_section),
    symptom(X, itch),
    symptom(X, cracked),
    symptom(X, red).  