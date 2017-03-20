domains
%mm = menu makanan, lk = lokasi
%menu yang tersedia ada berdasarkan fakta
mm,lk=symbol

predicates
nondeterm mm_pagi(lk,mm,mm,mm,mm,mm)
nondeterm mm_siang(lk,mm,mm,mm,mm,mm,mm)
nondeterm mm_pagi2(lk,mm,mm,mm,mm,mm)
nondeterm mm_pagi3(lk,mm,mm,mm,mm,mm,mm,mm)
nondeterm mm_utama(lk,mm,mm,mm,mm,mm,mm)

clauses
mm_pagi(mcdonalds,chicken_muffin,egg_mcmuffin,breakfast_wrap,hotcakes,big_breakfast).
mm_siang(mcdonalds,big_mac,triple_burger,double_cheeseburger,chicken_burger,mcspicy,chicken_snack_wrap).
mm_pagi2(kfc,original_porridge,pom_pom,pancake,waffle,riser).
mm_pagi3(pizzahut,salad,rice_omelette,bubur_ayam,smoke_beef_toast,tuna_toast,garlic_bread,hot_pudding_choco).
mm_utama(pizzahut,meat_lovers,super_supreme,tuna_melt,frankfurter_bbq,american_favourite,cheeseburger_pizza).

goal
write("*************** SELAMAT DATANG **********************"),nl,
write("Berikut ini adalah beberapa menu makanan yag tersedia di beberapa tempat makan terkenal diseluruh dunia."),nl,
write("Menu Sarapan Pagi di McDonalds adalah :"),nl,mm_pagi(mcdonalds,MM1,MM2,MM3,MM4,MM5);
nl,write("Menu Makan Siang di McDonalds adalah :"),nl,mm_siang(mcdonalds,MM1,MM2,MM3,MM4,MM5,MM6);
nl,write("Menu Sarapan Pagi di KFC adalah :"),nl,mm_pagi2(kfc,MM1,MM2,MM3,MM4,MM5);
nl,write("Menu Sarapan Pagi di Pizza Hut adalah :"),nl,mm_pagi3(pizzahut,MM1,MM2,MM3,MM4,MM5,MM6,MM7);
nl,write("Menu Utama di Pizza Hut adalah :"),nl,mm_utama(pizzahut,MM1,MM2,MM3,MM4,MM5,MM6).