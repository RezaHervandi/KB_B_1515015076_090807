/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains
  name,sex,occupation,object,vice,substance = symbol
  age=integer

predicates
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o)
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)
  killed_with(name,object) - determ (i,o)
  killed(name) - procedure (o)
  killer(name) - nondeterm (o)
  motive(vice) - nondeterm (i)
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)
  owns(name,object) - nondeterm (i,i)
  operates_identically(object,object) - nondeterm (o,i)
  owns_probably(name,object) - nondeterm (i,i)
  suspect(name) - nondeterm (i)

/* * * Facts about the murder * * */
clauses
  person(bert,55,m,carpenter).          %seorang tersangka yang bernama bert berumur 55 tahun dan berkerja sebagai tukang kayu
  person(allan,25,m,football_player).   %seorang tersangka yang bernama allan berumur 25 tahun dan dia adalah seorang atlit ruby
  person(allan,25,m,butcher).		%seorang tersangka yang bernama allan berumur 25 tahun dan berkerja sebagai tukang daging
  person(john,25,m,pickpocket).		%seorang tersangka yang bernama john berumur 25 tahun dan dia alah seorang pencopet

  had_affair(barbara,john).
  had_affair(barbara,bert).
  had_affair(susan,john).

  killed_with(susan,club).
  killed(susan).

  motive(money).
  motive(jealousy).
  motive(righteousness).

  smeared_in(bert,blood).
  smeared_in(susan,blood).
  smeared_in(allan,mud).
  smeared_in(john,chocolate).
  smeared_in(barbara,chocolate).

  owns(bert,wooden_leg).
  owns(john,pistol).

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club).
  operates_identically(bar, club).
  operates_identically(pair_of_scissors, knife).
  operates_identically(football_boot, club).

  owns_probably(X,football_boot):-
	person(X,_,_,football_player).
  owns_probably(X,pair_of_scissors):-
	person(X,_,_,hairdresser).
  owns_probably(X,Object):-
	owns(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):- %tersangka
	killed_with(susan,Weapon) ,%membunuh susah dengan senjata
	operates_identically(Object,Weapon) , %tempat pembunuhan harus dicocokan dengan tempat pembunuhan
	owns_probably(X,Object). 

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(jealousy),  %motiv pembunuhan lain nya adalah karena cemburu
	person(X,_,m,_),   %orang yang akan dijadikan tersangka
	had_affair(susan,X). %yang ada sangkut paut nya dengan susan adalah tersangka

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(jealousy), 
	person(X,_,f,_),
	had_affair(X,Man),
	had_affair(susan,Man).

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-   %tersangka
	motive(money),  %motiv pembunuhan adalah karena uang
	person(X,_,_,pickpocket). %orang nya adlaah pencopet
	

  killer(Killer):-   %program akan mencari data data yang cocok dengan goal yaitu killer(X) yang nantinya hasil yang didapatkan akan disimpan pada varibel killer
	person(Killer,_,_,_),   %lalu dipanggil subgoal pertama yaitu orang yang menjadi tersangka
	killed(Killed), %lalu dilalakukan pengecekan yang terbunuh, dan hasil yang didapat adalah susan yang terbunuh
	Killed <> Killer, % disini menjelaskan sebuah pernyataan bahwa susan tidak lah bunuh diri
	suspect(Killer),  %lalu orang orang yang tadi di panggil di syarat pertama di cek melalui kecurigaan yang terdapat pada clause
	smeared_in(Killer,Goo), %lalu dilakukan pengecekkan bukti apakah yang dicurigai membunuh memliki noda darah
	smeared_in(Killed,Goo). %dan yang terbunuh memiliki noda darah yang sama dengan pembunuh
	%disini terjadi backtrakcing dalam menemukan pelaku yang sesuia

goal
  killer(X).
  %ANALISIS
  %pada goal prolog akan mencari seorang pembunuh yang membunuh susan sesuai uraian kasus diatas
  %dan didapat bahwasan nya yang membunuh susan adalah seseorang yang bernama bert
  %bert adalah seorang tukang kayu
  %bagaimana kerja prolog dalam menindentifikasi pelaku akan diajabar kan melalui analisis dibawah ini:
  %pertama dari banyak nya orang yang disebut kan prolog akan mencari sebuah indikasi dari beberapa kecurigaan
  %yang pertama kali dicek oleh prolog adalah seseorang yang bernama bert
  %pada clauses tersangka yang dicari adalah yang membunuh sesorang yang bernama susan
  %pada clauses lagi rupanya motif pembunuhan nya dikarenakn kecemburuan
  %dan kemungkinan yang memebunuh tidak lah diketahui
  %korban bukanlah tersangka yang artinya korban tidak melakukan bunuh diri
  %saat dicek bert selalu ada di semua kecurigaan
  %pada pengecekkan yang pertama, setiap orang yang memiliki barang yang bisa dijadikan sebagai alat pembunuhan dicek
  %saat dicek kecurigaan oleh prolog alat yang mirip dengan alat tersebut, bert terindikasi mempunyanyi alat tersebut
  %lalu di cek lagi apakah ada bukti darah di tubuhnya, dan ternyayta bert dan susan ternodai oleh darah
  %namun karena pembunuh bukan yang terbunuh, maka bert lah yang menjadi tersangka
  
