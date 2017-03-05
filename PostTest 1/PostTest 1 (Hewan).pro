PREDICATES
	hewan(symbol)
	ukuran(symbol,symbol) /* symbol digunakan untuk semua seperti tipe domain string, 
				 tetapi dilakukan tanpa ada tanda petik. */
	warna(symbol,symbol)
	gelap(symbol) - nondeterm (o)
	terang(symbol) - nondeterm (o)

CLAUSES
	hewan(beruang). /*(.) tanda titik/ dot: untuk mengakhiri program. */
	hewan(jerapah).
	hewan(kucing).

	ukuran(beruang, besar).
	ukuran(jerapah, panjang).
	ukuran(kucing, kecil).

	warna(beruang, coklat).
	warna(jerapah, orange).
	warna(kucing, putih).

	gelap(Z):-warna(Z,coklat).
	terang(Z):-warna(Z,orange).
	terang(Z):-warna(Z,putih).

GOAL
	gelap(Hewan), ukuran(Hewan,besar);
	terang(Hewan), ukuran(Hewan, panjang).
	
%alur program.
%bertujuan untuk mencari hewan berdasarkan ukuran dan warna kulit hewan tersebut
%program memanggil predikat gelap dan terang berdasarkan warna kulit dengan varibel apa saja.
%pada klausa program mencari ukuran hewan yang sudah ditentukan
%lalu mencari warna kulit hewan tersebut
%pencocokan didasarkan pada subgoal varibel Z.
%selesai