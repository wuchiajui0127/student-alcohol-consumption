proc print data=student;
run;
data student;
	set student;
	drop obs famsize Pstatus medu fedu mjob fjob reason traveltime activities;
run;
data student;
	set student;
	alc=dalc+walc;
	if alc<=2 then avgalc=1;
	else if alc<=4 then avgalc=2;
	else if alc<=6 then avgalc=3;
	else if alc<=8 then avgalc=4;
	else if alc<=10 then avgalc=5;
run;
data student;
	set student;
	drop alc;
run;
data student;
	set student;
	alc=avgalc;
	drop avgalc;
run;
data student;
	set student;
	studytimef=put(studytime,$1.);
	failuresf=put(failures,$1.);
	famrelf=put(famrel,$1.);
	freetimef=put(freetime,$1.);
	gooutf=put(goout,$1.);
	healthf=put(health,$1.);
	alcf=put(alc,$1.);
run;
data student;
	set student;
	drop studytime failures famrel freetime goout health alc dalc walc g1 g2 g3;
run;
data student;
	set student;
	studytime=studytimef;
	failures=failuresf;
	famrel=famrelf;
	freetime=freetimef;
	goout=gooutf;
	health=healthf;
	alc=alcf;
run;
data student;
	set student;
	drop studytimef failuresf famrelf freetimef gooutf healthf alcf;
run;

/*model building*/
proc glm data=student plots=all;
	class sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc;
	model gavg=age absences sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc/solution;
run;
proc glm data=student plots=all;
	class sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc;
	model gavg=address schoolsup paid higher internet romantic studytime failures goout/solution;
run;
proc glmselect data=student;
	class sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc;
	model gavg=age absences sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc/
			selection=stepwise slentry=0.05 slstay=0.05;
run;
proc glm data=student;
	class sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc;
	model gavg=address schoolsup paid higher studytime failures/solution;
run;

proc glmselect data=student;
	class sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc;
	model gavg= address studytime failures schoolsup freetime goout alc absences romantic higher internet paid
				address*studytime address*failures address*schoolsup address*freetime address*goout address*alc address*absences address*romantic address*higher address*internet address*paid
				studytime*failures studytime*schoolsup studytime*freetime studytime*goout studytime*alc studytime*absences studytime*romantic studytime*higher studytime*internet studytime*paid
				failures*schoolsup failures*freetime failures*goout failures*alc failures*absences failures*romantic failures*higher failures*internet failures*paid
				schoolsup*freetime schoolsup*goout schoolsup*alc schoolsup*absences schoolsup*romantic schoolsup*higher schoolsup*internet schoolsup*paid
				freetime*goout freetime*alc freetime*absences freetime*romantic freetime*higher freetime*internet freetime*paid
				goout*alc goout*absences goout*romantic goout*higher goout*internet goout*paid
				alc*absences alc*romantic alc*higher alc*internet alc*paid
				absences*romantic absences*higher absences*internet absences*paid
				romantic*higher romantic*internet romantic*paid
				higher*internet higher*paid
				internet*paid/
		selection=stepwise slentry=0.05 slstay=0.05;
run;
proc glmselect data=student;
	class sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc;
	model gavg=age absences sex address schoolsup higher internet romantic studytime failures freetime goout alc/
			selection=stepwise slentry=0.05 slstay=0.05;
run;
proc glmselect data=student;
	class sex address schoolsup famsup paid nursery higher internet romantic studytime failures famrel freetime goout health alc;
	model gavg= address studytime failures schoolsup freetime goout alc absences romantic higher internet 
				address*studytime address*failures address*schoolsup address*freetime address*goout address*alc address*absences address*romantic address*higher address*internet
				studytime*failures studytime*schoolsup studytime*freetime studytime*goout studytime*alc studytime*absences studytime*romantic studytime*higher studytime*internet
				failures*schoolsup failures*freetime failures*goout failures*alc failures*absences failures*romantic failures*higher failures*internet
				schoolsup*freetime schoolsup*goout schoolsup*alc schoolsup*absences schoolsup*romantic schoolsup*higher schoolsup*internet
				freetime*goout freetime*alc freetime*absences freetime*romantic freetime*higher freetime*internet
				goout*alc goout*absences goout*romantic goout*higher goout*internet
				alc*absences alc*romantic alc*higher alc*internet
				absences*romantic absences*higher absences*internet
				romantic*higher romantic*internet
				higher*internet/
		selection=stepwise slentry=0.05 slstay=0.05;
run;
