/* Simple Expert System ( city identification ).  
    start with ?- go.     */	
go :- hypothesize(What_is_City),
      write('I guess that the city is:'),
      write(What_is_City),
      nl,
      undo.

/* hypotheses to be tested */
hypothesize(dammam)   :- dammam, !.
hypothesize(riyadh)   :- riyadh, !.
hypothesize(abha)   :- abha, !.
hypothesize(al_baha)   :- al_baha, !.
hypothesize(makkah)   :- makkah, !.
hypothesize(medina)   :- medina, !.
hypothesize(jeddah):- jeddah, !.
hypothesize(al_qassim):- al_qassim, !.

hypothesize(unknown).             /* no diagnosis */

/* city identification rules */
dammam :- class_dammam.
riyadh :- class_riyadh.
abha   :- class_abha.
al_baha :- class_al_baha.
makkah :- class_makkah.
medina :- class_medina.
jeddah  :- class_jeddah.
al_qassim:- class_al_qassim.

/* classification rules */
class_dammam:- verify(eastern_part_saudi_arabia),
         verify(official_dish_hasawi_rice), 
         verify(oil_industry_hub), 
         verify(corniche_and_waterfront), 
         verify(tarot_castle),
         verify(king_fahd_university),
         verify(dammam_corniche_park),
         verify(marjan_island),
         verify(dammam_university),
         verify(al_Qarah_Mountains),!.

class_riyadh:- verify(central_part_saudi_arabia),
         verify(capital_saudi_arabia), 
         verify(official_dish_al_marqooq), 
         verify(modern_skyline), 
         verify(masmak_fortress),
         verify(riyadh_university),
         verify(al_Faisaliah_Tower),
         verify(boulevard),
         verify(tuwaiq_escarpment),
         verify(historical_Diriyah), !.

class_abha:- verify(southwestern_saudi_arabia),
       verify(official_dish_jareesh),
       verify(fog_city),
       verify(capital_asir_region),
       verify(al_soudah_park), 
       verify(abha_university),
       verify(habala_village),
       verify(al-raqdi_museum),
       verify(asir_national_park),
       verify(tanomah), !.

class_al_baha:- verify(southwestern_saudi_arabia),
          verify(raghadan_forest),
          verify(official_dish_al_easida),
          verify(wadi_reem),
          verify(shahba_park), 
          verify(al_baha_university),
          verify(al_mikhwah_village),
          verify(dhee_ain),
          verify(regional_Museum),
          verify(al_Malad_Castle), !.

class_makkah :- verify(holiest_city_in_islam),
          verify(located_in_western_saudi_arabia),
          verify(official_dish_al_saleeg),
          verify(al_masjid_al_haram),
          verify(the_kaaba),
          verify(um_al_qura_university),
          verify(ajyad_fort),
          verify(al_hada),
          verify(zamzam_water),
          verify(jabal_al_noor),!.

class_medina :- verify(located_in_western_saudi_arabia),
          verify(official_dish_madini_rice),
          verify(al_masjid_al_nabawi),
          verify(first_capital_of_muslim),
          verify(quba_mosque),
          verify(the_date_farm),
          verify(medina_souks),
          verify(medina_city_walls),
          verify(qiblatain_mosque),
          verify(islamic_University_university),!.

class_jeddah :- verify(located_in_western_saudi_arabia),
          verify(on_red_sea_coast),
          verify(almond_coffee),
          verify(bride_of_red_sea),
          verify(floating_mosque),
          verify(king_abdulaziz_university),
          verify(jeddah_corniche),
          verify(red_sea_mall),
          verify(king_fahd_fountain),
          verify(old_popular_area_al_Balad),!.

class_al_qassim :- verify(northern_part_saudi_arabia),
             verify(famous_for_dates),
             verify(famous_food_kleija),
             verify(famous_for_agriculture),
             verify(divided_into_13_governorates), 
             verify(qassim_university),
             verify(qassim_date_festival),
             verify(principality_is_Buraidah),
             verify(al_methnab_village),
             verify(dumat_al_jandal), !.

/* how to ask questions */
ask(Question) :-	
    write('Does the city have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.		/* In Prolog, a procedure is either static or dynamic. A static procedure is one whose facts/rules are predefined at the start of execution, and do not change during execution. Normally, the facts/rules will be in a file of Prolog code which will be loaded during the Prolog session. Sometimes, you might want to add extra facts (or maybe even extra rules) to the procedure, during execution of a Prolog query, using assert/asserta/assertz", or maybe remove facts/rules using retract/retractall. To do this, you must declare the procedure to be dynamic. */
/* How to verify something */
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.