proc sgscatter data=student;
	matrix age medu fedu studytime failures famrel freetime goout alc health absences g1 g2 g3 gavg;
run;
proc print data=student;
run;
/*explore data*/
/*sex*/
proc sgplot data=student;
	vbar sex;
run;
proc sgplot data=student;
	hbox g3 /group =sex;
run;
proc ttest data=student;
	var g3;
	class sex;
run;
/*age*/
proc gchart data=student;
	pie age/ group=sex;
run;
proc sgplot data=student;
	hbox g3/group=age;
run;
proc anova data=student;
	class age;
	model g3=age;
	means age/tukey;
run;
proc freq data=student;
	table g3*age/chisq;
run;
/*study time*/
proc sgplot data=student;
	hbox g3/ group=studyttime;
run;
proc gchart data=student;
	pie studytime;
run;
proc freq data=student;
	table studytime*g3/chisq;
run;
proc anova data=student;
	class studytime;
	model g3=studytime;
	means studytime/tukey;
run;
/*failures*/
proc sgplot data=student;
	hbox g3/group=failures;
run;
proc freq data=student;
	table failures*g3/chisq;
run;
proc anova data=student;
	class failures;
	model g3=failures;
	means failures;
run;
/*famrel*/
proc sgplot data=student;
	hbox g3/group=famrel;
run;
proc freq data=student;
	table g3*famrel/chisq;
run;
proc anova data=student;
	class famrel;
	model g3=famrel;
	means famrel/tukey;
run;
/*freetime*/
proc sgplot data=student;
	hbox g3/ group=freetime;
run;
proc gchart data=student;
	pie freetime;
run;
proc freq data=student;
	table g3*freetime/chisq;
run;
proc anova data=student;
	class freetime;
	model g3=freetime;
	means freetime/tukey;
run;
/*goout*/
proc sgplot data=student;
	hbox g3/group=goout;
run;
proc gchart data=student;
	pie goout;
run;
proc freq data=student;
	table g3*goout/chisq;
run;
proc anova data=student;
	class goout;
	model g3=goout;
	means goout/tukey;
run;
/*alc*/
proc sgplot data=student;
	hbox g3/ group=alc;
run;
proc gchart data=student;
	pie alc;
run;
proc freq data=student;
	table g3*alc/chisq;
run;
proc anova data=student;
	class alc;
	model g3=alc;
	means alc/tukey;
run;
/*health*/
proc sgplot data=student;
	hbox g3/group=health;
run;
proc gchart data=student;
	pie health;
run;
proc freq data=student;
	table g3*health/chisq;
run;
proc anova data=student;
	class health;
	model g3=health;
	means health/tukey;
run;
/*absences*/
proc gchart data=student;
	pie absences;
run;
proc sgplot data=student;
	histogram absences/ scale=count;
run;
/*address*/
proc sgplot data=student;
	hbox g3/group=address;
run;
proc ttest data=student;
	var g3;
	class address;
run;
/*pstatus*/
proc sgplot data=student;
	hbox g3/group=pstatus;
run;
proc ttest data=student;
	var g3;
	class pstatus;
run;
/*Mjob*/
proc sgplot data=student;
	hbox g3/group=mjob;
run;
proc anova data=student;
	class mjob;
	model g3=mjob;
	means mjob/tukey;
run;
/*Fjob*/
proc sgplot data=student;
	hbox g3/group=fjob;
run;
proc anova data=student;
	class fjob;
	model g3=fjob;
	means fjob/tukey;
run;
/*schoolsup*/
proc sgplot data=student;
	hbox g3/group=schoolsup;
run;
proc ttest data=student;
	var g3;
	class schoolsup;
run;
/*famsup*/
proc sgplot data=student;
	hbox g3/group=famsup;
run;
proc ttest data=student;
	var g3;
	class famsup;
run;
/*paid*/
proc sgplot data=student;
	hbox g3/group=paid;
run;
proc ttest data=student;
	var g3;
	class paid;
run;
/*nursery*/
proc sgplot data=student;
	hbox g3/group=nursery;
run;
proc ttest data=student;
	var g3;
	class nursery;
run;
/*higher*/
proc sgplot data=student;
	hbox g3/group=higher;
run;
proc ttest data=student;
	var g3;
	class higher;
run;
/*internet*/
proc sgplot data=student;
	hbox g3/group=internet;
run;
proc ttest data=student;
	var g3;
	class internet;
run;
/*romantic*/
proc sgplot data=student;
	hbox g3/group=romantic;
run;
proc ttest data=student;
	var g3;
	class romantic;
run;
/*address x studytime*/
proc freq data=student;
	table address*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class address;
run;

proc sgpanel data=student;
	panelby address/rows=1;
	histogram studytime;
run;
/*address x failures*/
proc freq data=student;
	table address*failures/chisq;
run;
proc ttest data=student;
	var failures;
	class address;
run;
/* address x freetime*/
proc freq data=student;
	table address*freetime/chisq;
run;
proc ttest data=student;
	var freetime;
	class address;
run;
/*address x goout */
proc freq data=student;
	table address*goout/chisq;
run;
proc ttest data=student;
	var goout;
	class address;
run;
proc sgpanel data=student;
	panelby address/rows=1;
	histogram goout/ scale=count;
run;
/*address x alc*/
proc freq data=student;
	table address*alc/chisq;
run;
proc ttest data=student;
	var alc;
	class address;
run;
/*address x health*/
proc freq data=student;
	table address*health/chisq;
run;
proc ttest data=student;
	var health;
	class address;
run;
/*address x absences*/
proc ttest data=student;
	var absences;
	class address;
run;
proc sgpanel data=student;
	panelby address/rows=1;
	histogram absences/scale=count;
run;
/* mjob x studytime*/
proc freq data=student;
	table mjob*studytime/chisq;
run;
proc anova data=student;
	class mjob;
	model studytime=mjob;
	means mjob/tukey;
run;
proc freq data=student;
	table medu*studytime/chisq;
run;
proc anova data=student;
	class medu;
	model studytime=medu;
	means medu/tukey;
run;
proc freq data=student;
	table mjob*medu/chisq;
run;
proc anova data=student;
	class mjob;
	model medu=mjob;
	means mjob/tukey;
run;
/* fjob x studytime*/
proc freq data=student;
	table fjob*studytime/chisq;
run;
proc anova data=student;
	class fjob;
	model studytime=fjob;
	means fjob/tukey;
run;
proc freq data=student;
	table fedu*studytime/chisq;
run;
proc anova data=student;
	class fedu;
	model studytime=fedu;
	means fedu/tukey;
run;
proc freq data=student;
	table fjob*fedu/chisq;
run;
proc anova data=student;
	class fjob;
	model fedu=fjob;
	means fjob/tukey;
run;
/*romantic x studytime*/
proc freq data=student;
	table romantic*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class romantic;
run;
proc sgpanel data=student;
	panelby romantic/rows=1;
	histogram studytime;
run;
/*romantic x failures*/
proc freq data=student;
	table romantic*failures/chisq;
run;
proc ttest data=student;
	var failures;
	class romantic;
run;
proc sgpanel data=student;
	panelby romantic/rows=1;
	histogram failures;
run;
/*romantic x freetime*/
proc freq data=student;
	table romantic*freetime/chisq;
run;
proc ttest data=student;
	var freetime;
	class romantic;
run;
proc sgpanel data=student;
	panelby romantic/rows=1;
	histogram freetime;
run;
/*romantic x goout*/
proc freq data=student;
	table romantic*goout/chisq;
run;
proc ttest data=student;
	var goout;
	class romantic;
run;
proc sgpanel data=student;
	panelby romantic/rows=1;
	histogram goout;
run;
/*romantic x alc*/
proc freq data=student;
	table romantic*alc/chisq;
run;
proc ttest data=student;
	var alc;
	class romantic;
run;
proc sgpanel data=student;
	panelby romantic/rows=1;
	histogram alc;
run;
/*romantic x health*/
proc freq data=student;
	table romantic*health/chisq;
run;
proc ttest data=student;
	var health;
	class romantic;
run;
proc sgpanel data=student;
	panelby romantic/rows=1;
	histogram health;
run;
/*romantic x absences*/
proc ttest data=student;
	var absences;
	class romantic;
run;
proc sgpanel data=student;
	panelby romantic/rows=1;
	histogram absences;
run;
/*schoolsup x studytime*/
proc freq data=student;
	table schoolsup*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class schoolsup;
run;
proc sgpanel data=student;
	panelby schoolsup/rows=1;
	histogram studytime;
run;
/*schoolsup x failures*/
proc freq data=student;
	table schoolsup*failures/chisq;
run;
proc ttest data=student;
	var failures;
	class schoolsup;
run;
proc sgpanel data=student;
	panelby failures/rows=1;
	histogram studytime;
run;
/*schoolsup x freetime*/
proc freq data=student;
	table schoolsup*freetime/chisq;
run;
proc ttest data=student;
	var freetime;
	class schoolsup;
run;
proc sgpanel data=student;
	panelby schoolsup/rows=1;
	histogram freetime;
run;
/*schoolsup x goout*/
proc freq data=student;
	table schoolsup*goout/chisq;
run;
proc ttest data=student;
	var goout;
	class schoolsup;
run;
proc sgpanel data=student;
	panelby schoolsup/rows=1;
	histogram goout;
run;
/*schoolsup x alc*/
proc freq data=student;
	table schoolsup*alc/chisq;
run;
proc ttest data=student;
	var alc;
	class schoolsup;
run;
proc sgpanel data=student;
	panelby schoolsup/rows=1;
	histogram alc;
run;
/*schoolsup x absences*/
proc ttest data=student;
	var absences;
	class schoolsup;
run;
proc sgpanel data=student;
	panelby schoolsup/rows=1;
	histogram absences;
run;
/*paid x studytime*/
proc freq data=student;
	table paid*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class paid;
run;
proc sgpanel data=student;
	panelby paid/rows=1;
	histogram studytime;
run;
/*paid x failures*/
proc freq data=student;
	table paid*failures/chisq;
run;
proc ttest data=student;
	var failures;
	class paid;
run;
proc sgpanel data=student;
	panelby paid/rows=1;
	histogram failures;
run;
/*paid x freetime*/
proc freq data=student;
	table paid*freetime/chisq;
run;
proc ttest data=student;
	var freetime;
	class paid;
run;
proc sgpanel data=student;
	panelby paid/rows=1;
	histogram freetime;
run;
/*paid x goout*/
proc freq data=student;
	table paid*goout/chisq;
run;
proc ttest data=student;
	var goout;
	class paid;
run;
proc sgpanel data=student;
	panelby paid/rows=1;
	histogram goout;
run;
/*paid x alc*/
proc freq data=student;
	table paid*alc/chisq;
run;
proc ttest data=student;
	var alc;
	class paid;
run;
proc sgpanel data=student;
	panelby paid/rows=1;
	histogram alc;
run;
/*paid x health*/
proc freq data=student;
	table paid*health/chisq;
run;
proc ttest data=student;
	var health;
	class paid;
run;
proc sgpanel data=student;
	panelby paid/rows=1;
	histogram health;
run;
/*paid x absences*/
proc ttest data=student;
	var absences;
	class paid;
run;
proc sgpanel data=student;
	panelby paid/rows=1;
	histogram absences;
run;
/*higher x studytime*/
proc freq data=student;
	table higher*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class higher;
run;
proc sgpanel data=student;
	panelby higher/rows=1;
	histogram studytime;
run;
/*higher x failures*/
proc freq data=student;
	table higher*failures/chisq;
run;
proc ttest data=student;
	var failures;
	class higher;
run;
proc sgpanel data=student;
	panelby higher/rows=1;
	histogram failures;
run;
/*higher x freetime*/
proc freq data=student;
	table higher*freetime/chisq;
run;
proc ttest data=student;
	var freetime;
	class higher;
run;
proc sgpanel data=student;
	panelby higher/rows=1;
	histogram freetime;
run;
/*higher x goout*/
proc freq data=student;
	table higher*goout/chisq;
run;
proc ttest data=student;
	var goout;
	class higher;
run;
proc sgpanel data=student;
	panelby higher/rows=1;
	histogram goout;
run;
/*higher x alc*/
proc freq data=student;
	table higher*alc/chisq;
run;
proc ttest data=student;
	var alc;
	class higher;
run;
proc sgpanel data=student;
	panelby higher/rows=1;
	histogram alc;
run;
/*higher x health*/
proc freq data=student;
	table higher*health/chisq;
run;
proc ttest data=student;
	var health;
	class higher;
run;
proc sgpanel data=student;
	panelby higher/rows=1;
	histogram health;
run;
/*higher x absences*/
proc ttest data=student;
	var absences;
	class higher;
run;
proc sgpanel data=student;
	panelby higher/rows=1;
	histogram absences;
run;
/*internet x studytime*/
proc freq data=student;
	table internet*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class internet;
run;
proc sgpanel data=student;
	panelby internet/rows=1;
	histogram studytime;
run;
/*internet x failures*/
proc freq data=student;
	table internet*failures/chisq;
run;
proc ttest data=student;
	var failures;
	class internet;
run;
proc sgpanel data=student;
	panelby internet/rows=1;
	histogram failures;
run;
/*internet x freetime*/
proc freq data=student;
	table internet*freetime/chisq;
run;
proc ttest data=student;
	var freetime;
	class internet;
run;
proc sgpanel data=student;
	panelby internet/rows=1;
	histogram freetime;
run;
/*internet x goout*/
proc freq data=student;
	table internet*goout/chisq;
run;
proc ttest data=student;
	var goout;
	class internet;
run;
proc sgpanel data=student;
	panelby internet/rows=1;
	histogram goout;
run;
/*internet x alc*/
proc freq data=student;
	table internet*alc/chisq;
run;
proc ttest data=student;
	var alc;
	class internet;
run;
proc sgpanel data=student;
	panelby internet/rows=1;
	histogram alc;
run;
/*internet x health*/
proc freq data=student;
	table internet*health/chisq;
run;
proc ttest data=student;
	var health;
	class internet;
run;
proc sgpanel data=student;
	panelby internet/rows=1;
	histogram health;
run;
/*internet x absences*/
proc ttest data=student;
	var absences;
	class internet;
run;
proc sgpanel data=student;
	panelby internet/rows=1;
	histogram absences;
run;


/*studytime x freetime*/
proc freq data=student;
	table studytime*freetime/chisq;
run;
proc anova data=student;
	class studytime;
	model freetime=studytime;
	means studytime/tukey;
run;
/*studytime x goout*/
proc freq data=student;
	table studytime*goout/chisq;
run;
proc anova data=student;
	class studytime;
	model goout=studytime;
	means studytime/tukey;
run;
/*studytime x alc*/
proc freq data=student;
	table studytime*alc/chisq;
run;
proc anova data=student;
	class studytime;
	model alc=studytime;
	means studytime/tukey;
run;
/*studytime x absences*/
proc anova data=student;
	class studytime;
	model absences=studytime;
	means studytime/tukey;
run;
/*failures x freetime*/
proc freq data=student;
	table failures*freetime/chisq;
run;
proc anova data=student;
	class failures;
	model freetime=failures;
	means failures/tukey;
run;
/*failures x goout*/
proc freq data=student;
	table failures*goout/chisq;
run;
proc anova data=student;
	class failures;
	model goout=failures;
	means failures/tukey;
run;
/*failures x alc*/
proc freq data=student;
	table failures*alc/chisq;
run;
proc anova data=student;
	class failures;
	model alc=failures;
	means failures/tukey;
run;
/*failures x absences*/
proc freq data=student;
	table failures*absences/chisq;
run;
proc anova data=student;
	class failures;
	model absences=failures;
	means failures/tukey;
run;
/*freetime x goout*/
proc freq data=student;
	table freetime*goout/chisq;
run;
proc anova data=student;
	class freetime;
	model goout=freetime;
	means freetime/tukey;
run;
/*freetime x alc*/
proc freq data=student;
	table freetime*alc/chisq;
run;
proc anova data=student;
	class freetime;
	model alc=freetime;
	means freetime/tukey;
run;
/*freetime x absences*/
proc freq data=student;
	table freetime*absences/chisq;
run;
proc anova data=student;
	class freetime;
	model absences=freetime;
	means freetime/tukey;
run;
/*goout x alc*/
proc freq data=student;
	table goout*alc/chisq;
run;
proc anova data=student;
	class goout;
	model alc=goout;
	means goout/tukey;
run;
/*goout x absences*/
proc freq data=student;
	table goout*absences/chisq;
run;
proc anova data=student;
	class goout;
	model absences=goout;
	means goout/tukey;
run;
/*alc x absences*/
proc freq data=student;
	table alc*absences/chisq;
run;
proc anova data=student;
	class alc;
	model absences=alc;
	means alc/tukey;
run;

/*model building*/
/*stepwise whole*/
proc glmselect data=student;
	class sex address romantic schoolsup famsup paid nursery higher internet;
	model g3= sex age address studytime failures schoolsup famsup paid nursery higher internet romantic famrel freetime goout alc health absences/
		selection=stepwise slentry=0.05 slstay=0.05;
run;
proc glm data=student;
	class sex address schoolsup higher internet romantic paid;
	model g3=address studytime failures schoolsup paid higher/solution;
run;
/*stepwise my exposure*/
proc glm data=student;
	class sex address schoolsup higher internet romantic;
	model g3=sex age address studytime failures schoolsup freetime goout alc absences romantic higher internet/solution;
run;
proc glmselect data=student;
	class sex address schoolsup higher internet romantic;
	model g3=sex age address studytime failures schoolsup freetime goout alc absences romantic higher internet/
		selection=stepwise slentry=0.05 slstay=0.05;
run;
/*stepwise my exposure + intercept*/
proc glmselect data=student;
	class address schoolsup higher internet romantic paid ;
	model g3= address studytime failures schoolsup freetime goout alc absences romantic higher internet 
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
/*stepwise whole + intercept*/
proc glmselect data=student;
	class sex address schoolsup higher internet romantic paid;
	model g3= address studytime failures schoolsup freetime goout alc absences romantic higher internet paid
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
