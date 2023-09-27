library("ggplot2")
install.packages("dplyr")
install.packages("reshape2")
library(reshape2)



corrstudent=student[,c('age', 'studytime', 'failures', 'famrel', 'freetime', 'goout', 'Dalc', 'Walc', 'health', 'absences', 'G1', 'G2', 'G3' )]
head(corrstudent)

corrstudent=round(cor(corrstudent),2)
melted_corrstudent=melt(corrstudent)
head(melted_corrstudent)
ggplot(data=melted_corrstudent, aes(x=Var1, y=Var2, fill=value))+geom_tile()

#transfor numeric into factors
student$studytime=factor(student$studytime)
student$failures=factor(student$failures)
student$famrel=factor(student$famrel)
student$freetime=factor(student$freetime)
student$goout=factor(student$goout)
student$health=factor(student$health)
student$alc=factor(student$alc)

#explore
summary(student)

library("ggplot2")
#studytime*failures
studyfail=table(student$studytime, student$failures)
round(prop.table(studyfail, margin=1),3)
barplot(prop.table(studyfail),legend.text = T)
barplot(prop.table(studyfail))
chisq.test(studyfail, simulate.p.value = TRUE)
ggplot(student, aes(failures, ..count..)) + geom_bar(aes(fill = studytime), position = "dodge")
#romantic*freetime (x)
romanticfree=table(student$romantic, student$freetime)
round(prop.table(romanticfree, margin=1),3)
barplot(prop.table(romanticfree),legend.text = T)
chisq.test(romanticfree, simulate.p.value = TRUE)
ggplot(student, aes(freetime, ..count..)) + geom_bar(aes(fill = romantic), position = "dodge")
#studytime*freetime
studyfree=table(student$studytime, student$freetime)
round(prop.table(studyfree, margin=1),3)
barplot(prop.table(studyfree),legend.text = T)
chisq.test(studyfree, simulate.p.value = TRUE)
ggplot(student, aes(freetime, ..count..)) + geom_bar(aes(fill = studytime), position = "dodge")
#romantic*studytime
studyroman=table(student$studytime, student$romantic)
round(prop.table(studyroman, margin=1),3)
barplot(prop.table(studyroman),legend.text = T)
chisq.test(studyroman, simulate.p.value = TRUE)
ggplot(student, aes(studytime, ..count..)) + geom_bar(aes(fill = romantic), position = "dodge")
#internet*studytime
studyinternet=table(student$studytime, student$internet)
round(prop.table(studyinternet, margin=1),3)
barplot(prop.table(studyinternet),legend.text = T)
chisq.test(studyinternet, simulate.p.value = TRUE)
ggplot(student, aes(studytime, ..count..)) + geom_bar(aes(fill = internet), position = "dodge")
#paid*studytime
studypaid=table(student$studytime, student$paid)
round(prop.table(studypaid, margin=1),3)
barplot(prop.table(studypaid),legend.text = T)
chisq.test(studypaid, simulate.p.value = TRUE)
ggplot(student, aes(studytime, ..count..)) + geom_bar(aes(fill = paid), position = "dodge")
#schoolsup*studytime
studyschool=table(student$studytime, student$schoolsup)
round(prop.table(studyschool, margin=1),3)
barplot(prop.table(studyschool),legend.text = T)
chisq.test(studyschool, simulate.p.value = TRUE)
ggplot(student, aes(studytime, ..count..)) + geom_bar(aes(fill = schoolsup), position = "dodge")
#alc*studytime
studyalc=table(student$studytime, student$alc)
round(prop.table(studyalc, margin=1),3)
barplot(prop.table(studyalc),legend.text = T)
chisq.test(studyalc, simulate.p.value = TRUE)
ggplot(student, aes(studytime, ..count..)) + geom_bar(aes(fill = alc), position = "dodge")
#goout*studytime
studygo=table(student$studytime, student$goout)
round(prop.table(studygo, margin=1),3)
barplot(prop.table(studygo),legend.text = T)
chisq.test(studygo, simulate.p.value = TRUE)
ggplot(student, aes(studytime, ..count..)) + geom_bar(aes(fill = goout), position = "dodge")
#failures*absences
failabsences=aov(absences~failures, data=student)
TukeyHSD(failabsences, conf.level=0.95)
boxplot(absences ~ failures, data = student)
#alc*absences
alcabsences=aov(absences~alc, data=student)
TukeyHSD(alcabsences, conf.level=0.95)
boxplot(absences ~ alc, data = student)
#failures*alc
failalc=table(student$failures, student$alc)
round(prop.table(failalc, margin=1),3)
barplot(prop.table(failalc),legend.text = T)
chisq.test(failalc, simulate.p.value = TRUE)
ggplot(student, aes(failures, ..count..)) + geom_bar(aes(fill = alc), position = "dodge")
#goout*alc
goalc=table(student$goout, student$alc)
round(prop.table(goalc, margin=1),3)
barplot(prop.table(goalc),legend.text = T)
chisq.test(goalc, simulate.p.value = TRUE)
ggplot(student, aes(goout, ..count..)) + geom_bar(aes(fill = alc), position = "dodge")
#health*alc
halc=table(student$health, student$alc)
round(prop.table(halc, margin=1),3)
barplot(prop.table(halc),legend.text = T)
chisq.test(halc, simulate.p.value = TRUE)
ggplot(student, aes(health, ..count..)) + geom_bar(aes(fill = alc), position = "dodge")
#school*alc
schoolalc=table(student$schoolsup, student$alc)
round(prop.table(schoolalc, margin=1),3)
barplot(prop.table(schoolalc),legend.text = T)
chisq.test(schoolalc, simulate.p.value = TRUE)
ggplot(student, aes(alc, ..count..)) + geom_bar(aes(fill = schoolsup), position = "dodge")
#internet*absences
netabsences=aov(absences~internet, data=student)
TukeyHSD(netabsences, conf.level=0.95)
boxplot(absences ~ internet, data = student)

######################
#linear regression 0.2655
mod_all=lm(Gavg~sex+age+address+studytime+failures+schoolsup+famsup+paid+nursery+higher+internet+romantic+famrel+freetime+goout+health+absences+alc, data=student)
summary(mod_all)
#null regression
mod_n=lm(Gavg~1, data=student)
#with significant variable 0.2558
mod_1=lm(Gavg~address+studytime+failures+schoolsup+paid+higher+internet+romantic+goout+health, data=student)
summary(mod_1)
#delete goout 0.2444
mod_2=lm(Gavg~address+studytime+failures+schoolsup+paid+higher+internet+romantic+health, data=student)
summary(mod_2)
#delete health 0.2499
mod_3=lm(Gavg~address+studytime+failures+schoolsup+paid+higher+internet+romantic+goout, data=student)
summary(mod_3)
#delete goout and health 
mod_4=lm(Gavg~address+studytime+failures+schoolsup+paid+higher+internet+romantic, data=student)
summary(mod_4)
#interaction 0.2718
mod_5=lm(Gavg~sex+age+address+studytime+failures+schoolsup+famsup+paid+nursery+higher+internet+romantic+famrel+freetime+goout+health+absences+alc+romantic*absences+paid*absences+internet*absences+failures*absences+alc*absences, data=student)
summary(mod_5)
#0.2742
mod_6=lm(Gavg~sex+age+address+studytime+failures+schoolsup+famsup+paid+nursery+higher+internet+romantic+famrel+freetime+goout+health+absences+alc+romantic*absences+paid*absences+internet*absences+failures*absences+alc*absences+studytime*absences+goout*absences+health*absences+schoolsup*absences+higher*absences, data=student)
summary(mod_6)


#model selection
#backward 0.2669
back=step(mod_all, direction='backward')
summary(back)
#forward 0.2669
fwd=step(mod_n, scope=list(upper=mod_all), direction='forward')
summary(fwd)
#stepwise_forward 0.2669
stepwisef=step(mod_n, scope=list(lower=mod_n, upper=mod_all), direction='both')
summary(stepwisef)
#stepwise_backward 0.2669
stepwiseb=step(mod_all, direction='both')
summary(stepwiseb)

#interaction
#backward 0.2758
backi=step(mod_5, direction='backward')
summary(backi)
#forward 0.2669
fwdi=step(mod_n, scope=list(upper=mod_5), direction='forward')
summary(fwdi)
#stepwise_forward 0.2669
stepwisefi=step(mod_n, scope=list(lower=mod_n, upper=mod_5), direction='both')
summary(stepwisefi)
#stepwise_backward 0.2758
stepwisebi=step(mod_5, direction='both')
summary(stepwisebi)

#iinteraction
#backward 0.2814
backii=step(mod_6, direction='backward')
summary(backii)
#forward 0.2669
fwdii=step(mod_n, scope=list(upper=mod_6), direction='forward')
summary(fwdii)
#stepwise_forward 0.2669
stepwisefii=step(mod_n, scope=list(lower=mod_n, upper=mod_6), direction='both')
summary(stepwisefii)
#stepwise_backward 0.2814
stepwisebii=step(mod_6, direction='both')
summary(stepwisebii)

#plot
par(mfrow=c(2,2))
plot(stepwisebii)

#outliers
cookd=cooks.distance(stepwisebii)
plot(cookd)
leverage=hatvalues(stepwisebii)
plot(leverage)
residual=residuals(stepwisebii)
plot(residual)
sdresidual=rstandard(stepwisebii)
plot(sdresidual)

outliers = cbind(student,cookd, leverage, residual, sdresidual)
outliers=outliers %>% select (Obs, address, studytime, failures, schoolsup, paid, higher, internet, romantic, freetime, goout, health, absences, cookd, leverage, residual, sdresidual)
outliers %>% filter(leverage>0.2)
outliers %>% filter(cookd>0.01)
outliers %>% filter(residual<(-7))

moveout = outliers %>% filter(leverage<0.2)
moveout = moveout %>% filter(cookd<0.01)
moveout = moveout %>% filter(residual>(-7))
#0.316
mod_7=lm(Gavg~sex+age+address+studytime+failures+schoolsup+famsup+paid+nursery+higher+internet+romantic+famrel+freetime+goout+health+absences+alc+romantic*absences+paid*absences+internet*absences+failures*absences+alc*absences+studytime*absences+goout*absences+health*absences+schoolsup*absences+higher*absences, data=moveout)
summary(mod_7)
#0.3207
stepwisebout=step(mod_7, direction='both')
summary(stepwisebout)

