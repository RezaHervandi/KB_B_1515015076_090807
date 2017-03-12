%Criminal case adalah game detektif kepolisian di grimsbrought 
%di game ini kita di tugaskan untuk menyelidiki kasus- kasus pembunuhan yg terjadi.
predicates 
	nondeterm 
	case1(long,symbol,symbol)     
	nondeterm
	case2(long,symbol,symbol)
	nondeterm
	case3(long,symbol,symbol)
	nondeterm
	case4(long,symbol,symbol)
	nondeterm
	case5(long,symbol,symbol)
	nondeterm
	dugaan(symbol,symbol,symbol)
clauses
	case1(09012019,pombensin,ned).
	case1(07022009,mall,dillard).
	case1(01062007,tokodaging,colleti).
	case1(01042016,gangsempit,rosa).
	case1(01032015,pelabuhan,smith).
	case2(01092007,sekolah,joe).
	case2(09012017,mall,chad).
	case2(01052017,toiletumum,wickman).
	case2(01032015,rumah,cowdel).
	case2(01042017,terminal,salvador).
	case3(01092007,terminal,viver).
	case3(01012017,rumah,troy).
	case3(01032015,pemakaman,alice).
	case3(07022009,jalanumum,toni).
	case3(01012017,pemakamam,jane).
	case4(01032015,bandara, levi).
	case4(01052017,tol,bulldog).
	case4(07022009,telponumum,kun).
	case4(01022017,sekolah,joni).
	case4(01042016,jalanumum,tris).
	case4(07022009,pombensin,vandi).
	case4(01042016,gangsempit,mom).
	
	case5(Kejadian,Lokasi,Tersangka):-
	case1(Kejadian,Lokasi,Tersangka);
        case2(Kejadian,Lokasi,Tersangka);
	case3(Kejadian,Lokasi,Tersangka);
	case4(Kejadian,Lokasi,Tersangka).
	
	dugaan(pembunuhan,senjatatajam,mutilasi).
	dugaan(pencurian,koper,dipukul).
	dugaan(hutang,bendatumpul,tewas).
	dugaan(penipuan,mobil,ditabrak).
	dugaan(pelecehan,sidikjari,diperkosa).
	dugaan(cintasegita,gergaji,mutilasi).
		
goal
	case5(Kejadian,Lokasi,Tersangka),
	Kejadian=01032015,
	dugaan(Kasus,Bukti,Korban),
	Kasus=penipuan.