proc print data=studentmath;
run;
proc print data=studentpor;
run;
data student;
	set studentmath studentpor;
run;
proc print data=student;
run;

/*job & edu*/
proc tabulate data=student;
	class mjob fjob medu fedu;
	table medu , mjob n;
run;

proc freq data=student;
	table fjob*fedu/chisq;
run;
/*guardian*/
proc sort data=student;
	by guardian;
run;
data guard_f;
	set student;
	if guardian^="father" then  delete;
run;
proc freq data=guard_f;
	table fedu*studytime/chisq;
run;
proc freq data=guard_f;
	table medu*studytime/chisq;
run;
data guard_m;
	set student;
	if guardian^="mother" then  delete;
run;
proc freq data=guard_m;
	table medu*studytime/chisq;
run;
proc freq data=guard_m;
	table fedu*studytime/chisq;
run;
data guard_o;
	set student;
	if guardian^="other" then  delete;
run;
proc freq data=guard_o;
	table medu*studytime/chisq;
run;
proc freq data=guard_o;
	table fedu*studytime/chisq;
run;

proc freq data=student;
	table medu*studytime/chisq;
run;
proc freq data=student;
	table fedu*studytime/chisq;
run;
/*internet & studytime*/
proc freq data=student;
	table internet*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class internet;
run;
/*studytime & failures*/
proc freq data=student;
	table studytime*failures/chisq;
run;
proc anova data=student;
	class failures;
	model studytime=failures;
	means failures/ tukey;
run;
/*studytime & higher*/
proc freq data=student;
	table higher*studytime/chisq;
run;
proc ttest data=student;
	var studytime;
	class higher;
run;
/*fqilures & absences*/
proc freq data=student;
	table absences*failures/chisq;
run;
proc anova data=student;
	class failures;
	model absences=failures;
	means failures/tukey;
run;
/* freetime & goout*/
proc freq data=student;
	table freetime*goout/chisq;
run;
proc anova data=student;
	class freetime;
	model goout=freetime;
	means freetime/tukey;
run;
/*goout & absences*/
proc freq data=student;
	table goout*absences/chisq;
run;
proc anova data=student;
	class goout;
	model absences=goout;
	means goout/tukey;
run;
/*goout & dalc*/
proc freq data=student;
	table goout*dalc/chisq;
run;
proc anova data=student;
	class goout;
	model dalc=goout;
	means goout/tukey;
run;
/*goout & walc*/
proc freq data=student;
	table goout*walc/chisq;
run;
proc anova data=student;
	class goout;
	model walc=goout;
	means goout/tukey;
run;
/*dalc & walc*/
proc freq data=student;
	table dalc*walc/chisq;
run;
proc anova data=student;
	class dalc;
	model walc=dalc;
	means dalc/tukey;
run;
/*dalc & abseces*/
proc freq data=student;
	table dalc*absences/chisq;
run;
proc anova data=student;
	class dalc;
	model absences=dalc;
	means dalc/tukey;
run;
/*walc & absences*/
proc freq data=student;
	table walc*absences/chisq;
run;
proc anova data=student;
	class walc;
	model absences=walc;
	means walc/tukey;
run;
/*dalc & health*/
proc freq data=student;
	table dalc*health/chisq;
run;
proc anova data=student;
	class dalc;
	model health=dalc;
	means dalc/tukey;
run;
/*walc & health*/
proc freq data=student;
	table walc*health/chisq;
run;
proc anova data=student;
	class walc;
	model health=walc;
	means walc/tukey;
run;
/* add grade average*/
data student;
	set student;
	Gavg=round((g1+g2+g3)/3,0.01);
proc print;
run;
/*******************/

/*dalc & grade*/
proc freq data=student;
	table dalc*gavg/chisq;
run;
proc anova data=student;
	class dalc;
	model gavg=dalc;
	means dalc/tukey;
run;
/*walc & grade*/
proc freq data=student;
	table walc*gavg/chisq;
run;
proc anova data=student;
	class walc;
	model gavg=walc;
	means walc/tukey;
run;
/*romantic & dalc*/
proc freq data=student;
	table dalc*romantic/chisq;
run;
proc ttest data=student;
	var dalc;
	class romantic;
run;
proc anova data=student;
	class romantic;
	model dalc=romantic;
	means romantic;
run;
/*romantic & walc*/
proc freq data=student;
	table walc*romantic/chisq;
run;
proc ttest data=student;
	var walc;
	class romantic;
run;
proc anova data=student;
	class romantic;
	model walc=romantic;
	means romantic;
run;
/*famrel & dalc*/
proc freq data=student;
	table dalc*famrel/chisq;
run;
proc anova data=student;
	class famrel;
	model dalc=famrel;
	means famrel;
run;
/*famrel & walc*/
proc freq data=student;
	table walc*famrel/chisq;
run;
proc anova data=student;
	class famrel;
	model walc=famrel;
	means famrel;
run;
/* model selection-stepwise*/
proc glmselect data=student;
	class sex higher romantic;
	model dalc=sex age studytime failures higher romantic famrel freetime goout health absences gavg/
		selection=stepwise slentry=0.05 slstay=0.05;
run;

proc glm data=student plots=all;
	class sex;
	model dalc=sex age famrel goout absences gavg/solution;
run;
/*rsq=0.1763*/
/*model with intercept*/
proc glmselect data=student;
	class sex higher romantic;
	model dalc=sex age studytime failures higher romantic famrel freetime goout health absences gavg sex*age sex*famrel sex*goout sex*absences sex*gavg age*famrel age*goout age*absences age*gavg
		famrel*goout famrel*absences famrel*gavg absences*gavg/
		selection=stepwise slentry=0.05 slstay=0.05;
run;
proc glm data=student plots=all;
	class sex;
	model dalc= sex*goout age*goout age*absences famrel*gavg /solution;
run;
/*rsq=0.1964*/
/*transfer model with log*/
data student_log;
	set student;
	logage=log(age);
	logstudytime=log(stidytime);
	logfailures=log(failures);
	logfamrel=log(famrel);
	logfreetime=log(freetime);
	loggoout=log(goout);
	loghealth=log(health);
	logabsences=log(absences);
	loggavg=log(gavg);
run;
/*model with log*/
proc glm data=student_log plots=all;
	class sex;
	model dalc=sex logage logfamrel loggoout logabsences loggavg/solution;
run;
/*rsq=0.2172*/
/*model with log+intercept*/
proc glm data=student_log plots=all;
	class sex;
	model dalc= sex*loggoout logage*loggoout logage*logabsences logfamrel*loggavg /solution;
run;
/*rsq=0.2361*/
/*transfer model with square root*/
data student_sqrt;
	set student;
	sqrage=sqrt(age);
	sqrfamrel=sqrt(famrel);
	sqrgoout=sqrt(goout);
	sqrabsences=sqrt(absences);
	sqrgavg=sqrt(gavg);
run;
/*model with sqrt*/
proc glm data=student_sqrt plots=all;
	class sex;
	model dalc=sex sqrage sqrfamrel sqrgoout sqrabsences sqrgavg/solution;
run;
/*rsq=0.1715*/
/*model with sqr+intercept*/
proc glm data=student_sqrt plots=all;
	class sex;
	model dalc= sex*sqrgoout sqrage*sqrgoout sqrage*sqrabsences sqrfamrel*sqrgavg /solution;
run;
/*rsq=0.1841*/

/*best model*/
proc glm data=student_log plots=all;
	class sex;
	model dalc= sex*loggoout logage*loggoout logage*logabsences logfamrel*loggavg /solution;
	output out = diagnostics
		r=errors
		h=leverage
		cookd=cooks;
run;
/*find outliers*/
proc print data=diagnostics;
	where (errors>4) or (leverage>0.02) or (cooks>0.02);
run;
