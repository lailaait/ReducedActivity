/*************************************************************************/
/*                                                                       */
/*                       Lecture des fichiers  Pôle EMPLOI               */
/*                                                                       */
/*                                   MACRO                               */
/*                    Modifier   - nombob dans macro %anpe_tab           */
/*                               - dates de flux dans macro %flux        */
/*                               - les variables du fichier demandeur    */
/*                               à conserver                             */
/*                     à partir de la ligne 2473                         /*
                                                                         */
/*                       Programme principal: ligne 2086                 */
/*                                                                       */
/*************************************************************************/

/*
options macrogen symbolgen;
*/

/*
filename mylog 'c:\aoanpe2000\log.txt';
filename myout 'c:\aoanpe2000\out.txt';


proc printto print=myout log=mylog;
run;
*/




/*___ Macros utilitaires générales __________________________________________________*/


%macro nom(racine=,nombre=);
  %local i;
  %do i=1 %to &nombre;
    &racine&i
  %end;
%mend nom;


%macro nomref(racine=,nombre=);
  %local i;
  %do i=1 %to &nombre;
    &&&racine&i
  %end;
%mend nomref;


%macro xnomref(prefixe=,racine=,nombre=);
  %local i;
  %do i=1 %to &nombre;
    &prefixe&&&racine&i
  %end;
%mend xnomref;


%macro nomrefsi(racine=,indic=,nombre=);
  %local i;
  %do i=1 %to &nombre;
    %if &&&indic&i=1 %then &&&racine&i;
  %end;
%mend nomrefsi;


%macro somme(racine=,nombre=);
  %local i;
  &&&racine.1
  %do i=2 %to &nombre;
    +&&&racine&i
  %end;
%mend somme;


%macro xsomme(prefixe=,racine=,nombre=);
  %local i;
  &prefixe&&&racine.1
  %do i=2 %to &nombre;
    +&prefixe&&&racine&i
  %end;
%mend xsomme;


%macro nbrarg(liste=,delimit=);

  %local i;
  %let i=1;
  %do %while(%length(%scan(&liste,&i,%str(&delimit)))>0);
    %let i=%eval(&i+1);
  %end;
  %eval(&i-1)

%mend;



%macro liste(liste=,racine=);

  %local i;
  %let i=1;
  %do %while(%length(%scan(&liste,&i))>0);
    %global &racine&i;
    %let &racine&i=%scan(&liste,&i);
    %put &racine&i=&&&racine&i;
    %let i=%eval(&i+1);
  %end;
  %let i=%eval(&i-1);
  %global n&racine;
  %let n&racine=&i;
  %put n&racine=&&n&racine;

%mend liste;



%macro listed(liste=,racine=,delimit=);

  %local i;
  %let i=1;
  %do %while(%length(%scan(&liste,&i,&delimit))>0);
    %global &racine&i;
    %let &racine&i=%scan(&liste,&i,&delimit);
    %put &racine&i=&&&racine&i;
    %let i=%eval(&i+1);
  %end;
  %let i=%eval(&i-1);
  %global n&racine;
  %let n&racine=&i;
  %put n&racine=&&n&racine;

%mend listed;


%macro xliste(prefixe=,liste=);

  %local i;
  %let i=1;
  %do %while(%length(%scan(&liste,&i))>0);
    &prefixe.%scan(&liste,&i)
    %let i=%eval(&i+1);
  %end;

%mend xliste;


%macro ineg(liste=,racine=);

  %global &racine;
  %global s&racine;
  %global v&racine;
  %let &racine=%scan(&liste,1,<>);
  %put &racine=&&&racine;
  %if %length(%scan(&liste,2,<>))>0 %then %do;
    %let v&racine=%scan(&liste,2,<>);
    %put v&racine=&&v&racine;
    %put "%substr(&liste,%eval(%index(&liste,&&v&racine)-1),1)";
    %if "%substr(&liste,%eval(%index(&liste,&&v&racine)-1),1)"="<" %then %let s&racine=-1;
    %else %let s&racine=1;
    %put s&racine=&&s&racine;
  %end;
  %else %do;
    %let s&racine=0;
    %put s&racine=&&s&racine;
    %let v&racine=0;
    %put v&racine=&&v&racine;
  %end;

%mend ineg;



%macro decoupe(liste=,racine=);

  %local i;
  %let i=1;
  %do %while(%length(%scan(&liste,&i))>0);
    %global &racine&i;
    %let &racine&i=%scan(&liste,&i);
    %put &racine&i=&&&racine&i;
    %let i=%eval(&i+1);
  %end;
  %let i=%eval(&i-1);
  %global n&racine;
  %let n&racine=&i;
  %put n&racine=&&n&racine;

  %local somme;
  %do i=1 %to &&n&racine;
    %if %index(&&&racine&i,:)=0 %then %do;
      %global n&racine&i._;
      %let n&racine&i._=0;
      %put n&racine&i._=&&n&racine&i._;
    %end;
    %else %do;
      %let somme=%scan(&&&racine&i,2,:);
      %global &racine&i;
      %let &racine&i=%scan(&&&racine&i,1,:);
      %put &racine&i=%scan(&&&racine&i,1,:);
      %listed (liste=&somme,racine=&racine&i._,delimit=\);
    %end;
  %end;

%mend decoupe;



%macro decoupe2(liste=,racine=);

  %local i;
  %let i=1;
  %do %while(%length(%scan(&liste,&i))>0);
    %global &racine&i;
    %let &racine&i=%scan(&liste,&i,%str( ));
    %put &racine&i=&&&racine&i;
    %let i=%eval(&i+1);
  %end;
  %let i=%eval(&i-1);
  %global n&racine;
  %let n&racine=&i;
  %put n&racine=&&n&racine;

  %local somme;
  %do i=1 %to &&n&racine;
    %if %index(&&&racine&i,%str(:))=0 %then %do;
      %global n&racine&i._;
      %let n&racine&i._=0;
      %put n&racine&i._=&&n&racine&i._;
    %end;
    %else %do;
      %let somme=%scan(&&&racine&i,2,%str(:));
      %global &racine&i;
      %let &racine&i=%scan(&&&racine&i,1,%str(:));
      %put &racine&i=%scan(&&&racine&i,1,%str(:));
      %listed (liste=&somme,racine=&racine&i._,delimit=\);
      %do j=1 %to &&n&racine&i._;
        %ineg(liste=&&&racine&i._&j,racine=&racine&i._&j);
      %end;
    %end;
  %end;

%mend decoupe2;


%macro numseq(entree=,sortie=);

   %local i;
   %local j;
   %local k;
   %let k=1;
   %do i=1 %to &&n&entree;
     %do j=1 %to &&n&entree&i._;
       %global &sortie.1_&k;
       %global &sortie.2_&k;
       %let &sortie.1_&k=&&&entree&i;
       %put &sortie.1_&k=&&&sortie.1_&k;
       %let &sortie.2_&k=&&&entree&i._&j;
       %put &sortie.2_&k=&&&sortie.2_&k;
       %let k=%eval(&k+1);
     %end;
   %end;
   %global n&sortie;
   %let n&sortie=%eval(&k-1);
   %put n&sortie=&&n&sortie;

%mend numseq;


%macro numseq2(entree=,sortie=);

   %local k;
   %let k=1;
   %do i=1 %to &&n&entree;
     %do j=1 %to &&n&entree&i._;
       %global &sortie.1_&k;
       %global &sortie.2_&k;
       %global &sortie.3_&k;
       %global &sortie.4_&k;
       %let &sortie.1_&k=&&&entree&i;
       %put &sortie.1_&k=&&&sortie.1_&k;
       %let &sortie.2_&k=&&&entree&i._&j;
       %put &sortie.2_&k=&&&sortie.2_&k;
       %let &sortie.3_&k=&&s&entree&i._&j;
       %put &sortie.3_&k=&&&sortie.3_&k;
       %let &sortie.4_&k=&&v&entree&i._&j;
       %put &sortie.4_&k=&&&sortie.4_&k;
       %let k=%eval(&k+1);
     %end;
   %end;
   %global n&sortie;
   %let n&sortie=%eval(&k-1);
   %put n&sortie=&&n&sortie;

%mend numseq2;



/*___ Supplémentaires _________________________________________________________*/


%macro nomsi(racine=,indic=,nombre=);
  %local i;
  %do i=1 %to &nombre;
    %if &&&indic&i=1 %then &racine&i;
  %end;
%mend nomsi;



/* une seule variable

   entrée : racine = nom de la macro variable en entrée
            var    = variable à créer
            nomvar = nom de la table créée */

%macro crtab(racine=,var=,nomtab=);

  %local i;
  %do i=1 %to &&n&racine;

    data _tab&i;
      length &var $8;
      &var="&&&racine._&i";
    run;

  %end;

  data &nomtab;
  set %nom(racine=_tab,nombre=&&n&racine);
  run;

%mend crtab;



/* plusieurs variables

   entrée : racine = racine du nom des macros variables en entrée
                     (le nbr sera &&n&racine, les macros &&&racine.1, &&&racine.2, ...)
            var    = liste des variables à créer
            nomvar = nom de la table créée */

%macro creetab(racine=,var=,nomtab=);

  %liste(liste=&var,racine=vari);

  %local i;
  %do i=1 %to &&n&racine;

    data _tab&i;
    %do j=1 %to &nvari;
      length &&vari&j $8;
      &&vari&j="&&&racine.&j._&i";
    %end;
    run;

  %end;

  data &nomtab;
  set %nom(racine=_tab,nombre=&&n&racine);
  run;

%mend creetab;



/* crée des macro variables à partir d'une variable d'une table
table   = table en entrée
var     = variable concernée dans la table en entrée
macrvar = racine de la macro variable en sortie
*/


%macro callsym(table=,var=,macrvar=);

  %local i;
  %global n&macrvar;

  data _null_;
  set &table;
  call symput ("n&macrvar",_N_);
  run;

  %do i=1 %to &&n&macrvar;

    %global &macrvar._&i;

    data _null_;
    set &table;
    if _N_=&i;
    call symput ("&macrvar._&i",&var);
    run;

    %put &macrvar._&i=&&&macrvar._&i;

  %end;

%mend callsym;



/* crée une table contenant les modalités d'une variable d'une autre table
table = table en entrée
var   = variable concernée
modal = table en sortie */

%macro modalite(table=,var=,modal=);

  %local i;
  %local j;
  %local vtest;
  %global n&var;

  data _null_;
  set &table;
  call symput("v"!!left(_N_),&var);
  call symput("nv",_N_);
  run;

  %global &var._1;
  %let &var._1=&v1;
  %put &&&var._1;
  %let n&var=1;

  %do i=2 %to &nv;
    %let vtest=0;
    %let j=1;
    %do %while (&vtest=0 and &j<=&&n&var);
      %if &&v&i=&&&var._&j %then %let vtest=1;
      %let j=%eval(&j+1);
    %end;
    %if &vtest=0 %then %do;
      %let n&var=%eval(&&n&var+1);
      %global &var._&&n&var;
      %let &var._&&n&var=&&v&i;
      %put &&&&&var._&&n&var;
    %end;
  %end;

  %crtab(racine=&var,var=mod,nomtab=&modal);

%mend modalite;





/* dichotomisation d'une ou de plusieurs variables

table  = table en entrée
var    = liste des variables concernées
modal  = table contenant les variables dont on créera les indicatrices ainsi que leur modalités
dicho  = racine du nom des variables indicatrices
option = si option est à oui, le programme construira lui même la table modal */

%macro dicho(table=,var=,modal=,dicho=,option=);

  %local i;
  %local j;

  %liste(liste=&var,racine=var);

  %if &option=oui %then %do;
    %do i=1 %to &nvar;
      %modalite(table=&table,var=&&var&i,modal=_mod&i);

      data _mod&i;
      length var $8;
      set _mod&i;
      var="&&var&i";
      run;

    %end;

    data &modal;
    set %nom(racine=_mod,nombre=&nvar);;
    run;

  %end;
  %else %do;
    %do i=1 %to &nvar;

      data _mod&i;
      set &modal;
      if var="&&var&i";
      run;

      %callsym(table=_mod&i,var=mod,macrvar=&&var&i);
    %end;
  %end;

  %put nvar=&nvar;

  data &table;
  %do i=1 %to &nvar;
    %do j=1 %to &&&&n&&var&i;
      length &dicho&i._&j 3;
    %end;
  %end;
  set &table;
  %do i=1 %to &nvar;
    %do j=1 %to &&&&n&&var&i;
      if &&var&i="&&&&&&var&i.._&&j" then &dicho&i._&j=1;
      else &dicho&i._&j=0;
      ;
    %end;
  %end;
  run;

%mend dicho;



%macro comptobs(table=,var=,tri=,compteur=);
/* pour chaque modalité de "Var", on compte les "tri": on obtient un numero d'ordre */

  %local i;

  proc sort data=&table;
  by &var &tri;
  run;

  %liste(liste=&var,racine=vari);

  data &table(drop=_pcompt);
  set &table;
  by &var;
  retain _pcompt;
  &compteur=_pcompt+1;
  %do i=1 %to &nvari;
    if first.&&vari&i then &compteur=1;
  %end;
  _pcompt=&compteur;
  run;

%mend comptobs;


%macro estimod(entree=,sortie=);

  proc means data=&entree noprint;
  by var;
  weight count;
  var coeff;
  output out=_varia mean=estivar;
  run;

  proc means data=_varia noprint;
  var estivar;
  output out=_moy sum=estisum;
  run;

  data _varia;
  set _varia;
  fusion=1;
  run;

  data _moy;
  set _moy;
  fusion=1;
  run;

  data _varia (keep=var estivar2 estivar estisum);
  merge _varia _moy;
  by fusion;
  estivar2=estisum-estivar;
  run;

  data &sortie(keep=var mod count esti);
  merge &entree _varia;
  by var;
  esti=coeff+estivar2;
  run;

%mend estimod;



/*___ Sous programmes _________________________________________________________*/


%macro relie(reg=,tabe=,tabs=,tabid=,dateinf=,datesup=,nbj=,fluxmin=,fluxmax=,nombob=);


  data &tabs(drop=runi);
  merge &tabe;
  by idx;
  reg="&reg";
  retain runi;
  if first.idx then runi=ranuni(10);
  if runi<&nombob;
  /* Condition eliminant les demandes où le demandeur n'est pas disponible (maladie, formation) */
  * if CATREGR="1" or CATREGR="2" or CATREGR="3" /* or CATREGR="6" or CATREGR="7" or CATREGR="8"*/;
  if DATANN="" then do;
    DATANN=MDY(12,31,2012);

    censored=1;
  end;
  else censored=0;
  *D1V8j=input(D1V8!!JV8,yymmdd8.);
  *DATANNj=input(D1V24!!JV24,yymmdd8.);
  duree=DATANN-DATINS;
  run;


  data ident_periode (keep=idx);
  set &tabs;
  by idx;
  /* Identification des demandeurs entrant entre dateinf et datesup */
 * if DATINS>=input("&dateinf",yymmdd10.) and DATINS<input("&datesup",yymmdd10.) and
(CATREGR="1" or CATREGR="2" or CATREGR="3") ;

  /* en plus, on ne selectionne que les premieres demandes */
  *if ndem=1;
   run;

  data &tabs;
  merge &tabs ident_periode(In=a);
  by idx;
  if a=1 then select_per=1;
  else select_per=0;

  proc sort data=&tabs;
  by idx descending DATINS;
  run;

  /**** INTERET ????? *****/



/*
  data &tabs (drop=DATINSp DATANNp comptp censp);
  set &tabs;
  by idx;
  retain DATINSp DATANNp  comptp censp;
  if _N_=1 then comptp=0;
  if first.idx=1 then compt=comptp+1;
  if first.idx=0 then do;
    if DATINSp<=DATANN+&nbj then do;
      DATANN=max(DATANN,DATANNp);
      if max(DATANN,DATANNp)=DATANNp then do;
        censored=censp;
      end;
      compt=comptp;
    end;
    else compt=comptp+1;
  end;
  DATINSp=DATINS;
  DATANNp=DATANN;
  comptp=compt;
  censp=censored;
  run;


  proc sort data=&tabs;
  by compt;

  data &tabs (drop=compt idxp aleap);
  set &tabs;
  by compt;
  retain idxp aleap;
  if last.compt;
 * if DATINS>=input("&dateinf",yymmdd10.) and DATINS<input("&datesup",yymmdd10.) ;
  alea=uniform(7);
  duree=DATANN-DATINS;
  if idxp=idx then alea=aleap;
  aleap=alea;
  idxp=idx;
  run;

  %comptobs(table=&tabs,var=idx,tri=DATINS,compteur=ordre);

  proc sort data=&tabs;
  by alea;
  run;

  data &tabs(drop=alea aleap comptp);
  set &tabs;
  retain aleap comptp;
  if _N_=1 then compt=1;
  else do;
    if alea=aleap then compt=comptp+1; else compt=comptp;
  end;
  comptp=compt;
  aleap=alea;
  run;

  data &tabs (drop=compt);
  set &tabs;
  groupe=mod(compt,10);
  plus2=0;
  plus3=0;
  plus4=0;
  plus5=0;
  plus6=0;
  plus7=0;
  if ordre>=2 then plus2=1;
  if ordre>=3 then plus3=1;
  if ordre>=4 then plus4=1;
  if ordre>=5 then plus5=1;
  if ordre>=6 then plus6=1;
  if ordre>=7 then plus7=1;
 run;

  */




  proc sort data=&tabs;
  by idx ndem;
  data &tabid ;
  set &tabs;
  keep idx reg ndem;
  by  reg idx ndem;
   run;


%mend relie;

%macro relieeo (reg=,tabeeo=,tabseo=,nombob=);

  data &tabseo;
  set &tabeeo;
  by idx;
  reg="&reg";

  proc sort data=&tabseo;
  by idx ndem mois;
  run;


  %comptobs(table=&tabseo,var=idx ndem,tri=mois,compteur=cpte);


data ident_idx;
set libs.ident;
if reg=&reg;

data ident_idx (keep=idx reg);
set ident_idx;
by idx;
if last.idx;

data &tabseo;
merge &tabseo(In=In1 drop=reg) ident_idx(In=In2) ;
by idx;
if In2=1;
run;

 data &tabseo(drop=runi);
  set &tabseo;
  by idx;
   retain runi;
  if first.idx then runi=ranuni(10);
  if runi<&nombob;
  run;


/*data moy;
set &tabseo;
  by idx ndem;
  if last.idx then output;
else if last.ndem then output;

  run;

 proc sort data=moy;
  by ndem;
  run;
proc means data=moy;
var cpte;
by ndem;

proc datasets;
  delete moy;
  run;   */


%mend relieeo;

%macro reliedo (reg=,tabeeo=,tabfeo=,tabseo=,varcons=);
data &tabeeo;
set &tabeeo;


 reg="&reg";

  proc sort data=&tabeeo;
  by reg idx ndem;
  proc sort data=&tabfeo;
  by reg idx ndem;
  data &tabseo;
  merge &tabeeo(keep=idx reg ndem &varcons)  &tabseo &tabfeo(in=in1 keep=idx reg ndem datins datann );
  by reg idx ndem;
  if in1=1;
  /*reg="&reg";*/
  run;

%mend reliedo;

%macro relied3_di (reg=,tabeeo=,tabseo=);

data &tabeeo;
set &tabeeo;


 proc sort data=&tabeeo;
  by idx ;
run;

data ident_idx;
set libs.ident;
if reg=&reg;

data ident_idx (keep=idx reg);
set ident_idx;
by idx;
if last.idx;

data &tabseo;
merge &tabeeo(In=In1 ) ident_idx(In=In2) ;
by idx;
if In2=1;
if in1=0 then abs_d3_di=1;
else  abs_d3_di=0;
run;




%mend relied3_di;

%macro relied3_ar (reg=,tabeeo=,tabseo=);

data &tabeeo;
set &tabeeo;


proc sort data=&tabeeo;
  by idx ;
run;

data &tabseo;
merge &tabeeo(In=In1 ) ident_idx(In=In2) ;
by idx;
if In2=1;
if in1=0 then abs_d3_ar=1;
else  abs_d3_ar=0;
run;




%mend relied3_ar;

%macro relied3_pjc (reg=,tabeeo=,tabseo=);

data &tabeeo;
set &tabeeo;

proc sort data=&tabeeo;
  by idx ;
run;

data &tabseo;
merge &tabeeo(In=In1 ) ident_idx(In=In2) ;
by idx;
if In2=1;
if in1=0 then abs_d3_pjc=1;
else  abs_d3_pjc=0;
run;




%mend relied3_pjc;




/*___ Programmes principaux _________________________________________________________*/




%macro anpe_tab(dire=,dirs=,dateinf=,datesup=,nbj=,nombob=);

  libname libe "&dire";
  libname libs "&dirs";

  %let liste=116 211 221
231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941 952 953 954 955
  ;

  %liste(liste=&liste,racine=region);

  %relie(reg=&region1,tabe=libe.R&region1._de_201212_echant,tabs=libs.France,tabid=libs.ident,
dateinf=&dateinf,datesup=&datesup,fluxmin=/*19931001 19951001 19961001 19971001 19981001*/,
fluxmax= /*19931230 19951230 19961230 19971230 19981230*/,nbj=&nbj,nombob=&nombob);

/* %relie(reg=116,tabe=libs.R116_de_201212_echant,tabs=libs.France,tabid=libs.ident,
dateinf=20050101,datesup=20051230,fluxmin=,
fluxmax= ,nbj=30,nombob=0.05);  */

data libs.Francedi;
set libs.France;
run;



%reliedo(reg=&region1,tabeeo=libe.R&region1._d2_201212_echant,tabfeo=libs.France,tabseo=libs.Francedi,
varcons=indem regind filindem regime odddmax jourdv jourfv);

  %do i=2 %to &nregion;
    %relie(reg=&&region&i,tabe=libe.R&&region&i.._de_201212_echant,tabs=ajout,tabid=ajid,
dateinf=&dateinf,datesup=&datesup,
fluxmin=/*19931001 19951001 19961001 19971001 19981001*/,
fluxmax=/*19931230 19951230 19961230 19971230 19981230*/,nbj=&nbj,nombob=&nombob);
 %reliedo(reg=&&region&i,tabeeo=libe.R&&region&i.._d2_201212_echant,tabfeo=libs.France,tabseo=libs.Francedi,
varcons=indem regind filindem regime odddmax jourdv jourfv);


    data libs.France;
    set libs.France ajout;

    data libs.ident;
    set libs.ident ajid;

    run;
  %end;


%mend anpe_tab;

%macro d3_tab(dire=,dirs=);

  libname libs "&dirs";


  %let liste=116 211 221
231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941 952 953 954 955
  ;

  %liste(liste=&liste,racine=region);



/*
%let dire=D:\pole_emploi\D3_201212\reg ;
  libname libe "&dire&&region1.\";

%let i=1;
libname libe "&&dire&&&region&i.\";
                                       */


    libname libe "&dire&&region1.\";

%relied3_di(reg=&region1,tabeeo=libe.di,tabseo=libs.France_d3di);


%relied3_ar(reg=&region1,tabeeo=libe.ar,tabseo=libs.France_d3ar);

%relied3_pjc(reg=&region1,tabeeo=libe.pjc,tabseo=libs.France_d3pjc);

  %do i=2 %to &nregion;

     libname libe "&&dire&&&region&i.\";
%relied3_di(reg=&&region&i,tabeeo=libe.di,tabseo=ajout_di);


%relied3_ar(reg=&&region&i,tabeeo=libe.ar,tabseo=ajout_ar);


%relied3_pjc(reg=&&region&i,tabeeo=libe.pjc,tabseo=ajout_pjc);


    data libs.France_d3di;
    set libs.France_d3di ajout_di;

     data libs.France_d3ar;
    set libs.France_d3ar ajout_ar;

    data libs.France_d3pjc;
    set libs.France_d3pjc ajout_pjc;


    run;
  %end;


%mend d3_tab;


%macro actr_tab(dire=,dirs=,nombob=);

  libname libe "&dire";
  libname libs "&dirs";

%let liste=116 211 221 231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941 952 953 954 955;

  %liste(liste=&liste,racine=region);

 %relieeo(reg=&region1,tabeeo=libe.R&region1._e0_201212_echant,tabseo=libs.ARFrance,nombob=&nombob);


  %do i=2 %to &nregion;

%relieeo(reg=&&region&i,tabeeo=libe.R&&region&i.._e0_201212_echant,tabseo=ARajout,nombob=&nombob);


    data libs.ARFrance;
    set libs.ARFrance ARajout;

    run;
  %end;

  proc datasets;
  delete ARajout;
  run;

%mend actr_tab;

%macro flux(tabs=,fluxmin=,fluxmax=);

  proc sort data=&tabs;
  by reg idx;

  %liste(liste=&fluxmin,racine=fmin);
  %liste(liste=&fluxmax,racine=fmax);

  data idflux1(keep=idx reg flux);
  set &tabs;
  by reg idx;
  if DATINS>=input("&fmin1",yymmdd10.) and DATINS<input("&fmax1",yymmdd10.) ;
  flux=1;
  data flux1;
  merge &tabs idflux1(in=in1);
  by reg idx;
  if in1;

  %do i=2 %to &nfmin;
  data idflux&i(keep=idx reg flux);
  set &tabs;
  by reg idx;
  if DATINS>=input("&&fmin&i",yymmdd10.) and DATINS<input("&&fmax&i",yymmdd10.) ;
  flux=&i;
  data flux&i;
  merge &tabs idflux&i(in=in1);
  by reg idx;
  if in1;


  %end;

  data &tabs;
  set flux1;
  %do i=2 %to &nfmin;
  data &tabs;
  set &tabs flux&i;
  %end;


  run;
%mend flux;


%macro recodes(table=);

  data &table ;
  length ageq $ 1;
 * length forma $ 1;
  length agsex $ 2;
  set &table;

  un=1;

  dep=substr(ALE,1,2);

  agej=DATINS-DATNAIS;*input(D1V8!!JV8,yymmdd8.)-input(D0V7!!D0V8,yymmn6.);

 * agean=int(agej/365.25);

  if age<=20 then ageq=1;
  if age>=21 and age<=25 then ageq=2;
  if age>=26 and age<=30 then ageq=3;
  if age>=31 and age<=35 then ageq=4;
  if age>=36 and age<=40 then ageq=5;
  if age>=41 and age<=45 then ageq=6;
  if age>=46 and age<=50 then ageq=7;
  if age>=51 then ageq=8;



  if SEXE=1 then agsex="h"!!ageq; else agsex="f"!!ageq;

  /*if NIVFOR in ("AGR", "AU1", "AU2", "CA2", "CN1", "CN2", "CPS", "DCF", "DCO",
               "DE ", "DEC", "DES", "DE1", "DE2", "DIG", "DO ", "EC3", "FP2",
               "ICN", "IEP", "IGE", "IUP", "LIC", "MA ", "MAI", "MIA", "MS ",
               "PM3", "UP ") then forma="1";
  if NIVFOR in ("AU3", "BEI", "BTS", "CA3", "CN3", "DEF", "DEU",
              "DE3", "DUT", "EC2", "EUG", "FP3", "IPC", "PM2") then forma="2";
  if NIVFOR in ("A  ", "AU4", "B  ", "BAC", "BM ", "BP ", "BT ", "BT1", "BT2", "BUE",
              "C  ", "CA4", "CDR", "D  ", "DPC", "E  ", "ES ", "ESE", "F  ", "FP4",
              "FSG", "FST", "F1 ", "F10", "F11", "F12", "F2 ", "F3 ", "F4 ", "F5 ",
              "F6 ", "F7 ", "F7'", "F8 ", "F9 ", "G  ", "G1 ", "G2 ", "G3 ", "H  ",
              "L  ", "PRO", "P1 ", "P10", "P11", "P12", "P13", "P14", "P15", "P16",
              "P17", "P18", "P19", "P2 ", "P20", "P21", "P22", "P23", "P24", "P25",
              "P26", "P27", "P28", "P29", "P3 ", "P30", "P31", "P32", "P33", "P34",
              "P35", "P36", "P37", "P38", "P39", "P4 ", "P40", "P41", "P42", "P43",
              "P44", "P45", "P46", "P5 ", "P6 ", "P7 ", "P8 ", "P9 ", "S  ", "SMS",
              "STI", "STL", "STT") then forma="3";
  if NIVFOR in ("AU5", "BEP", "CAP", "CA5", "C12", "C2G", "C2T", "FP5") then forma="4";
  if NIVFOR in ("CP1", "C3A") then forma="5";
  if NIVFOR in ("AFS", "CEP", "CFG", "CP ", "CP4", "C1S") then forma="6";
  if NIVFOR in (" ", "000") then forma="9";  */


  *if D1V11="23" then D1V11="22";


  if QUALIF="" then QUALIF="0";


  if ROME="" then ROME="00001";
  ALE_num=ALE+0;

  annee=year(DATINS);

   run;

%mend recodes;




%macro spnde;

  %let liste=116 211 221 231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941 952 953 954 955;

  %liste(liste=&liste,racine=region);

  data id&region1;
  set libs.ident;
  if reg="&region1";

  data e1Fr(keep=reg IDX E1V10j);
  merge libs.e1&region1 id&region1(in=in1);
  if in1;
  if substr(E1V14,1,2)="NL";
  E1V10j=input(E1V10!!JV10,yymmdd8.);
  reg="&region1";
  run;

  %do i=2 %to &nregion;

    data idajout;
    set libs.ident;
    if reg="&&region&i";

    data ajout(keep=reg IDX E1V10j);
    merge libs.e1&&region&i idajout(in=in1);
    if in1;
    if substr(E1V14,1,2)="NL";
    E1V10j=input(E1V10!!JV10,yymmdd8.);
    reg="&&region&i";
    run;

    data e1Fr;
    set e1Fr ajout;
    run;

  %end;

  proc datasets;
  delete ajout idajout ;
  run;

  proc sort data=libs.France;
  by reg IDX;
  run;

  proc sort data=e1Fr;
  by reg IDX;
  run;

  data libs.France;
  merge libs.France e1Fr;
  by reg IDX;
  if (D1V8j<=E1V10j and D1V24j>=E1V10j) or (D1V8j<=E1V10j and censored=1) then spnde="1";
  else spnde="0";
  run;

  proc sort data=libs.France;
  by reg IDX ndem descending spnde;
  run;

  data libs.France;
  set libs.France;
  by reg IDX ndem;
  if first.ndem;
  if ndem^=.;
  if spnde="0" then E1V10J=.;
  run;

%mend spnde;



%macro prep;

  data libs.chomage2(rename=(date=D1V8));
  set libs.chomage;
  if substr(date,5,2)="03" then do;
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"02";
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"01";
    datej=input(date!!"01",yymmdd8.);
    output;
  end;
  if substr(date,5,2)="06" then do;
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"05";
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"04";
    datej=input(date!!"01",yymmdd8.);
    output;
  end;
  if substr(date,5,2)="09" then do;
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"08";
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"07";
    datej=input(date!!"01",yymmdd8.);
    output;
  end;
  if substr(date,5,2)="12" then do;
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"11";
    datej=input(date!!"01",yymmdd8.);
    output;
    date=substr(date,1,4)!!"10";
    datej=input(date!!"01",yymmdd8.);
    output;
  end;

  data libs.chomage2(rename=(chomage=cho));
  set libs.chomage2;
  run;

  data libs.chomage2 (keep=dep D1V8 cho);
  set libs.chomage2;
  run;

  proc sort data=libs.chomage2;
  by dep D1V8;
  run;

%mend prep;



/* ajoûte bassin d'emploi et taux de chômage par département aux fichiers régionaux */

%macro chomage(region=);

  proc sort data=libs.ale;
  by bas;
  run;

  data libs.bas (drop=ale);
  set libs.ale;
  by bas;
  if first.bas;
  run;

  %liste(liste=&region,racine=reg);

  %do i=1 %to &nreg;

    data libs.bas&&reg&i;
    set libs.bas;
    if reg="&&reg&i";
    run;

    proc sort data=libs.bas&&reg&i;
    by bas;
    run;

    %callsym(table=libs.bas&&reg&i,var=bas,macrvar=b&&reg&i);

    data libs.r&&reg&i;
    set libs.France;
    if reg="&&reg&i";
    run;

    proc sort data=libs.r&&reg&i;
    by ALE;
    run;

    data libs.ale&&reg&i;
    set libs.ale;
    if reg="&&reg&i";
    run;

    data ale(keep=ale bas);
    set libs.ale&&reg&i;
    run;

    proc sort data=ale;
    by ALE;
    run;

    data libs.r&&reg&i;
    merge libs.r&&reg&i(in=in1) ale;
    by ALE;
    if in1=1;
    run;

    proc sort data=libs.chomage2;
    by dep D1V8;
    run;

    proc sort data=libs.r&&reg&i;
    by dep D1V8;
    run;

    data libs.r&&reg&i;
    merge libs.r&&reg&i libs.chomage2;
    by dep D1V8;
    if reg="&&reg&i";


    run;

  %end;

%mend chomage;

%macro chomage2(tabs=,region=);
  %liste(liste=&region,racine=reg);
  data &tabs(compress=yes);;
  set libs.r&reg1;
  run;
  %do i=2 %to &nreg;
    data &tabs(compress=yes);;
    set &tabs libs.r&&reg&i;
  %end;
    run;

%mend chomage2;



%macro anpe(dire=,dirs=,tabe1=,tabe2=,geo=,var=,test=);

  libname libe "&dire";
  libname libs "&dirs";


  /* liste des zones géographiques */

  %liste(liste=&geo,racine=zone);
  %do i=1 %to &nzone;
    %let ajout=&&zone&i;
    %if &&zone&i=France %then %let ajout=000;
    %if &&zone&i=Metropole %then %let ajout=001;
    %if &&zone&i=DOM %then %then %let ajout=002;
    %if &&zone&i=Province %then %let ajout=003;
    %if &&zone&i=IDF %then %let ajout=116;
    %if &&zone&i=regs %then %let ajout=116 211 221 231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941
                                          952 953 954 955;
    %if &&zone&i=DOMs %then %let ajout=952 953 954 955;
    %if &&zone&i=RegProv %then %let ajout=116 211 221 231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941;
    %if  &i=1 %then %let regs=&ajout; %else %let regs=&regs &ajout;
  %end;

  %put regs=&regs;

  %liste(liste=&regs,racine=zone);

  %do i=1 %to &nzone;
    %let zoner&i=&&zone&i;
    %if &&zone&i=000 %then %let zoner&i=116 211 221 231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941 952 953
                                      954 955;
    %if &&zone&i=001 %then %let zoner&i=116 211 221 231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941;
    %if &&zone&i=002 %then %let zoner&i=952 953 954 955;
    %if &&zone&i=003 %then %let zoner&i=211 221 231 241 251 261 311 411 421 431 521 531 541 721 731 741 821 831 911 931 941;
    %put zone&i=&&zone&i;
    %put zoner&i=&&zoner&i;
  %end;


  /* liste des variables */

  %liste(liste=&var,racine=var);

  %do i=1 %to &nzone;

    %do j=1 %to &nvar;

      %survie(table=libe.&tabe1,tabsurv=tabs,var=&&var&j);

      filename fic "&dirs\S&&zone&i.._&&var&j...txt";

      data _null_;
      set tabs;
      file fic;
      put &&var&j duree survival sdf_lcl sdf_ucl;
      run;

      filename fic clear;

      %if &test=oui %then %do;

        %comptobs(table=libe.&tabe2,var=&&var&j,tri=alea,compteur=c);

        data table3;
        set libe.&tabe2;
        if c<=1000;
        run;

        %survie2(table=table3,var=&&var&j);

        %modalite(table=table3,var=&&var&j,modal=t&j);

        %do k=2 %to &&&&n&&var&j;
          %do l=1 %to %eval(&k-1);

            data tab;
            set table3;
            if &&var&j="&&&&&&var&j.._&&k" or &&var&j="&&&&&&var&j.._&&l";
            run;

            %survie2(table=tab,var=&&var&j);

          %end;
        %end;

      %end;

    %end;

  %end;

%mend anpe;



%macro cox(table=,clasvar=,numvar=,modal=,nomfic=,valid=,estim=);

  %local i;
  %local j;

  %if &valid<&estim %then %let valid=&estim;

  %liste(liste=&clasvar,racine=v);
  %liste(liste=&numvar,racine=x);

  %do i=1 %to &nv;

    data _mod&i;
    set &modal;
    if var="&&v&i";
    run;

    %callsym(table=_mod&i,var=ref,macrvar=o&i);

    %do j=1 %to &&&&n&&v&i;
      %let o&i._&j=%eval(1-&&o&i._&j);
    %end;

  %end;

  data estim;
  set &table;
  if groupe<5;
  %if &estim>0 %then %do;
    if input(D1V8!!JV8,yymmdd8.)<=input("20000630",yymmdd8.)-&estim;
    if duree>=&estim;
    duree=duree-&estim;
  %end;
  run;


  data valid;
  set &table;
  if groupe>=5;
  %if &estim>0 %then %do;
    if input(D1V8!!JV8,yymmdd8.)<=input("20000630",yymmdd8.)-&estim;
    if duree>=&estim;
  %end;
  run;


  data un (keep=%do i=1 %to &nv;
                  %nomsi(racine=i&i._,indic=o&i._,nombre=&&&&n&&v&i)
                %end;
                &numvar);
  set estim;
  if _N_=1;
  %do i=1 %to &nv;
    %do j=1 %to &&&&n&&v&i;
      %if &&o&i._&j=1 %then i&i._&j=0;;
    %end;
  %end;
  %do i=1 %to &nx;
    &&x&i=0;
  %end;
  run;

  proc phreg data=estim outest=libs.t&nomfic covout simple;
  model duree*censored(1)=%do i=1 %to &nv;
                            %nomsi(racine=i&i._,indic=o&i._,nombre=&&&&n&&v&i)
                          %end;
                          &numvar
                         /* / selection=stepwise*/;
  baseline out=tabs2 covariates=un survival=survie;
  run;

  data tabs;
  set libs.t&nomfic;
  if _N_=1;
  run;

  proc print data=tabs2;
  run;

  proc print data=tabs;
  run;

  data tabs (rename=(%do i=1 %to &nv;
                       %do j=1 %to &&&&n&&v&i;
                         %if &&o&i._&j=1 %then i&i._&j=w&i._&j;
                       %end;
                     %end;
                     %do i=1 %to &nx;
                       &&x&i=w&&x&i
                     %end;));
  set tabs;
  run;

  %if &estim>0 %then %do;

    data tabs;
    set tabs;
    duree=duree+&estim;
    run;

    data tabs2;
    set tabs2;
    duree=duree+&estim;
    run;

  %end;

  %if &valid>0 %then %do;

    data tabs3 (keep=survie fusion);
    set tabs2;
    retain dureep survp diff4p;
    fusion=1;
    if _N_=1 then do;
      diff4p=&valid;
    end;
    diff4=&valid-duree;
    if diff4p>=0 and diff4<0 then do;
      dureei=duree;
      survi=survie;
      duree=dureep;
      survie=survp;
      output;
      duree=dureei;
      survie=survi;
    end;
    diff4p=diff4;
    dureep=duree;
    survp=survie;
    run;

    data tabs3 (rename=(survie=base));
    set tabs3;
    if _N_=1;
    run;

    proc print;
    run;

  %end;

  data tabs2;
  set tabs2;
  retain dureep survp diff4p;
  fusion=1;
  if _N_=1 then do;
    diff4p=365;
  end;
  diff4=365-duree;
  if diff4p>=0 and diff4<0 then do;
    dureei=duree;
    survi=survie;
    duree=dureep;
    survie=survp;
    output;
    duree=dureei;
    survie=survi;
  end;
  diff4p=diff4;
  dureep=duree;
  survp=survie;
  run;

  data tabs2 (keep=survie fusion);
  set tabs2;
  if _N_=1;
  run;

  proc print;
  run;


  %if &valid>0 %then %do;

    data tabs2 (drop=base);
    merge tabs2 tabs3;
    survie=survie/base;
    run;

    proc print;
    run;

  %end;

  data tabs2;
  merge tabs tabs2;
  run;


  /****************************/

  /*
  proc means data=tabs2;
  var &numvar;
  output out=_moyenne mean=%xnomref(prefixe=m,racine=x,nombre=&nx);
  run;

  proc freq data=estim noprint;
  tables &v1 / out=_frequ;
  run;

  data _frequ (keep=var mod count);
  length mod $ 6;
  length var $ 8;
  set _frequ;
  mod=&v1;
  var="&v1";
  run;


  %do i=2 %to &nv;

    proc freq data=estim noprint;
    tables &&v&i / out=_ajout;
    run;

    data _ajout (keep=var mod count);
    length mod $ 6;
    length var $ 8;
    set _ajout;
    mod=&&v&i;
    var="&&v&i";
    run;

    data _frequ;
    set _frequ _ajout;
    run;

  %end;

  data _modal;
  set &modal;
  fusion=1;
  run;

  data _modal (drop=fusion);
  merge _modal tabs2;
  by fusion;
  run;

  proc sort data=_modal;
  by var;
  run;

  data _modal (keep=var mod libvar intitule coeff survie);
  set _modal;
  by var;
  retain compt;
  if first.var then compt=1;
  else compt=compt+1;
  %do i=1 %to &nv;
    if var="&&v&i" then do;
      coeff=0;
      %do j=1 %to &&&&n&&v&i;
        %if &&o&i._&j=1 %then %do;
          if compt=&j then coeff=w&i._&j;
        %end;
      %end;
      output;
    end;
  %end;
  if coeff=. then coeff=0;
  run;

  proc sort data=_modal;
  by var mod;
  run;

  proc sort data=_frequ;
  by var mod;
  run;

  data _modal;
  merge _modal(in=in1) _frequ;
  by var mod;
  if in1=1;
  run;

  proc means data=_modal;
  weight _frequ;
  var coeff;
  output out=_modal2 mean=esti;
  run;

  %estimod(entree=_modal,sortie=_sortie);

  proc sort data=_sortie;
  by var mod;
  run;

  data _modal;
  merge _modal _sortie;
  by var mod;
  fusion=1;
  run;

  data _moyenne;
  set _moyenne;
  fusion=1;
  data _modal(drop=fusion);
  merge _modal _moyenne;
  by fusion;
  run;

  data _modal2;
  set _modal2;
  fusion=1;
  run;

  proc transpose data=_moyenne out=_tmoy;
  run;

  data _modal2;
  merge _modal2 &modal;
  run;

  data _modal2 (drop=fusion rename=(_name=var));
  merge _modal _tmoy;
  probthe=exp(exp(esti+moy+w&&x&i)*log(survie))-exp(exp(esti+moy)*log(survie));
  by fusion;
  run;

  data _modal;
  set _modal;
  probthe=exp(exp(esti)*log(survie));
  limite=";";
  run;

  data _modal;
  set _modal _modal2;
  run;

  filename fic "D:\joseph\anpe\bases\&nomfic..txt" lrecl=1000;

  data _sortie;
  set _modal;
  file fic;
  put libvar $ limite $ intitule $ limite $ count limite $ probthe;
  run;

  filename fic clear;

  proc print;
  run;
  */


  /*** sans variables quanti ****/

  proc freq data=estim noprint;
  tables &v1 / out=_frequ;
  run;

  data _frequ (keep=var mod count);
  length mod $ 6;
  length var $ 8;
  set _frequ;
  mod=&v1;
  var="&v1";
  run;


  %do i=2 %to &nv;

    proc freq data=estim noprint;
    tables &&v&i / out=_ajout;
    run;

    data _ajout (keep=var mod count);
    length mod $ 6;
    length var $ 8;
    set _ajout;
    mod=&&v&i;
    var="&&v&i";
    run;

    data _frequ;
    set _frequ _ajout;
    run;

  %end;

  data _modal;
  set &modal;
  fusion=1;
  run;

  data _modal (drop=fusion);
  merge _modal tabs2;
  by fusion;
  run;

  proc sort data=_modal;
  by var;
  run;

  data _modal (keep=var mod libvar intitule coeff survie);
  set _modal;
  by var;
  retain compt;
  if first.var then compt=1;
  else compt=compt+1;
  %do i=1 %to &nv;
    if var="&&v&i" then do;
      coeff=0;
      %do j=1 %to &&&&n&&v&i;
        %if &&o&i._&j=1 %then %do;
          if compt=&j then coeff=w&i._&j;
        %end;
      %end;
      output;
    end;
  %end;
  if coeff=. then coeff=0;
  run;

  proc sort data=_modal;
  by var mod;
  run;

  proc sort data=_frequ;
  by var mod;
  run;

  data _modal;
  merge _modal(in=in1) _frequ;
  by var mod;
  if in1=1;
  run;

  %estimod(entree=_modal,sortie=_sortie);

  proc sort data=_sortie;
  by var mod;
  run;

  data _modal;
  merge _modal _sortie;
  by var mod;
  run;

  data _modal;
  set _modal;
  probthe=exp(exp(esti)*log(survie));
  limite=";";
  run;

  filename fic "D:\joseph\anpe\bases\&nomfic..txt" lrecl=1000;

  data _sortie;
  set _modal;
  file fic;
  put libvar $ limite $ intitule $ limite $ count limite $ coeff limite $ probthe;
  run;

  filename fic clear;

  proc print;
  run;


  /*************/


  data valid;
  set valid;
  fusion=1;
  if input(D1V8!!JV8,yymmdd8.)<=input("19990630",yymmdd8.);
  if duree>=365 then probobs=1;
  else probobs=0;
  %if &valid>0 %then if duree>=&valid;;
  run;

  data valid (keep=probobs probthe duree censored D0V6 ageq &clasvar &numvar D1V8 JV8 D1V24 JV24);
  merge valid tabs2;
  by fusion;
  probthe=exp(exp(0 %do i=1 %to &nv;
                      %do j=1 %to &&&&n&&v&i;
                        %if &&o&i._&j=1 %then +i&i._&j*w&i._&j;
                      %end;
                    %end;
                    %do i=1 %to &nx;
                      +&&x&i*w&&x&i
                    %end;
                  )*log(survie));
  run;

  proc sort data=valid;
  by probobs;
  run;

  data libs.v_&nomfic;
  set valid;
  run;

  /*

  proc univariate data=valid;
  by probobs;
  var probthe;
  run;

  %do i=1 %to 10;

    data test;
    set valid;
    alea=uniform(mod(int(datetime()),777));
    run;

    proc sort;
    by alea;
    run;

    data test;
    set test;
    if _N_<=10;
    run;

    proc means noprint;
    var probobs probthe;
    output out=_ajout mean=mobs mthe;
    run;

    %if &i=1 %then %do;
      data _comp;
      set _ajout;
      run;
    %end;
    %else %do;
      data _comp;
      set _comp _ajout;
      run;
    %end;

    data _comp;
    set _comp;
    erreur_r=abs(mobs-mthe)/mobs;
    erreur_a=abs(mobs-mthe);
    biais=mobs-mthe;
    run;

  %end;

  proc means data=_comp;
  var erreur_r erreur_a biais;
  run;

  */

%mend cox;


%macro boucle;

%do i=1 %to 100;

  data test;
  set libs.V_total;
  alea=uniform(mod(int(datetime()),777));
  run;

  proc sort;
  by alea;
  run;

  data test;
  set test;
  if _N_<=100;
  run;

  proc means noprint;
  var probobs probthe;
  output out=_ajout mean=mobs mthe;
  run;

  %if &i=1 %then %do;
    data _comp;
    set _ajout;
    run;
  %end;
  %else %do;
    data _comp;
    set _comp _ajout;
    run;
  %end;

  data _comp;
  set _comp;
  erreur_r=abs(mobs-mthe)/mobs;
  erreur_a=abs(mobs-mthe);
  biais=mobs-mthe;
  run;

%end;

  proc means data=_comp;
  var erreur_r erreur_a biais;
  run;

%mend boucle;


%macro passe(nflux=,fluxmin=,fluxmax=,freqmois=,tabe=,tabs=);

%liste(liste=&fluxmin,racine=flmin);
%liste(liste=&fluxmax,racine=flmax);
%liste(liste=&freqmois,racine=frm);
data &tabs;
set libs.&tabe;
regidxf=reg!!idx!!flux;
proc sort;
by regidxf d1v8j;

data &tabs ;
set &tabs;
%local i;
by regidxf;
retain durpas longpas;
if first.regidxf then do;
durpas=0;
longpas=0;
end;
if flux=1 then do;
if d1v8<&flmin1 then do;
durpas=durpas+duree;
if duree>364 then longpas=1;
end;
else if d1v8<=&flmax1 then output;
end;
%do i=2 %to &nflux;
if flux=&i then do;
if d1v8<&&flmin&i then do;
durpas=durpas+duree;
if duree>364 then longpas=1;
end;
else if d1v8<=&&flmax&i then output;
end;
%end;



data &tabs(drop=regidxf);
set &tabs;
by regidxf;
if last.regidxf;


data &tabs;
set &tabs;
dep=substr(d1v7,1,2);

proc sort data=&tabs;
by dep;

data &tabs;
merge &tabs(in=in1) libs.chomlig;
by dep;
if in1;
run;

data &tabs;
set &tabs;
durmois=intck('month',d1v8j,d1v24j);
d1v8mois=substr(d1v8,5,2);
run;
/* A changer lorsque les dates de flux d entree sont modifies */

data &tabs (drop=l t j i cho1-cho26);
set &tabs;
array ch(26) cho1-cho26;
array che(69) choe1-choe69;
do l=1 to &nflux;
if flux=l then do;
t=26-4*l;    /* A changer */
if d1v8mois=10 then do;
choe1=ch(4*l);           /* A changer */
choe2=ch(4*l);  /* A changer */
choe3=ch(4*l);  /* A changer */
do i=1 to t;
do j=1 to 3;
che(3*i+j)=ch(4*l+i); /* A changer */
end;
end;
end;
else if d1v8mois=11 then do;
choe1=ch(4*l);
choe2=ch(4*l);
do i=1 to t;
do j=1 to 3;
che(3*i+j-1)=ch(4*l+i);
end;
end;
end;
else if d1v8mois=12 then do;
choe1=ch(4*l);
do i=1 to t;
do j=1 to 3;
che(3*i+j-2)=ch(4*l+i);
end;
end;
end;
end;
end;
run;


data libs.&tabs(drop=i choe1-choe69);
set &tabs;
durmois=intck('month',d1v8j,d1v24j);
array che(69) choe1-choe69;
array choo(69) cho1-cho69;
if durmois=0 then do;
do i=2 to 69;
che(i)=.;
end;
end;
else if durmois<69 then do;
do i=durmois+1 to 69;
che(i)=.;
end;
end;
do i=1 to 69;
choo(i)=che(i);
end;

run;


%mend passe;

%macro rpasse(region=,);

  %liste(liste=&region,racine=reg);

 %passe(nflux=1,fluxmin=199310 ,fluxmax=199312 ,
    freqmois=10 11 12,tabe=r&reg1,tabs=r&reg1);

  %do i=2 %to &nreg;
   %passe(nflux=1,fluxmin=199310 ,fluxmax=199312 ,
    freqmois=10 11 12,tabe=r&&reg&i,tabs=r&&reg&i);


    run;
  %end;

%mend rpasse;
/*_______ Appel du programme principal _____________________________*/


/* - 1 - */

libname libs "D:\pole_emploi\";
libname libs2 "D:\aoanpe2000\bases";
libname libd3 "D:\pole_emploi\D3_201212\Reg116";
libname libd4 "D:\pole_emploi\prestation_formation";
libname libech "D:\pole_emploi\echantillon_5pourc_stock";



/**
Sur France, les motifs d'annulation d'une demande d'emploi:
        09 (36%) NON PRESENT. A CONVOC. SUITE ABS. 1ER ENTRET
        01 (18%) REFUS DE SIGNATURE PARP PAC
        12 (16%) REPRISE EMPL PAR PROPRES MOYEN
        10 (8%)  ENTREE EN APR
        02 (7%)  NON PRESENTATION A CONVOCATION CRP CTP
        03 (4%)  NON PRES. A ACTION RECLASSEMENT CRP
        06 (3%)  ABANDON ACTION RECLASSEMENT CRP

       30 ans ou moins: 50%
       50 ans et plus: 10%

Sur FrancesansDI, les motifs d'annulation d'une demande d'emploi:
        09 (49%) NON PRESENT. A CONVOC. SUITE ABS. 1ER ENTRET ==>
        12 (12%) REPRISE EMPL PAR PROPRES MOYEN
        01 (11%) REFUS DE SIGNATURE PARP PAC
        06 (10%)  ABANDON ACTION RECLASSEMENT CRP     ==>
        10 (9%)  ENTREE EN APR
        02 (3%)  NON PRESENTATION A CONVOCATION CRP CTP
        03 (2%)  NON PRES. A ACTION RECLASSEMENT CRP

       30 ans ou moins: 58%
       50 ans et plus: 7%


**/


  %global dep116;
  %global dep211;
  %global dep221;
  %global dep231;
  %global dep241;
  %global dep251;
  %global dep261;
  %global dep311;
  %global dep411;
  %global dep421;
  %global dep431;
  %global dep521;
  %global dep531;
  %global dep541;
  %global dep721;
  %global dep731;
  %global dep741;
  %global dep821;
  %global dep831;
  %global dep911;
  %global dep931;
  %global dep941;

  %let dep116=75 77 78 91 92 93 94 95;
  %let dep211=08 10 51 52;
  %let dep221=02 60 80;
  %let dep231=27 76;
  %let dep241=18 28 36 37 41 45;
  %let dep251=14 50 61;
  %let dep261=21 58 71 89;
  %let dep311=59 62;
  %let dep411=54 55 57 88;
  %let dep421=67 68;
  %let dep431=25 39 70 90;
  %let dep521=44 49 53 72 85;
  %let dep531=22 29 35 56;
  %let dep541=16 17 79 86;
  %let dep721=24 33 40 47 64;
  %let dep731=09 12 31 32 46 65 81 82;
  %let dep741=19 23 87;
  %let dep821=01 07 26 38 42 69 73 74;
  %let dep831=03 15 43 63;
  %let dep911=11 30 34 48 66;
  %let dep931=04 05 06 13 83 84;
  %let dep941=20;


/* - 2 - */

/********************************/
/* création des tables de label */
/********************************/
/*
data variab;
input var $ 1-8 tovar $ 9-12 libvar $ 13-72;
cards;
reg     fregRégion
annee   fan Année de début de demande
D1V8    fdatAnnée et mois de début de demande
D0V6    fsexSexe
age     fageAge
ageq    fagqAge en tranches quinquénales
agsex   fagsSexe croisé par âge
forma   fforFormation
D0V22   TO07Situation familliale
D1V11   TO14Motif d'inscription
D1V18   TO21Qualification
SPNDE   fspnService Pour un Nouveau Départ vers l'Emploi
ROME    fromCode ROME
ant     fantNombre de demandes antérieures
;
run;

data libs.tovar;
input tovar $ 1-4 codoper $ 5-10 intitule $ 11-40;
cards;
freg116   Ile de France
freg211   Champagne Ardenne
freg221   Picardie
freg231   Haute Normandie
freg241   Centre
freg251   Basse Normandie
freg261   Bourgogne
freg311   Nord Pas de Calais
freg411   Lorraine
freg421   Alsace
freg431   Franche Comté
freg521   Pays de la Loire
freg531   Bretagne
freg541   Poitou Charente
freg721   Aquitaine
freg731   Midi Pyrénées
freg741   Limousin
freg821   Rhône Alpes
freg831   Auvergne
freg911   Languedoc Roussillon
freg931   Provence Alpes Côte d'Azur
freg941   Corse
freg952   Guadeloupe
freg953   Réunion
freg954   Martinique
freg955   Guyane
fan 1993  1993
fan 1994  1994
fan 1995  1995
fan 1996  1996
fan 1997  1997
fan 1998  1998
fan 1999  1999
fan 2000  2000
fdat199307Juillet   93
fdat199308Août      93
fdat199309Septembre 93
fdat199310Octobre   93
fdat199311Novembre  93
fdat199312Décembre  93
fdat199401Janvier   94
fdat199402Février   94
fdat199403Mars      94
fdat199404Avril     94
fdat199405Mai       94
fdat199406Juin      94
fdat199407Juillet   94
fdat199408Août      94
fdat199409Septembre 94
fdat199410Octobre   94
fdat199411Novembre  94
fdat199412Décembre  94
fdat199501Janvier   95
fdat199502Février   95
fdat199503Mars      95
fdat199504Avril     95
fdat199505Mai       95
fdat199506Juin      95
fdat199507Juillet   95
fdat199508Août      95
fdat199509Septembre 95
fdat199510Octobre   95
fdat199511Novembre  95
fdat199512Décembre  95
fdat199601Janvier   96
fdat199602Février   96
fdat199603Mars      96
fdat199604Avril     96
fdat199605Mai       96
fdat199606Juin      96
fdat199607Juillet   96
fdat199608Août      96
fdat199609Septembre 96
fdat199610Octobre   96
fdat199611Novembre  96
fdat199612Décembre  96
fdat199701Janvier   97
fdat199702Février   97
fdat199703Mars      97
fdat199704Avril     97
fdat199705Mai       97
fdat199706Juin      97
fdat199707Juillet   97
fdat199708Août      97
fdat199709Septembre 97
fdat199710Octobre   97
fdat199711Novembre  97
fdat199712Décembre  97
fdat199801Janvier   98
fdat199802Février   98
fdat199803Mars      98
fdat199804Avril     98
fdat199805Mai       98
fdat199806Juin      98
fdat199807Juillet   98
fdat199808Août      98
fdat199809Septembre 98
fdat199810Octobre   98
fdat199811Novembre  98
fdat199812Décembre  98
fdat199901Janvier   99
fdat199902Février   99
fdat199903Mars      99
fdat199904Avril     99
fdat199905Mai       99
fdat199906Juin      99
fdat199907Juillet   99
fdat199908Août      99
fdat199909Septembre 99
fdat199910Octobre   99
fdat199911Novembre  99
fdat199912Décembre  99
fdat200001Janvier   00
fdat200002Février   00
fdat200003Mars      00
fdat200004Avril     00
fdat200005Mai       00
fdat200006Juin      00
fsex1     Homme
fsex2     Femme
fage16    16 ans et moins
fage17    17 ans
fage18    18 ans
fage19    19 ans
fage20    20 ans
fage21    21 ans
fage22    22 ans
fage23    23 ans
fage24    24 ans
fage25    25 ans
fage26    26 ans
fage27    27 ans
fage28    28 ans
fage29    29 ans
fage30    30 ans
fage31    31 ans
fage32    32 ans
fage33    33 ans
fage34    34 ans
fage35    35 ans
fage36    36 ans
fage37    37 ans
fage38    38 ans
fage39    39 ans
fage40    40 ans
fage41    41 ans
fage42    42 ans
fage43    43 ans
fage44    44 ans
fage45    45 ans
fage46    46 ans
fage47    47 ans
fage48    48 ans
fage49    49 ans
fage50    50 ans
fage51    51 ans
fage52    52 ans
fage53    53 ans
fage54    54 ans
fage55    55 ans et plus
fagq1     20 ans et moins
fagq2     21-25 ans
fagq3     26-30 ans
fagq4     31-35 ans
fagq5     36-40 ans
fagq6     41-45 ans
fagq7     46-50 ans
fagq8     51 ans et plus
fagsh1    Homme de 20 ans et moins
fagsh2    Homme de 21-25 ans
fagsh3    Homme de 26-30 ans
fagsh4    Homme de 31-35 ans
fagsh5    Homme de 36-40 ans
fagsh6    Homme de 41-45 ans
fagsh7    Homme de 46-50 ans
fagsh8    Homme de 51 ans et plus
fagsf1    Femme de 20 ans et moins
fagsf2    Femme de 21-25 ans
fagsf3    Femme de 26-30 ans
fagsf4    Femme de 31-35 ans
fagsf5    Femme de 36-40 ans
fagsf6    Femme de 41-45 ans
fagsf7    Femme de 46-50 ans
fagsf8    Femme de 51 ans et plus
ffor1     Bac + 3 et plus
ffor2     Bac + 2
ffor3     Bac
ffor4     CAP / BEP
ffor5     Collège
ffor6     Aucune / primaire
ffor9     NR
fspn0     Pas d'entretien SPNDE
fspn1     Entretien SPNDE
fant0     0 demande antérieure
fant1     1 demande antérieures
fant2     2 demandes antérieures
fant3     3 demandes antérieures ou plus
;
run;

data rome(rename=(approme=intitule rome=codoper));
set libs.torome5c;
tovar="from";
run;

data libs.tovar (keep=tovar codoper intitule);
set libs.tovar
    libs.Tovardyn
    rome;
if TOVAR="TO21" then codoper=codstat;
if TOVAR="TO07" and codoper="K" then intitule="CONCUBIN";
if TOVAR="TO07" and codoper="M" then intitule="MARIE";
if TOVAR="TO07" and codoper="D" then intitule="DIVORCE";
if TOVAR="TO07" and codoper="S" then intitule="SEPARE";
run;

proc sort data=libs.tovar;
by tovar;
run;

proc sort data=variab;
by tovar;
run;

data libs.tovar (rename=(codoper=mod));
merge variab libs.tovar;
by tovar;
if var^="";
if tovar^="";
if    (var="reg"    and codoper="116")
   or (var="annee"  and codoper="1999")
   or (var="D1V8"   and codoper="199901")
   or (var="D0V6"   and codoper="1")
   or (var="age"    and codoper="21")
   or (var="ageq"   and codoper="2")
   or (var="agsex"  and codoper="h2")
   or (var="forma"  and codoper="3")
   or (var="D0V22"  and codoper="C")
   or (var="D1V11"  and codoper="14")
   or (var="D1V18"  and codoper="6")
   or (var="SPNDE"  and codoper="0")
   or (var="ROME"   and codoper="14223")
   or (var="ant"    and codoper="0")
   then ref=1;
else ref=0;
run;

data ajout;
set libs.tovar;
if _N_<=3;
if _N_=1 then do;
  var="ROME";
  tovar="from";
  libvar="Code ROME";
  MOD="00000";
  INTITULE="*** Codé 00000 ***";
  REF=0;
end;
if _N_=2 then do;
  var="ROME";
  tovar="from";
  libvar="Code ROME";
  MOD="00000";
  INTITULE="*** Non codé ***";
  REF=0;
end;
if _N_=3 then do;
  var="ROME";
  tovar="from";
  libvar="Code ROME";
  MOD="43000";
  INTITULE="*** Codé 43000 ***";
  REF=0;
end;
run;

data libs.tovar;
set libs.tovar ajout;
run;

proc sort data=libs.tovar;
by tovar;
run;

*/

/*
data tovar1;
set libs.tovar;
run;


data tovar2;
input var $ 1-8 tovar $ 9-12 libvar $ 13-72;
cards;
bas     fbasCode Bassin
;
run;
*/


/* - 3 - */

/*****************************************************************************************/
/* Création des tables de travail avec fusion des demandes espacées de moins de 30 jours */
/*****************************************************************************************/

/* MACRO située aux lignes 886-933, faisant appel aux sous-macros "relie","relied0" situées aux lignes 582-718, 781-799 */

/*** Echantillonner sur le stock des demandeurs ***/


        *%anpe_tab(dire=D:\pole_emploi\,dirs=D:\pole_emploi\,dateinf=2005-01-01,datesup=2005-12-31,nbj=30,nombob=0.05);


        %anpe_tab(dire=D:\pole_emploi\,dirs=D:\pole_emploi\,dateinf=,datesup=,nbj=30,nombob=0.05);



/*** Retenir les demandeurs échantillonnés sur un flux d'entrée au chômage à une certaine période ***/

/* MACRO située aux lignes 1024-1065 */
/* à l'issue de ces macros, on a selectionne les individus qui ont un episode de
chomage debutant au cours de ces mois; mais a ce stade, on conserve leur episode
anterieur
*/

        %flux(tabs=libs.france,fluxmin=19931001 ,fluxmax=19931230 );




/* MACRO située aux lignes 935-992, faisant appel aux sous-macros "relied3_di", "relied3_ar" "relied3_pjc"
                                                   située aux lignes 801-831     833-854        856-876 */
/* à l'issue de ces macros, on a récupéré les informations issues du FNA sur les individus sélectionnées */

        %d3_tab(dire=D:\pole_emploi\D3_201212\reg,dirs=D:\pole_emploi\);


/* MACRO située aux lignes 995-1022, faisant appel à la sous-macro "relieo" située aux lignes 720-779 */
        %actr_tab(dire=D:\pole_emploi\,dirs=D:\pole_emploi\,nombob=1);


/*****************************************************************************************/
/* Reunion des demandes d emploi séparées de moins d un mois
         certaines periodes intercalées sont des periodes de maladie/de formation (catregr=4)
         ou des periodes d emploi aidés (catgerr=5)   */
/*****************************************************************************************/
                                        /**** DE ****/


data france;
set libs.france;
reg_idx=reg||idx;
run;

proc sort;
by reg idx ndem;
run;

  data france (drop=DATINSp DATANNp comptp censp);
  set france;
  by reg_idx ndem;
  retain DATINSp DATANNp  comptp censp
nenfp sitmatp contratp tempsp sitparp qualifp romep experp rmip motannp nbar78p nbar79p dur_maladie dur_emplaide ndem_deb ;
  if _N_=1 then comptp=0;
  if first.reg_idx=1 then do;
         compt=comptp+1;
         ndem_deb=ndem;
         nenfp=nenf;
         sitmatp=sitmat;
         contratp=contrat;
         tempsp=temps;
         sitparp=sitpar;
         qualifp=qualif;
         romep=rome;
         experp=exper;
         rmip=rmi;
         motannp=motann;
         nbar78p=nbar78;
         nbar79p=nbar79;
         if catregr=4 then dur_maladie=duree;else dur_maladie=0;
         if catregr=5 then dur_emplaide=duree;else dur_emplaide=0;
         ndem_agreg=1;
        end;
  if first.reg_idx=0 then do;
    if DATINSp<=DATANN+30 then do;
      DATANN=max(DATANN,DATANNp);
      if max(DATANN,DATANNp)=DATANNp then do;
        censored=censp;
      end;
      nbar78p=nbar78p+nbar78;
      nbar79p=nbar79p+nbar79;
      if catregr=4 then dur_maladie=dur_maladie+duree;
      if catregr=5 then dur_emplaide=dur_emplaide+duree;
      ndem_agreg+0;
      compt=comptp;
    end;
    else do;
         compt=comptp+1;
         ndem_deb=ndem;
         nenfp=nenf;
         sitmatp=sitmat;
         contratp=contrat;
         tempsp=temps;
         sitparp=sitpar;
         qualifp=qualif;
         romep=rome;
         experp=exper;
         rmip=rmi;
         motannp=motann;
         nbar78p=nbar78;
         nbar79p=nbar79;
         if catregr=4 then dur_maladie=duree;else dur_maladie=0;
         if catregr=5 then dur_emplaide=duree;else dur_emplaide=0;
         ndem_agreg+1;
     end;
  end;
  DATINSp=DATINS;
  DATANNp=DATANN;
  comptp=compt;
  censp=censored;
  run;


  proc sort data=france;
  by reg idx ndem;

  data france_30 (drop=compt reg_idxp aleap nenfp sitmatp contratp tempsp sitparp qualifp romep experp rmip motannp
                nbar78p nbar79p);
  set france;
  by compt;
  retain reg_idxp aleap;
  if last.compt;
 * if DATINS>=input("&dateinf",yymmdd10.) and DATINS<input("&datesup",yymmdd10.) ;
  alea=uniform(7);
  duree=DATANN-DATINS;
  if reg_idxp=reg_idx then alea=aleap;
  aleap=alea;
  reg_idxp=reg_idx;
           nenf=nenfp;
         sitmat=sitmatp;
         contrat=contratp;
         temps=tempsp;
         sitpar=sitparp;
         qualif=qualifp;
         rome=romep;
         exper=experp;
         rmi=rmip;
         motann=motannp;
         nbar78=nbar78p;
         nbar79=nbar79p;
   duree_net=duree-dur_maladie-dur_emplaide;
    run;



/****** On repère et élimine
                - les demandeurs qui ont + de 10 DE
                - des demandeurs qui ont une DE d'une durée (nette) de plus de 5 ans (1825 jours)
*****/


data elimin1 (keep=reg idx reg_idx duree_net  ndem_agreg);
set france_30;
if duree_net>1825 or ndem_agreg>10;

run;


data france_final;
merge france_30(in=in1) elimin1 (in=in2);
by reg_idx;
if in2 then delete;
run;

/****** On repère et élimine
                - les demandeurs agés d'au moins 55 ans en janvier 2005
*****/


data elimin2 (keep=reg idx reg_idx datnais);
set france_final;
naiss_ref=input('1950-01-01',yymmdd10.);
if datnais<naiss_ref;
run;


data france_final;
merge france_final(in=in1) elimin2 (in=in2);
by reg_idx;
if in2 then delete;
run;

data ident_final;
set france_final (rename=(ndem=ndem_fin));
keep idx reg reg_idx ndem_deb ndem_fin ndem_agreg;
reg_idx=reg||idx;
run;

data ident_idx_final (keep=reg idx reg_idx);
set ident_final;
by reg_idx;
if last.reg_idx;
run;

data libs.ident_idx_final;
set ident_idx_final;
run;


/****************************************************************************************************************/
/*On collecte les informations sur les PI issues du FH en les alignant sur chaque enregistrement de DE          */
/*                                                                                                              */
/*                Les variables importantes (issues du module D2 des tables FHA)                                */
/*                        indem ($)       : Code allocation                                                     */
/*                        regind          : Régime d'indemnisation (? Documentation)                            */
/*                        filindem ($)    : Filière d'indemnisation                                             */
/*                        regime          : Régime particulier (? Documentation)                                */
/*                        jourdv          : Jour Début de la PI                                                 */
/*                        jourfv          : Jour Fin de la PI                                                   */
/*                        odddmax         : Durée maximum d'indemnisation                                       */
/*                                                                                                              */
/*                transformées en fh_indem1-fh_indem... (précédées de fh_ puis numérotées de 1 à compt_de_fhdi) */
/*                                                                                                              */
/*                        compt_de_fhdi   : Variable comptant le nombre de PI issues du FH pour la DE considérée*/
/*                                                                                                              */
/*                                                                                                              */
/****************************************************************************************************************/


data francedi;
set libs.francedi;
reg_idx=reg||idx;

data francedi_final;
merge francedi libs.ident_idx_final(In=in1);
by reg_idx;
if in1=0 then delete;
run;

proc sort data=francedi_final;
by reg_idx ndem jourdv;
run;

data francedi_final;
set francedi_final;
reg_idx_ndem=reg_idx||ndem;

data francedi_final_dem (keep= reg idx ndem reg_idx reg_idx_ndem compt_de_fhdi);
set francedi_final;
by reg_idx_ndem;
if first.reg_idx_ndem then compt_de_fhdi=1;
else  compt_de_fhdi+1;
if last.reg_idx_ndem then output;
proc freq;
tables compt_de_fhdi;
run;

data  francedi_final;
merge francedi_final_dem francedi_final;
by  reg_idx_ndem;
run;

proc freq data=francedi_final;
tables indem regind filindem;
run;

data france_final_rajoutdi (keep= reg idx ndem reg_idx reg_idx_ndem compt_de_fhdi
indem1-indem27
regind1-regind27
filindem1-filindem27
regime1-regime27
jourdv1-jourdv27
jourfv1-jourfv27
odddmax1-odddmax27
) ;
set francedi_final;
by reg_idx_ndem;

array in $ indem1-indem27;
array regd regind1-regind27;
array fi $ filindem1-filindem27;
array regi regime1-regime27;
array jd jourdv1-jourdv27;
array jf jourfv1-jourfv27;
array od odddmax1-odddmax27;

format jourdv1-jourdv27 jourfv1-jourfv27   yymmdd10.;
retain i indem1-indem27
regind1-regind27
filindem1-filindem27
regime1-regime27
jourdv1-jourdv27
jourfv1-jourfv27
odddmax1-odddmax27;


        if first.reg_idx_ndem then do;
do j=1 to 27;
in(j)=.;
regd(j)=.;
fi(j)=.;
regi(j)=.;
jd(j)=.;
jf(j)=.;
od(j)=.;
end;
i=1;
in(i)=indem;
regd(i)=regind;
fi(i)=filindem;
regi(i)=regime;
jd(i)=jourdv;
jf(i)=jourfv;
od(i)=odddmax;
        end;
        else do;
i+1;
in(i)=indem;
regd(i)=regind;
fi(i)=filindem;
regi(i)=regime;
jd(i)=jourdv;
jf(i)=jourfv;
od(i)=odddmax;
        end;
if last.reg_idx_ndem;
run;

data france_final_rajoutdi;
set france_final_rajoutdi;
if compt_de_fhdi=1 and jourdv1=. then  compt_de_fhdi=0;
proc freq;
tables compt_de_fhdi;
run;

data  france_final_rajoutdi;
set france_final_rajoutdi;
if compt_de_fhdi>0;
run;

data  libs.france_final_rajoutdi;
set france_final_rajoutdi;
run;

/***********************************************************************************************************/
/* On est arrivé à une table de DE pourlesquelles les variables d'indemnisation sont renseignées           */
/*                                           france_final_rajoutdi                                         */
/* On s'en sert pour vérifier la fiabilité de l'appariement au niveau de l'indemnisation entre FH et FNA   */
/*                            cf plus loin pour cette appariement par la proc sql                          */
/***********************************************************************************************************/







/****************************************************************************************************************/
/*On collecte les informations sur les PI issues du FNA en les alignant sur chaque enregistrement de DE         */
/*                                                                                                              */
/*                Les variables importantes (issues du module DI des tables D3 du FNA)                          */
/*                                                                                                              */
/*                         Sur les PI elles-mêmes et leur insertion au sein de la DE                            */
/*                                                                                                              */
/*                              datins_di1...  : date debut de la PI POUR LA DE (pas forcément début de la PI)  */
/*                              datann_di1...  : date fin de la PI POUR LA DE (pas forcément fin de la PI)      */
/*                              duree_di1...   : longueur - durée - de la PI                                    */
/*                              ecoul_di1...   : temps écoulé de la PI au début de DE (cas où PI commencé avt ) */
/*                              num_di1...     : numéro de la PI (sert à retrouver la PI dans le fichier DI)    */
/*                              type_di1...    : type de la PI:                                                 */
/*                               1 = Cas où la DI est insérée au sein de la DE                                  */
/*                               2 = Cas où la DI est antérieure à la DE mais se termine au sein de la DE       */
/*                               3 = Cas où la DI commence au sein de la DE et se poursuit après la fin de la DE*/
/*                               4 = Cas où la DI contient la totalité de la DE: démarre avant,se termine après */
/*                                                                                                              */
/*                          Sur le contenu de ces PI                                                            */
/*                                                                                                              */
/*                        allocat ($)     : Code allocation                                                     */
/*                        filiere ($)     : Filière d'indemnisation                                             */
/*                        durfileg        : Durée potentielle d'indemnisation                                   */
/*                        dateouv         : Jour Début de la PI                                                 */
/*                        datefer         : Jour Fin de la PI                                                   */
/*                        ar_di           :                                                                     */
/*                        durpayee        :                                                                     */
/*                        durnonar        :                                                                     */
/*                        mtpaye          :                                                                     */
/*                        premjnet        :                                                                     */
/*                        mtsjr           :                                                                     */
/*                        txrn            :                                                                     */
/*                        regpart         :                                                                     */
/*                                                                                                              */
/*            transformées en di_allocat1-di_allocat... (précédées de di_ puis numérotées de 1 à compt_de_di)   */
/*                                                                                                              */
/*                        compt_de_di     : Variable comptant le nombre de PI issues du FH pour la DE considérée*/
/*                                                                                                              */
/*                                                                                                              */
/****************************************************************************************************************/




  /**** On repère les PI pour les demandes d'emploi **/

/**** On liste  toutes les PI pour les inclure dans le fichier des périodes d emploi (DE et D2) ***/

/* On part donc du fichier France_d3di (obtenu sur l'échantillonnage de juillet 2014
 et on élimine les individus échantillonnés (qui ont une DE) n'ayant aucune PI référencées */

proc freq data=libs.france_d3di;
tables ndemi/missing;
run;

data france_d3di;
set libs.france_d3di;
reg_idx=reg||idx;
run;

data france_d3di;
merge france_d3di libs.ident_idx_final (in=in1);
by reg_idx;
if in1;
run;
proc freq data=france_d3di;
tables ndemi/missing;
run;

proc freq data=france_d3di;
tables abs_d3_di/missing;
run;
data france_d3di;
set france_d3di;
if ndemi=. then delete;
run;

data france_d3di_indiv (keep=idx reg reg_idx ndemi_total);
set france_d3di;
by reg_idx;
if last.reg_idx then output;
rename ndemi=ndemi_total;
run;

proc freq data=france_d3di_indiv;
tables ndemi_total/missing;
run;

data france_d3di;
merge france_d3di france_d3di_indiv;
by reg_idx;
run;


data liste_demandi (keep=reg idx reg_idx ndemi_total allocat1-allocat72  filiere1-filiere72 durfileg1-durfileg72
 dateouv1-dateouv72 datefer1-datefer72 ar_di1-ar_di72 durpayee1-durpayee72  durnonar1-durnonar72 mtpaye1-mtpaye72
premjnet1-premjnet72 premjbrut1-premjbrut72 mtsjr1-mtsjr72 txrn1-txrn72 txrb1-txrb72 regpart1-regpart72 );
set france_d3di;
by reg_idx;

array al $ allocat1-allocat72;
array fil $ filiere1-filiere72;
array durf  durfileg1-durfileg72;
array dato dateouv1-dateouv72;
array datf datefer1-datefer72;
array ard ar_di1-ar_di72;
array durp durpayee1-durpayee72;
array durn  durnonar1-durnonar72;
array mtp mtpaye1-mtpaye72;
array pr premjnet1-premjnet72;
array prb premjbrut1-premjbrut72;
array mts mtsjr1-mtsjr72;
array tx txrn1-txrn72;
array txb txrb1-txrb72;
array regp  regpart1-regpart72;



retain compt allocat1-allocat72  filiere1-filiere72 durfileg1-durfileg72
 dateouv1-dateouv72 datefer1-datefer72 ar_di1-ar_di72 durpayee1-durpayee72  durnonar1-durnonar72 mtpaye1-mtpaye72
premjnet1-premjnet72 premjbrut1-premjbrut72 mtsjr1-mtsjr72 txrn1-txrn72 txrb1-txrb72 regpart1-regpart72;
format dateouv1-dateouv72 datefer1-datefer72    yymmdd10.;
if first.reg_idx then do;
        compt=1;
        al(1)=allocation;
        fil(1)=filiere;
        durf(1)=durfileg;
        dato(1)=dateouv;
        datf(1)=datefer;
        ard(1)=ar;
        durp(1)=durpayee;
        durn(1)=durnonar;
        mtp(1)=mtpaye;
        pr(1)=premjnet;
        prb(1)=premjalloc;
        mts(1)=mtsjr;
        tx(1)=txrn;
        txb(1)=txrb;
        regp(1)=regpart;

end;
else do;
        compt=compt+1;
        al(compt)=allocation;
        fil(compt)=filiere;
        durf(compt)=durfileg;
        dato(compt)=dateouv;
        datf(compt)=datefer;
        ard(compt)=ar;
        durp(compt)=durpayee;
        durn(compt)=durnonar;
        mtp(compt)=mtpaye;
        pr(compt)=premjnet;
        prb(compt)=premjalloc;
        mts(compt)=mtsjr;
        tx(compt)=txrn;
        txb(compt)=txrb;
        regp(compt)=regpart;
end;
if last.reg_idx then output;
run;



data france_final_di;
merge france_final (in=in1 ) liste_demandi (in=in2 );
by reg_idx;
if in1=0 and in2=1 then delete ;
run;

proc freq data=france_final_di;
tables ndemi_total/missing;
run;


data france_final_di;
set france_final_di;

array dato dateouv1-dateouv72;
array datf datefer1-datefer72;
/* détermination du type de la DI */
array t type_di1-type_di72;

if ndemi_total ne . then do;
do i=1 to ndemi_total;
t(i)=0;
end;
end;

/* Date de début - éventuellement recalculée - de la DI incluse dans la DE */
array didi datins_di1-datins_di72;
/* Date de fin - éventuellement recalculée - de la DI incluse dans la DE */
array dadi  datann_di1-datann_di72;
/* Duree recalculée pour déterminer la longueur de la partie de la DI incluse dans la DE */
array durdi duree_di1-duree_di72;
/* Calcul du temps déjà écoulée dans la DI avant le début de la DE */
array ecdi ecoul_di1-ecoul_di72;
/* Pour la DE, identifie par leur numéro, les  DI qui sont intégré en partie ou en totalité dans la DE  */
array numdi num_di1-num_di72;

format datins_di1-datins_di72 datann_di1-datann_di72    yymmdd10.;

compt_de_di=0;
if ndemi_total ne . then do;
        do i=1 to ndemi_total;
        /* Cas où la DI est insérée au sein de la DE: type 1 */
        if datins<=dato(i) and datann>=datf(i) then  do;
                compt_de_di+1;
                t(i)=1;
                didi(compt_de_di)=dato(i);
                dadi(compt_de_di)=datf(i);
                durdi(compt_de_di)=dadi(compt_de_di)-didi(compt_de_di);
                ecdi(compt_de_di)=didi(compt_de_di)-dato(i);
                numdi(compt_de_di)=i;
        end;
        /* Cas où la DI est antérieure à la DE mais se termine au sein de la DE: type 2 */
        if datins>dato(i) and datins<=datf(i) and datann>=datf(i) then do;
                compt_de_di+1;
                t(i)=2;
                didi(compt_de_di)=datins;
                dadi(compt_de_di)=datf(i);
                durdi(compt_de_di)=dadi(compt_de_di)-didi(compt_de_di);
                ecdi(compt_de_di)=didi(compt_de_di)-dato(i);
                numdi(compt_de_di)=i;
        end;
        /* Cas où la DI commence au sein de la DE mais se poursuit après la fin de l'épisode: type 3 */
        if datins<=dato(i) and datann>=dato(i) and datann<datf(i) then do;
                compt_de_di+1;
                t(i)=3;
                didi(compt_de_di)=dato(i);
                dadi(compt_de_di)=datann;
                durdi(compt_de_di)=dadi(compt_de_di)-didi(compt_de_di);
                ecdi(compt_de_di)=didi(compt_de_di)-dato(i);
                numdi(compt_de_di)=i;
        end;
        /* Cas où la DI contient la totalité de la DE (démarre avent et se termine après): type 4 */
        if datins>dato(i) and datann<datf(i) then do;
                compt_de_di+1;
                t(i)=4;
                didi(compt_de_di)=datins;
                dadi(compt_de_di)=datann;
                durdi(compt_de_di)=dadi(compt_de_di)-didi(compt_de_di);
                ecdi(compt_de_di)=didi(compt_de_di)-dato(i);
                numdi(compt_de_di)=i;

        end;
        end;
end;
run;

proc freq;
tables compt_de_di;
run;


/* On supprimme 14 demandes d'emploi qui sont associées à plus de 23 DI */

data france_final_di23 ;         ;
set  france_final_di;
if compt_de_di<24;
run;

data france_final_di23(drop=
 datins_di24-datins_di72
 datann_di24-datann_di72
 duree_di24-duree_di72
 ecoul_di24-ecoul_di72
 num_di24-num_di72
 type_di24-type_di72

odatins_di1-odatins_di23
odatann_di1-odatann_di23
oduree_di1-oduree_di23
oecoul_di1-oecoul_di23
onum_di1-onum_di23
otype_di1-otype_di23

 allocat1-allocat72
 filiere1-filiere72
 durfileg1-durfileg72
 dateouv1-dateouv72
 datefer1-datefer72
 ar_di1-ar_di72
 durpayee1-durpayee72
 durnonar1-durnonar72
 mtpaye1-mtpaye72
 premjnet1-premjnet72
 premjbrut1-premjbrut72
 mtsjr1-mtsjr72
 txrn1-txrn72
 txrb1-txrb72
 regpart1-regpart72
);

set france_final_di23;

array didi datins_di1-datins_di23;
array dadi  datann_di1-datann_di23;
array durdi duree_di1-duree_di23;
array ecdi ecoul_di1-ecoul_di23;
array numdi num_di1-num_di23;
array t type_di1-type_di23;

array odidi odatins_di1-odatins_di23;
array odadi  odatann_di1-odatann_di23;
array odurdi oduree_di1-oduree_di23;
array oecdi oecoul_di1-oecoul_di23;
array onumdi onum_di1-onum_di23;
array ot otype_di1-otype_di23;


array al $ allocat1-allocat72;
array fil $ filiere1-filiere72;
array durf  durfileg1-durfileg72;
array ard ar_di1-ar_di72;
array durp durpayee1-durpayee72;
array durn  durnonar1-durnonar72;
array mtp mtpaye1-mtpaye72;
array pr premjnet1-premjnet72;
array prb premjbrut1-premjbrut72;
array mts mtsjr1-mtsjr72;
array tx txrn1-txrn72;
array txb txrb1-txrb72;
array regp  regpart1-regpart72;

array dal $ di_allocat1-di_allocat23;
array dfil $ di_filiere1-di_filiere23;
array ddurf  di_durfileg1-di_durfileg23;
array dard di_ar_di1-di_ar_di23;
array ddurp di_durpayee1-di_durpayee23;
array ddurn  di_durnonar1-di_durnonar23;
array dmtp di_mtpaye1-di_mtpaye23;
array dpr di_premjnet1-di_premjnet23;
array dmts di_mtsjr1-di_mtsjr23;
array dtx di_txrn1-di_txrn23;
array dprb di_premjbrut1-di_premjbrut23;
array dtxb di_txrb1-di_txrb23;
array dregp  di_regpart1-di_regpart23;

/** L'ordre de numérotation des PI au sein d'une DE est à date décroissante - le numéro 1 est le plus récent et le dernier numéro
le plus ancien (tout comme la numérotation des DE)
On va changer l'ordre et passer à un ordre croissant pour les PI ***/
if  compt_de_di ne 0 then do;
 do i=1 to compt_de_di;
        odidi(i)=didi(i);
        odadi(i)=dadi(i);
        odurdi(i)=durdi(i);
        oecdi(i)=ecdi(i);
        onumdi(i)=numdi(i);
        ot(i)=t(i);
 end;
end;

if  compt_de_di ne 0 then do;
    do i=1 to compt_de_di;
        dal(compt_de_di-i+1)=al(numdi(i));
        dfil(compt_de_di-i+1)=fil(numdi(i));
        ddurf(compt_de_di-i+1)=durf(numdi(i));
        dard(compt_de_di-i+1)=ard(numdi(i));
        ddurp(compt_de_di-i+1)=durp(numdi(i));
        ddurn(compt_de_di-i+1)=durn(numdi(i));
        dmtp(compt_de_di-i+1)=mtp(numdi(i));
        dpr(compt_de_di-i+1)=pr(numdi(i));
        dmts(compt_de_di-i+1)=mts(numdi(i));
        dtx(compt_de_di-i+1)=tx(numdi(i));
        dprb(compt_de_di-i+1)=prb(numdi(i));
        dtxb(compt_de_di-i+1)=txb(numdi(i));
        dregp(compt_de_di-i+1)=regp(numdi(i));
        didi(compt_de_di-i+1)=odidi(i);
        dadi(compt_de_di-i+1)=odadi(i);
        durdi(compt_de_di-i+1)=odurdi(i);
        ecdi(compt_de_di-i+1)=oecdi(i);
        numdi(compt_de_di-i+1)=onumdi(i);
     end;
end;
run;






/**** Vérification des 50% des DE n'ayant pas de DI appareillées ***/
/*** Les raisons peuvent être:
        - la DE ne donne pas lieu à indemnisation (Bon appariement)

        - Erreur de calendrier (Mauvais appariement)

        - Déménagement (tout le dossier d'indemnisation (D3) est transféré dans une autre région et Dans le FH, les données liées à la
         région d’origine restent dans cette région d’origine)
        - Dispensé de recherche d'emploi (mais ce cas explique surtout que du coté des DI postérieures à la DRE
        , on  ait aucune DE en face puisque dans ce cas si un DE, sélectionné dans le FH-échantillon, a atteint l’âge de la DRE,
         les indemnisations postérieures à la DRE n’apparaissent pas dans le FH alors qu’elles apparaissent dans le FNA).
        - la DE est trop ancienne mais en revanche on conserve l'antériorité des DI (mais là encore cela explique que du coté
        des DI, on ait pas de correspondance)

***/


data france_final_di23;
set france_final_di23;
rename ndem=ndem_fin;
run;

/* Fusion par la proc sql qui permet de le faire en utilisant des conditions d'appariement plus riches */
proc sql;
create table jointure1 as
select a.*,b.*
from libs.france_final_rajoutdi as a, france_final_di23 as b
where a.reg_idx=b.reg_idx and b.ndem_deb<=a.ndem<=b.ndem_fin;
quit;

proc sort data=jointure1;
by reg_idx ndem;
run;

proc sort data=jointure1;
by reg_idx ndem_agreg descending ndem;
run;

data jointure1;
set jointure1;
reg_idx_ndem_ag=reg_idx||ndem_agreg;

data jointure2 (drop=indem1-indem27
regind1-regind27
filindem1-filindem27
regime1-regime27
jourdv1-jourdv27
jourfv1-jourfv27
odddmax1-odddmax27) ;

set jointure1;
by reg_idx_ndem_ag;

array in $ indem1-indem27;
array regd regind1-regind27;
array fi $ filindem1-filindem27;
array regi regime1-regime27;
array jd jourdv1-jourdv27;
array jf jourfv1-jourfv27;
array od odddmax1-odddmax27;

array fin $ fh_indem1-fh_indem27;
array fregd fh_regind1-fh_regind27;
array ffi $ fh_filindem1-fh_filindem27;
array fregi fh_regime1-fh_regime27;
array fjd fh_jourdv1-fh_jourdv27;
array fjf fh_jourfv1-fh_jourfv27;
array fod fh_odddmax1-fh_odddmax27;

format fh_jourdv1-fh_jourdv27 fh_jourfv1-fh_jourfv27   yymmdd10.;

retain c fh_indem1-fh_indem27
fh_regind1-fh_regind27
fh_filindem1-fh_filindem27
fh_regime1-fh_regime27
fh_jourdv1-fh_jourdv27
fh_jourfv1-fh_jourfv27
fh_odddmax1-fh_odddmax27;

if first.reg_idx_ndem_ag then do;
c=0;
do j=1 to 27;
fin(j)=.;
fregd(j)=.;
ffi(j)=.;
fregi(j)=.;
fjd(j)=.;
fjf(j)=.;
fod(j)=.;
end;
end;

if first.reg_idx_ndem_ag then do;
  if compt_de_fhdi ne 0 then do;
        do j=1 to compt_de_fhdi;
fin(c+j)=in(j);
fregd(c+j)=regd(j);
ffi(c+j)=fi(j);
fregi(c+j)=regi(j);
fjd(c+j)=jd(j);
fjf(c+j)=jf(j);
fod(c+j)=od(j);
        end;
   c=c+compt_de_fhdi;
   end;
end;
else do;
  if compt_de_fhdi ne 0 then do;
        do j=1 to compt_de_fhdi;
fin(c+j)=in(j);
fregd(c+j)=regd(j);
ffi(c+j)=fi(j);
fregi(c+j)=regi(j);
fjd(c+j)=jd(j);
fjf(c+j)=jf(j);
fod(c+j)=od(j);
        end;
   c=c+compt_de_fhdi;
end;
end;

if last.reg_idx_ndem_ag then output;
run;

proc freq;
tables compt_de_di;
run;

data france_final_di23;
set france_final_di23;
reg_idx_ndem_ag=reg_idx||ndem_agreg;
run;
data france_final_di23;
merge france_final_di23 jointure2 (keep= reg_idx_ndem_ag c fh_indem1-fh_indem27
fh_regind1-fh_regind27
fh_filindem1-fh_filindem27
fh_regime1-fh_regime27
fh_jourdv1-fh_jourdv27
fh_jourfv1-fh_jourfv27
fh_odddmax1-fh_odddmax27)  ;
by reg_idx_ndem_ag;
if c=. then c=0;
rename c=compt_de_fhdi;
run;

data libs.france_final_di23;
set france_final_di23;
run;


data france_final_di23;
set libs.france_final_di23;
run;





/****************************************************************************************************************/
/*On collecte les informations sur les AR issues du FNA et du FHA en les alignant sur chaque enregistrement DE  */
/*                                                                                                              */
/*               le principe est de constituer un CALENDRIER DES MOIS en AR au sein de la DE                    */
/*                                                                                                              */
/*          Les variables importantes (issues du module AR des tables D3 du FNA et du module E0 des tables FHA) */
/*                                                                                                              */
/*                         MOIS -> DAT_AR (format SAS), NBHEURE_AR, SALAR (uniquement pour AR),                 */
/*                                      NDEM (reference uniquement pour E0)                                     */
/*                                                                                                              */
/****************************************************************************************************************/






/**** Comparaison entre les periodes d'AR du fichier AR (dans D3) et du fichier E0 ****/
/**** Variable "SALAR" dans le fichier AR de D3 ***/


data e0ar;
set libs.arfrance;
drop region;
if mois=. then delete;
rename mois=e0mois;
rename nbheur=e0nbheur;
run;

data d3ar (drop=abs_d3_ar);
set libs.france_d3ar;
if abs_d3_ar=1 then delete;

proc sort data=e0ar;
by reg idx e0mois;
proc sort data=d3ar;
by reg idx d3mois;

data reunion_d3ar_e0ar;
merge  d3ar(In=in1 rename=(d3mois=mois)) e0ar(In=in2 rename=(e0mois=mois));
by reg idx mois;
absent_e0=0;
absent_d3=0;
if In1=1 and In2=0 then absent_e0=1;
if In1=0 and In2=1 then absent_d3=1;
run;
proc freq data=reunion_d3ar_e0ar;
tables absent_e0*absent_d3/list;
run;


/**** Réunion des variables (D3nbheur et E0nbheur)  ****/
/*** Le Fichier Reunion_d3ar_e0ar présente des enregistrements en MOIS ***/

data reunion_d3ar_e0ar (drop=d3nbheur e0nbheur);
set  reunion_d3ar_e0ar;
if absent_e0=1 then nbheur_ar=d3nbheur;
else if absent_d3=1 then nbheur_ar=e0nbheur;
else nbheur_ar=d3nbheur;
run;


/**** On fusionne les mois d'AR aux DE du fichier principal ****/
/*** PARTIE 1: provenant des fichier du FHA (E0), on a les identifiants demande ***/


data reunion_d3ar_e0ar (drop=annee_ar mois_ar) ;
set  reunion_d3ar_e0ar;
annee_ar=substr(mois,1,4);
mois_ar=substr(mois,5,2);
dat_ar=mdy(mois_ar,1,annee_ar);
format dat_ar yymm7.;
run;


data france_final_di23;
set libs.france_final_di23;
annee_ins=year(datins);
mois_ins=month(datins);
datinsm=mdy(mois_ins,1,annee_ins);
format datinsm yymm7.;
annee_ann=year(datann);
mois_ann=month(datann);
datannm=mdy(mois_ann,1,annee_ann);
format datannm yymm7.;

data de_calendrier_ar;
set  france_final_di23;
keep reg idx reg_idx ndem_deb ndem_fin ndem_agreg  datins datann datinsm datannm;
run;


/* Fusion par la proc sql qui permet de le faire en utilisant des conditions d'appariement plus riches */

data reunion_d3ar_e0ar_part1 ;
set  reunion_d3ar_e0ar;
if absent_e0=0;
reg_idx=reg||idx;
run;


proc sql;
create table de_ar_part1 as
select a.*,b.*
from reunion_d3ar_e0ar_part1 as a, de_calendrier_ar as b
where a.reg_idx=b.reg_idx and b.ndem_deb<=a.ndem<=b.ndem_fin;
quit;

data de_ar_part1;
set de_ar_part1;
reg_idx_ndem_ag=reg_idx||ndem_agreg;
proc sort;
by reg_idx descending ndem_agreg dat_ar;
run;


/*** PARTIE 2: provenant des fichiers du FNA (D3), on n'a pas les identifiants demande mais on apparie sur les dates ***/

data reunion_d3ar_e0ar_part2 ;
set  reunion_d3ar_e0ar;
if absent_e0=1;
reg_idx=reg||idx;
run;
proc sql;
create table de_ar_part2 as
select a.*,b.*
from reunion_d3ar_e0ar_part2 as a, de_calendrier_ar as b
where a.reg_idx=b.reg_idx and b.datinsm<=a.dat_ar<=b.datannm;
quit;

data de_ar_part2;
set de_ar_part2;
reg_idx_ndem_ag=reg_idx||ndem_agreg;
proc sort;
by reg_idx descending ndem_agreg dat_ar;
run;

/*** On rassemble les deux parties: PART1 et PART2 ***/

data de_ar;
set de_ar_part1 de_ar_part2;
by reg_idx descending ndem_agreg dat_ar;
/*** Modifie: 5/12/2014: ajoute 1 ***/
duree_de_mois=intck('month',datinsm,datannm)+1;
run;

data de_calendrier_ar;
set  de_calendrier_ar;
/*** Modifie: 5/12/2014: ajoute 1 ***/
duree_de_mois=intck('month',datinsm,datannm)+1;
run;

proc freq;
tables duree_de_mois;
run;

/****************************************************************************************************************/
/* On calcule par DE                                                                                            */
/*      le nombre de mois en AR:                                 NB_AR                                          */
/*      les moyennes de salaire en AR:                           MOY_SALAR                                      */
/*      les moyennes du nombre d'heures en AR:                   MOY_NBHEUR_AR                                  */
/*      les écart-types du nombre d'heures:                      STD_NBHEUR_AR                                  */
/*      le minimum, le maximum, l'écart entre le min et le max:  MIN_NBHEUR_AR, MAX_NBHEUR_AR, RANGE_NBHEUR_AR  */
/*                                                                                                              */
/****************************************************************************************************************/

proc sort data=de_ar;
by reg_idx ndem_agreg;
proc means data=de_ar noprint n min max mean std range;
by reg_idx ndem_agreg;
var nbheur_ar salar;
output out=resultat  mean=moy_nbheur_ar  moy_salar min=min_nbheur_ar max=max_nbheur_ar std=std_nbheur_ar range=range_nbheur_ar;
run;

data resultat;
set resultat;
rename _FREQ_=nb_ar;
run;

data resultat;
set resultat;
keep  reg_idx ndem_agreg nb_ar moy_nbheur_ar min_nbheur_ar max_nbheur_ar std_nbheur_ar range_nbheur_ar moy_salar;
moy_nbheur_ar=int(moy_nbheur_ar);
std_nbheur_ar=round(std_nbheur_ar,.2);
run;

/**** Les DE (après fusion des DE séparées par moins de 30 jours et intégrant des périodes de maladie et de formation)
       ont des durées longues : on ne retient que les durées de moins de 5 ans (60 mois)

 ****/

data de_ar_60mois;
set de_ar;
if duree_de_mois<61;
reg_idx_ndem_ag=reg_idx||ndem_agreg;
moment_ar_de=intck('month',datinsm,dat_ar);
proc freq;
tables moment_ar_de;
run;

proc sort data=de_ar_60mois;
by reg_idx_ndem_ag;
run;
data de_ar_60mois (drop=mois dat_ar nbheur_ar salar);
set de_ar_60mois;
by reg_idx_ndem_ag;
retain ind_ar1-ind_ar60 nbheur_ar1-nbheur_ar60 sal_ar1-sal_ar60 salmiss_ar1-salmiss_ar60;
array a ind_ar1-ind_ar60;
array n nbheur_ar1-nbheur_ar60;
array s sal_ar1-sal_ar60;
array sm salmiss_ar1-salmiss_ar60;
if first.reg_idx_ndem_ag then do;
        do i=1 to 60;
a(i)=.;
n(i)=.;
s(i)=.;
sm(i)=.;
        end;
        do i=1 to duree_de_mois;
a(i)=0;
n(i)=0;
s(i)=0;
sm(i)=0;
        end;
end;
a(1+ moment_ar_de)=1;
n(1+ moment_ar_de)=nbheur_ar;
if salar ne . then  do; s(1+ moment_ar_de)=salar; sm(1+ moment_ar_de)=2; end; else sm(1+ moment_ar_de)=1;
if last.reg_idx_ndem_ag then output;
run;


/**** Correction des salaires manquants dans un episode - a cause de l'origine de l'info - avec les salaires des mois
                d AR provenant de la source FNA : on prend la moyenne du taux horaire moyen ****/

data de_ar_60mois;
set de_ar_60mois;
array a ind_ar1-ind_ar60;
array n nbheur_ar1-nbheur_ar60;
array s sal_ar1-sal_ar60;
array sm salmiss_ar1-salmiss_ar60;
som_nmiss=0;
som_miss=0;
        do i=1 to duree_de_mois;
        som_miss+(sm(i)=1);
        som_nmiss+(sm(i)=2);
        end;
if som_nmiss>0 and som_miss>0 then correct_miss=1;
run;
proc freq;
tables correct_miss;
run;

data de_ar_60mois;
set de_ar_60mois;
array a ind_ar1-ind_ar60;
array n nbheur_ar1-nbheur_ar60;
array s sal_ar1-sal_ar60;
array sm salmiss_ar1-salmiss_ar60;
array tx txh_ar1-txh_ar60;

if correct_miss=1 then do;
tx_correct=0;
do i=1 to duree_de_mois;
 if sm(i)=2 then do;
        tx(i)=s(i)/n(i);
        tx_correct=tx_correct+ tx(i);
end;
end;
tx_correct=tx_correct/som_nmiss;
end;


data de_ar_60mois;
set de_ar_60mois;
array a ind_ar1-ind_ar60;
array n nbheur_ar1-nbheur_ar60;
array s sal_ar1-sal_ar60;
array sm salmiss_ar1-salmiss_ar60;
if correct_miss=1 then do;
do i=1 to duree_de_mois;
 if sm(i)=1 then s(i)=tx_correct*n(i);
end;
end;


run;





data resultat;
set resultat;
reg_idx_ndem_ag=reg_idx||ndem_agreg;

data de_ar_60mois;
merge de_ar_60mois (in=in1) resultat;
by reg_idx_ndem_ag;
if in1;
run;

data de_ar_60mois;
set de_ar_60mois;
drop ndem cpte moment_ar_de ;
run;

/*** Ajout de la duree avant un premier mois d'AR ***/
data de_ar_60mois;
set de_ar_60mois;
array a ind_ar1-ind_ar60;
if nb_ar>0 then do;
        if a(1)=1 then mois_ar1=1;
        else do;
        do i=2 to duree_de_mois;
        if a(i)=1 and a(i-1)=0 then mois_ar1=i;
        end;
        end;
end;
run;


data libs.de_ar_60mois;
set de_ar_60mois;
run;

/****************************************************************************************************************/
/*                                       CALENDRIER   pour des durées de DE limitées à 60 mois (5 ans)          */
/*                                                                                                              */
/*               ind_ar1: Indicatrice sur l'exercice d'une AR au cours du 1ier mois de la DE                    */
/*               ind_ar2: Indicatrice sur l'exercice d'une AR au cours du 2ième mois de la DE                   */
/*                ......                                                                                        */
/*                                                                                                              */
/*            nbheur_ar1: nombre d'heures en AR au cours du 1ier mois de la DE                                  */
/*            nbheur_ar2: nombre d'heures en AR au cours du 2ième mois de la DE                                 */
/*                ......                                                                                        */
/*                                                                                                              */
/*               sal_ar1: salaire tiré de l'exercice d'une AR au cours du 1ier mois de la DE                    */
/*               sal_ar2: salaire tiré de l'exercice d'une AR au cours du 2ième mois de la DE                   */
/*                ......                                                                                        */
/*                                                                                                              */
/*                                                                                                              */
/****************************************************************************************************************/


/** Reunion de AR et PJC **/
/** On identifie les moments où les indemnités ne sont plus payés en raison des seuils (de revenu ou d'heures) **/


data france_d3pjc;
set libs.france_d3pjc;
duree_pjc=dfinpjcc-ddebpjc;
reg_idx=reg||idx;
run;

proc freq;
tables cdnonpai*duree_pjc/list;
run;

/* Essentiellement des codes 41 et 42 et très peu de code 44 et 45 */

proc sort data= france_d3pjc;
by reg_idx descending ndemi   ddebpjc;
run;

data france_d3pjc_ar_rem;
set france_d3pjc;
if cdnonpai="41" ;
run;

data france_d3pjc_ar_rem_ind (keep=reg_idx nb_pjc_ar_rem );
set france_d3pjc_ar_rem;
by reg_idx;
if first.reg_idx then nb_pjc_ar_rem=1;
else nb_pjc_ar_rem+1;
if last.reg_idx then output;
run;
proc freq;
tables nb_pjc_ar_rem;
run;

data france_d3pjc_ar_rem;
merge france_d3pjc_ar_rem france_d3pjc_ar_rem_ind;
by reg_idx;
run;


data liste_pjc_ar_rem (keep=reg idx reg_idx nb_pjc_ar_rem
datouv_ar_rem1-datouv_ar_rem23 datfer_ar_rem1-datfer_ar_rem23 );
set france_d3pjc_ar_rem;;
by reg_idx;

array dato datouv_ar_rem1-datouv_ar_rem23;
array datf datfer_ar_rem1-datfer_ar_rem23;
retain compt datouv_ar_rem1-datouv_ar_rem23 datfer_ar_rem1-datfer_ar_rem23;
format datouv_ar_rem1-datouv_ar_rem23 datfer_ar_rem1-datfer_ar_rem23    yymmdd10.;
if first.reg_idx then do;
do i=1 to 23;
        dato(i)=.;
        datf(i)=.;
end;
end;
if first.reg_idx then do;
        compt=1;
        dato(1)=DDEBPJC;
        datf(1)=DFINPJCC;
end;
else do;
        compt=compt+1;
        dato(compt)=DDEBPJC;
        datf(compt)=DFINPJCC;
end;
if last.reg_idx then output;
run;


data de_di_ar_rem;
merge liste_pjc_ar_rem (in=in1 ) de_calendrier_ar (in=in2 );
by reg_idx;
if in2;

array dato datouv_ar_rem1-datouv_ar_rem23;
array datf datfer_ar_rem1-datfer_ar_rem23;

/* détermination du type de la DI */
array t type_di_ar_rem1-type_di_ar_rem23;

if nb_pjc_ar_rem ne . then do;
do i=1 to nb_pjc_ar_rem;
t(i)=0;
end;
end;

/* Date de début - éventuellement recalculée - de la DI incluse dans la DE */
array didi datins_di_ar_rem1-datins_di_ar_rem23;
/* Date de fin - éventuellement recalculée - de la DI incluse dans la DE */
array dadi  datann_di_ar_rem1-datann_di_ar_rem23;
/* Duree recalculée pour déterminer la longueur de la partie de la DI incluse dans la DE */
array durdi duree_di_ar_rem1-duree_di_ar_rem23;
/* Calcul du temps déjà écoulée dans la DI avant le début de la DE */
array ecdi ecoul_di_ar_rem1-ecoul_di_ar_rem23;
/* Pour la DE, identifie par leur numéro, les  DI qui sont intégré en partie ou en totalité dans la DE  */
array numdi num_di_ar_rem1-num_di_ar_rem23;

format datins_di_ar_rem1-datins_di_ar_rem23 datann_di_ar_rem1-datann_di_ar_rem23    yymmdd10.;


compt_de_di_ar_rem=0;
if nb_pjc_ar_rem ne . then do;
        do i=1 to nb_pjc_ar_rem;
        /* Cas où la PJC de la DI est insérée au sein de la DE: type 1 */
        if datins<=dato(i) and datann>=datf(i) then  do;
                compt_de_di_ar_rem+1;
                t(compt_de_di_ar_rem)=1;
                didi(compt_de_di_ar_rem)=dato(i);
                dadi(compt_de_di_ar_rem)=datf(i);
                durdi(compt_de_di_ar_rem)=dadi(compt_de_di_ar_rem)-didi(compt_de_di_ar_rem);
                ecdi(compt_de_di_ar_rem)=didi(compt_de_di_ar_rem)-dato(i);
                numdi(compt_de_di_ar_rem)=i;
        end;
        /* Cas où la PJC de la DI est antérieure à la DE mais se termine au sein de la DE: type 2 */
        else if datins>dato(i) and datins<=datf(i) and datann>=datf(i) then do;
                compt_de_di_ar_rem+1;
                t(compt_de_di_ar_rem)=2;
                didi(compt_de_di_ar_rem)=datins;
                dadi(compt_de_di_ar_rem)=datf(i);
                durdi(compt_de_di_ar_rem)=dadi(compt_de_di_ar_rem)-didi(compt_de_di_ar_rem);
                ecdi(compt_de_di_ar_rem)=didi(compt_de_di_ar_rem)-dato(i);
                numdi(compt_de_di_ar_rem)=i;
        end;
        /* Cas où la PJC de la DI commence au sein de la DE mais se poursuit après la fin de l'épisode: type 3 */
        else if datins<=dato(i) and datann>=dato(i) and datann<datf(i) then do;
                compt_de_di_ar_rem+1;
                t(compt_de_di_ar_rem)=3;
                didi(compt_de_di_ar_rem)=dato(i);
                dadi(compt_de_di_ar_rem)=datann;
                durdi(compt_de_di_ar_rem)=dadi(compt_de_di_ar_rem)-didi(compt_de_di_ar_rem);
                ecdi(compt_de_di_ar_rem)=didi(compt_de_di_ar_rem)-dato(i);
                numdi(compt_de_di_ar_rem)=i;
        end;
        /* Cas où la PJC de la DI contient la totalité de la DE (démarre avent et se termine après): type 4 */
        else if datins>dato(i) and datann<datf(i) then do;
                compt_de_di_ar_rem+1;
                t(compt_de_di_ar_rem)=4;
                didi(compt_de_di_ar_rem)=datins;
                dadi(compt_de_di_ar_rem)=datann;
                durdi(compt_de_di_ar_rem)=dadi(compt_de_di_ar_rem)-didi(compt_de_di_ar_rem);
                ecdi(compt_de_di_ar_rem)=didi(compt_de_di_ar_rem)-dato(i);
                numdi(compt_de_di_ar_rem)=i;

        end;

        end;

end;
run;

proc freq;
tables compt_de_di_ar_rem;
run;

data   de_di_ar_rem
(drop=datouv_ar_rem1-datouv_ar_rem23 datfer_ar_rem1-datfer_ar_rem23
datins_di_ar_rem17-datins_di_ar_rem23 datann_di_ar_rem17-datann_di_ar_rem23 duree_di_ar_rem17-duree_di_ar_rem23
 ecoul_di_ar_rem17-ecoul_di_ar_rem23  num_di_ar_rem17-num_di_ar_rem23   );
set  de_di_ar_rem;
run;

data france_d3pjc_ar_heur;
set france_d3pjc;
if cdnonpai="42" ;
run;

data france_d3pjc_ar_heur_ind (keep=reg_idx nb_pjc_ar_heur );
set france_d3pjc_ar_heur;
by reg_idx;
if first.reg_idx then nb_pjc_ar_heur=1;
else nb_pjc_ar_heur+1;
if last.reg_idx then output;
run;
proc freq;
tables nb_pjc_ar_heur;
run;

data france_d3pjc_ar_heur;
merge france_d3pjc_ar_heur france_d3pjc_ar_heur_ind;
by reg_idx;
run;


data liste_pjc_ar_heur (keep=reg idx reg_idx nb_pjc_ar_heur
datouv_ar_heur1-datouv_ar_heur23 datfer_ar_heur1-datfer_ar_heur23 );
set france_d3pjc_ar_heur;;
by reg_idx;

array dato datouv_ar_heur1-datouv_ar_heur23;
array datf datfer_ar_heur1-datfer_ar_heur23;
retain compt datouv_ar_heur1-datouv_ar_heur23 datfer_ar_heur1-datfer_ar_heur23;
format datouv_ar_heur1-datouv_ar_heur23 datfer_ar_heur1-datfer_ar_heur23    yymmdd10.;
if first.reg_idx then do;
do i=1 to 23;
        dato(i)=.;
        datf(i)=.;
end;
end;
if first.reg_idx then do;
        compt=1;
        dato(1)=DDEBPJC;
        datf(1)=DFINPJCC;
end;
else do;
        compt=compt+1;
        dato(compt)=DDEBPJC;
        datf(compt)=DFINPJCC;
end;
if last.reg_idx then output;
run;


data de_di_ar_heur;
merge liste_pjc_ar_heur (in=in1 ) de_calendrier_ar (in=in2 );
by reg_idx;
if in2;

array dato datouv_ar_heur1-datouv_ar_heur23;
array datf datfer_ar_heur1-datfer_ar_heur23;

/* détermination du type de la DI */
array t type_di_ar_heur1-type_di_ar_heur23;

if nb_pjc_ar_heur ne . then do;
do i=1 to nb_pjc_ar_heur;
t(i)=0;
end;
end;

/* Date de début - éventuellement recalculée - de la DI incluse dans la DE */
array didi datins_di_ar_heur1-datins_di_ar_heur23;
/* Date de fin - éventuellement recalculée - de la DI incluse dans la DE */
array dadi  datann_di_ar_heur1-datann_di_ar_heur23;
/* Duree recalculée pour déterminer la longueur de la partie de la DI incluse dans la DE */
array durdi duree_di_ar_heur1-duree_di_ar_heur23;
/* Calcul du temps déjà écoulée dans la DI avant le début de la DE */
array ecdi ecoul_di_ar_heur1-ecoul_di_ar_heur23;
/* Pour la DE, identifie par leur numéro, les  DI qui sont intégré en partie ou en totalité dans la DE  */
array numdi num_di_ar_heur1-num_di_ar_heur23;

format datins_di_ar_heur1-datins_di_ar_heur23 datann_di_ar_heur1-datann_di_ar_heur23    yymmdd10.;


compt_de_di_ar_heur=0;
if nb_pjc_ar_heur ne . then do;
        do i=1 to nb_pjc_ar_heur;
        /* Cas où la PJC de la DI est insérée au sein de la DE: type 1 */
        if datins<=dato(i) and datann>=datf(i) then  do;
                compt_de_di_ar_heur+1;
                t(compt_de_di_ar_heur)=1;
                didi(compt_de_di_ar_heur)=dato(i);
                dadi(compt_de_di_ar_heur)=datf(i);
                durdi(compt_de_di_ar_heur)=dadi(compt_de_di_ar_heur)-didi(compt_de_di_ar_heur);
                ecdi(compt_de_di_ar_heur)=didi(compt_de_di_ar_heur)-dato(i);
                numdi(compt_de_di_ar_heur)=i;
        end;
        /* Cas où la PJC de la DI est antérieure à la DE mais se termine au sein de la DE: type 2 */
        else if datins>dato(i) and datins<=datf(i) and datann>=datf(i) then do;
                compt_de_di_ar_heur+1;
                t(compt_de_di_ar_heur)=2;
                didi(compt_de_di_ar_heur)=datins;
                dadi(compt_de_di_ar_heur)=datf(i);
                durdi(compt_de_di_ar_heur)=dadi(compt_de_di_ar_heur)-didi(compt_de_di_ar_heur);
                ecdi(compt_de_di_ar_heur)=didi(compt_de_di_ar_heur)-dato(i);
                numdi(compt_de_di_ar_heur)=i;
        end;
        /* Cas où la PJC de la DI commence au sein de la DE mais se poursuit après la fin de l'épisode: type 3 */
        else if datins<=dato(i) and datann>=dato(i) and datann<datf(i) then do;
                compt_de_di_ar_heur+1;
                t(compt_de_di_ar_heur)=3;
                didi(compt_de_di_ar_heur)=dato(i);
                dadi(compt_de_di_ar_heur)=datann;
                durdi(compt_de_di_ar_heur)=dadi(compt_de_di_ar_heur)-didi(compt_de_di_ar_heur);
                ecdi(compt_de_di_ar_heur)=didi(compt_de_di_ar_heur)-dato(i);
                numdi(compt_de_di_ar_heur)=i;
        end;
        /* Cas où la PJC de la DI contient la totalité de la DE (démarre avent et se termine après): type 4 */
        else if datins>dato(i) and datann<datf(i) then do;
                compt_de_di_ar_heur+1;
                t(compt_de_di_ar_heur)=4;
                didi(compt_de_di_ar_heur)=datins;
                dadi(compt_de_di_ar_heur)=datann;
                durdi(compt_de_di_ar_heur)=dadi(compt_de_di_ar_heur)-didi(compt_de_di_ar_heur);
                ecdi(compt_de_di_ar_heur)=didi(compt_de_di_ar_heur)-dato(i);
                numdi(compt_de_di_ar_heur)=i;

        end;

        end;

end;
run;

proc freq;
tables compt_de_di_ar_heur;
run;

data   de_di_ar_heur
(drop=datouv_ar_heur1-datouv_ar_heur23 datfer_ar_heur1-datfer_ar_heur23
datins_di_ar_heur17-datins_di_ar_heur23 datann_di_ar_heur17-datann_di_ar_heur23 duree_di_ar_heur17-duree_di_ar_heur23
 ecoul_di_ar_heur17-ecoul_di_ar_heur23  num_di_ar_heur17-num_di_ar_heur23   );
set  de_di_ar_heur;
run;

data de_di_ar;
merge de_di_ar_rem de_di_ar_heur;
by reg_idx ndem_agreg;
run;


data libs.de_di_ar;
set de_di_ar;
run;













/****** Novembre 2014: Consitution d'un calendrier pour les informations
                        provenant de périodes signalant des interruptions d'Indemnisation
                                pour cause d'AR  **/


data de_di_ar60;
set libs.de_di_ar;
duree_de_mois=intck('month',datinsm,datannm)+1;
if duree_de_mois<61;

/* Date de début - éventuellement recalculée - de la DI incluse dans la DE */
array didir datins_di_ar_rem1-datins_di_ar_rem23;
/* Date de fin - éventuellement recalculée - de la DI incluse dans la DE */
array dadir  datann_di_ar_rem1-datann_di_ar_rem23;
/* Date de début - éventuellement recalculée - de la DI incluse dans la DE */
array didih datins_di_ar_heur1-datins_di_ar_heur23;
/* Date de fin - éventuellement recalculée - de la DI incluse dans la DE */
array dadih  datann_di_ar_heur1-datann_di_ar_heur23;

array int interrup_id_ar1-interrup_id_ar60;
array re  indrem_id_ar1-indrem_id_ar60;
array he  indheur_id_ar1-indheur_id_ar60;

do j=1 to duree_de_mois;
int(j)=0;
re(j)=0;
he(j)=0;
end;

if compt_de_di_ar_rem>0 then do;
   do i=1 to compt_de_di_ar_rem;
        annee_ins=year(didir(i));
        mois_ins=month(didir(i));
        datinsm_rem=mdy(mois_ins,1,annee_ins);
        format datinsm_rem yymm7.;
        annee_ann=year(dadir(i));
        mois_ann=month(dadir(i));
        datannm_rem=mdy(mois_ann,1,annee_ann);
        format datannm_rem yymm7.;

        moment_pjc_de=intck('month',datinsm,datinsm_rem) ;
        duree_pjc_de=intck('month',datinsm_rem,datannm_rem) ;


        int(1+moment_pjc_de)=1;
        re(1+moment_pjc_de)=1;

        if duree_pjc_de>0 then do;
        do j=1 to duree_pjc_de;
        int(1+moment_pjc_de+j)=1;
        re(1+moment_pjc_de+j)=1;
        end;
        end;
   end;
end;

if compt_de_di_ar_heur>0 then do;
   do i=1 to compt_de_di_ar_heur;
        annee_ins=year(didih(i));
        mois_ins=month(didih(i));
        datinsm_heur=mdy(mois_ins,1,annee_ins);
        format datinsm_heur yymm7.;
        annee_ann=year(dadih(i));
        mois_ann=month(dadih(i));
        datannm_heur=mdy(mois_ann,1,annee_ann);
        format datannm_heur yymm7.;

        moment_pjc_de=intck('month',datinsm,datinsm_heur) ;
        duree_pjc_de=intck('month',datinsm_heur,datannm_heur) ;


        int(1+moment_pjc_de)=1;
        he(1+moment_pjc_de)=1;

        if duree_pjc_de>0 then do;
        do j=1 to duree_pjc_de;
        int(1+moment_pjc_de+j)=1;
        he(1+moment_pjc_de+j)=1;
        end;
        end;
   end;
end;


run;


data de_di_ar60;
set de_di_ar60;
keep  reg idx reg_idx ndem_deb ndem_fin ndem_agreg  datins datann datinsm datannm
interrup_id_ar1-interrup_id_ar60 indrem_id_ar1-indrem_id_ar60 indheur_id_ar1-indheur_id_ar60
;
data de_di_ar60;
set de_di_ar60;
reg_idx_ndem_ag=reg_idx||ndem_agreg;

data de_di_ar60;
set de_di_ar60;
array int interrup_id_ar1-interrup_id_ar60;
array re  indrem_id_ar1-indrem_id_ar60;
array he  indheur_id_ar1-indheur_id_ar60;
duree_de_mois=intck('month',datinsm,datannm)+1;
nb_interrup_id=0;
nb_interheur_id_ar=0;
nb_interrem_id_ar=0;

do i=1 to duree_de_mois;
nb_interrup_id=nb_interrup_id+int(i);
nb_interheur_id_ar=nb_interheur_id_ar+he(i);
nb_interrem_id_ar=nb_interrem_id_ar+ re(i);
end;


if nb_interrup_id>0 then do;
        if int(1)=1 then mois_interrup1=1;
        else do;
        do i=2 to duree_de_mois;
        if int(i)=1 and int(i-1)=0 then mois_interrup1=i;
        end;
        end;
end;
run;

proc freq;
tables nb_interrup_id
nb_interheur_id_ar
nb_interrem_id_ar;
run;


data de_ar_60mois;
merge de_ar_60mois(In=in1) de_di_ar60 ;
by reg_idx_ndem_ag;
if in1;
run;

data libs.de_ar_60mois;
set de_ar_60mois;
run;

/****** Novembre 2014: Consitution d'un calendrier pour les informations d'Indemnisation (comparable à celui fait pour l'AR) **/

data france_final_di23;
set libs.france_final_di23;
annee_ins=year(datins);
mois_ins=month(datins);
datinsm=mdy(mois_ins,1,annee_ins);
format datinsm yymm7.;
annee_ann=year(datann);
mois_ann=month(datann);
datannm=mdy(mois_ann,1,annee_ann);
format datannm yymm7.;
run;

data de_calendrier_ar;
set  france_final_di23;
keep reg idx reg_idx ndem_deb ndem_fin ndem_agreg  datins datann datinsm datannm duree_de_mois
datins_di1-datins_di23 datann_di1-datann_di23 compt_de_di  type_di1-type_di23
 fh_indem1-fh_indem27
fh_regind1-fh_regind27
fh_filindem1-fh_filindem27
fh_regime1-fh_regime27
fh_jourdv1-fh_jourdv27
fh_jourfv1-fh_jourfv27
fh_odddmax1-fh_odddmax27
di_durfileg1-di_durfileg23
di_allocat1-di_allocat23
di_filiere1-di_filiere23
di_durfileg1-di_durfileg23
di_ar_di1-di_ar_di23
di_durpayee1-di_durpayee23
di_durnonar1-di_durnonar23
di_mtpaye1-di_mtpaye23
di_premjnet1-di_premjnet23
di_premjbrut1-di_premjbrut23
di_mtsjr1-di_mtsjr23
di_txrn1-di_txrn23
di_txrb1-di_txrb23
di_regpart1-di_regpart23

;
duree_de_mois=intck('month',datinsm,datannm)+1 ;
/** pour les durées inférieures à 1 mois, duree_de_mois=0 => on les pose à 1 **/
*if duree_de_mois=0 then duree_de_mois=1;
run;


proc freq;
tables COMPT_DE_DI;
run;

proc means;
var di_filiere1;
run;


data de_calendrier_ar;
set de_calendrier_ar;
array didi datins_di1-datins_di23;
array dadi  datann_di1-datann_di23;
array didim datinsm_di1-datinsm_di23;
array dadim  datannm_di1-datannm_di23;
array durdim dureem_di1-dureem_di23;
array durdd duree_de_di1-duree_de_di23;

do i=1 to COMPT_DE_DI;
annee_ins=year(didi(i));
mois_ins=month(didi(i));
didim(i)=mdy(mois_ins,1,annee_ins);

annee_ins=year(dadi(i));
mois_ins=month(dadi(i));
dadim(i)=mdy(mois_ins,1,annee_ins);

durdim(i)=intck('month',didim(i),dadim(i))+1 ;

durdd(i)=intck('month',datinsm,didim(i)) ;
end;
if compt_de_di>0 then fin_indem=intck('month',dadim(compt_de_di),datannm) ;
if compt_de_di>1 then do;
     interr_indem=0;
     do i=2 to COMPT_DE_DI;
     interr_indem=interr_indem+intck('month',dadim(i-1),didim(i)) ;
     end;
end;

if compt_de_di>1 then do;
do i=2 to COMPT_DE_DI;
if didim(i)=dadim(i-1) then durdim(i)=durdim(i)-1;
end;
end;
format datinsm_di1-datinsm_di23 yymm7.;
format datannm_di1-datannm_di23 yymm7.;

run;

proc freq;
tables fin_indem interr_indem;
run;

data verif;
set de_calendrier_ar;
if interr_indem <0 and interr_indem ne .;
run;

/******** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ************/

/** Correction particulière: un cas anormal interr_indem <0  */
data de_calendrier_ar;
set de_calendrier_ar;
if interr_indem <0 and interr_indem ne . then do;
        datins_di2=datann_di1;
        datinsm_di2=datannm_di1;
        duree_de_di2=duree_de_di2+4;
        dureem_di2=dureem_di2-4;
        interr_indem=0;
end;
run;

/******** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ************/


proc freq data=  de_calendrier_ar;
tables di_regpart1 fh_regime1 ;
run;


/**** Calcul des statistiques sur les PI au sein d'un DE *****/

data de_calendrier_ar (drop=cm1 cm2);
set de_calendrier_ar;
array dal $ di_allocat1-di_allocat23;
array dfil $ di_filiere1-di_filiere23;
array ddurf  di_durfileg1-di_durfileg23;
array dard di_ar_di1-di_ar_di23;
array ddurp di_durpayee1-di_durpayee23;
array ddurn  di_durnonar1-di_durnonar23;
array dmtp di_mtpaye1-di_mtpaye23;
array dpr di_premjnet1-di_premjnet23;
array dprb di_premjbrut1-di_premjbrut23;
array dmts di_mtsjr1-di_mtsjr23;
array dtx di_txrn1-di_txrn23;
array dtxb di_txrb1-di_txrb23;
array dregp  di_regpart1-di_regpart23;
array fin $ fh_indem1-fh_indem27;
array fregd fh_regind1-fh_regind27;
array ffi $ fh_filindem1-fh_filindem27;
array fregi fh_regime1-fh_regime27;
array fjd fh_jourdv1-fh_jourdv27;
array fjf fh_jourfv1-fh_jourfv27;
array fod fh_odddmax1-fh_odddmax27;

/** Regime Interimaire **/
do j=1 to 27;
if fregd(j)=3 then interimaire=1;
if fregd(j)=4 then intermittent=1;
end;
if compt_de_di>0 then do;
        interimaire=0;
        intermittent=0;
        do i=1 to compt_de_di;
        if dregp(i)=23 or dregp(i)=24 then interimaire=1;
        if dregp(i)=28 or dregp(i)=29 then intermittent=1;
        end;
end;

/** Somme et Moyenne de plusieurs indicateurs **/
if  compt_de_di>0 then som_ar_di=0;
som_durpayee=0;
som_durnonar=0;
som_mtpaye=0;
moy_premjnet=0;
moy_premjbrut=0;
cm1=0;
moy_txrn=0;
moy_txrb=0;
cm2=0;
if compt_de_di>0 then do;
do i=1 to compt_de_di;
if dard(i) ne . then som_ar_di=som_ar_di+dard(i);
if ddurp(i) ne . then som_durpayee=som_durpayee+ddurp(i);
if ddurn(i) ne . then som_durnonar=som_durnonar+ddurn(i);
if dmtp(i) ne . then som_mtpaye=som_mtpaye+dmtp(i);
if dpr(i) ne . then do; cm1=cm1+1;moy_premjnet=moy_premjnet+dpr(i);moy_premjbrut=moy_premjbrut+dpr(i);end;
if dtx(i) ne . then do; cm2=cm2+1;moy_txrn=moy_txrn+dtx(i);moy_txrb=moy_txrb+dtx(i);end;
end;
if cm1 ne 0 then do; moy_premjnet=moy_premjnet/cm1;moy_premjbrut=moy_premjbrut/cm1; end;
if cm2 ne 0 then do; moy_txrn=moy_txrn/cm2;moy_txrb=moy_txrb/cm2;  end;
end;

run;

proc freq;
tables interimaire intermittent;
proc means;
var som_ar_di som_durpayee
som_durnonar
som_mtpaye
moy_premjnet
moy_txrn ;
run;

proc means; where  compt_de_di>0;
var som_ar_di som_durpayee
som_durnonar
som_mtpaye
moy_premjnet
moy_txrn ;
run;



data de_calendrier_ar60;
set de_calendrier_ar;
if duree_de_mois<61;

array in indem1-indem60;
array ac_in accum_ind1-accum_ind60;
array duri dur_indempot1-dur_indempot60;
array txind txindnet1-txindnet60;
array txindb txindbrut1-txindbrut60;
array sjr  sjr1-sjr60;
array txr txremp1-txremp60;
array txrb txrempb1-txrempb60;



array dal $ di_allocat1-di_allocat23;
array dfil $ di_filiere1-di_filiere23;
array ddurf  di_durfileg1-di_durfileg23;
array dard di_ar_di1-di_ar_di23;
array ddurp di_durpayee1-di_durpayee23;
array ddurn  di_durnonar1-di_durnonar23;
array dmtp di_mtpaye1-di_mtpaye23;
array dpr di_premjnet1-di_premjnet23;
array dprb di_premjbrut1-di_premjbrut23;
array dmts di_mtsjr1-di_mtsjr23;
array dtx di_txrn1-di_txrn23;
array dtxb di_txrb1-di_txrb23;
array dregp  di_regpart1-di_regpart23;


array didim datinsm_di1-datinsm_di23;
array dadim  datannm_di1-datannm_di23;

array durdim dureem_di1-dureem_di23;
array durdd duree_de_di1-duree_de_di23;

nb_indem=0;
do i=1 to duree_de_mois;
ac_in(i)=0;
in(i)=0;
duri(i)=0;
txind(i)=0;
sjr(i)=0;
txr(i)=0;
txindb(i)=0;
txrb(i)=0;
end;


if compt_de_di>0 then do;
/* Première PI */

do i=duree_de_di1+1 to duree_de_di1+dureem_di1;
if ddurp(1)>0 then in(i)=1;
nb_indem=nb_indem+in(i);
ac_in(i)=nb_indem;
duri(i)=4*(di_durfileg1=122)+7*(di_durfileg1=213)+12*(di_durfileg1=365)+15*(di_durfileg1=456)+21*(di_durfileg1=639)+
23*(di_durfileg1=700)+30*(di_durfileg1=912)+36*(di_durfileg1=1095)+42*(di_durfileg1=1277)+45*(di_durfileg1=1369);
txind(i)=di_premjnet1;
sjr(i)=di_mtsjr1;
txr(i)=di_txrn1;
txindb(i)=di_premjbrut1;
txrb(i)=di_txrb1;
end;


/* Les PI suivantes */
if compt_de_di>1 then do;
        do i=2 to  COMPT_DE_DI;
        dur_interm_di=intck('month',dadim(i-1),didim(i)) ;
        dur_depuis_di1=intck('month',datinsm,dadim(i-1))+1 ;
        if dur_interm_di>0 then do;
                do j=1 to dur_interm_di;
                ac_in(dur_depuis_di1+j)=nb_indem;
                end;
        end;


        if durdim(i)+durdd(i)<= duree_de_mois and durdim(i)>0  then do;
         do j=1 to durdim(i);
        if ddurp(i)>0 then in(j+durdd(i)+1*(dur_interm_di=0))=1;
        nb_indem=nb_indem+in(j+durdd(i)+1*(dur_interm_di=0));
        ac_in(j+durdd(i)+1*(dur_interm_di=0))=nb_indem;
        duri(j+durdd(i)+1*(dur_interm_di=0))=4*(ddurf(i)=122)+7*(ddurf(i)=213)+12*(ddurf(i)=365)+15*(ddurf(i)=456)+21*(ddurf(i)=639)+
23*(ddurf(i)=700)+30*(ddurf(i)=912)+36*(ddurf(i)=1095)+42*(ddurf(i)=1277)+45*(ddurf(i)=1369);
txind(j+durdd(i)+1*(dur_interm_di=0))=dpr(i);
sjr(j+durdd(i)+1*(dur_interm_di=0))=dmts(i);
txr(j+durdd(i)+1*(dur_interm_di=0))=dtx(i);
txindb(j+durdd(i)+1*(dur_interm_di=0))=dprb(i);
txrb(j+durdd(i)+1*(dur_interm_di=0))=dtxb(i);
        end;
        end;

end;
end;
end;
if fin_indem>0 then do;
                do j=1 to fin_indem;
                ac_in(duree_de_mois-fin_indem+j)=nb_indem;
                end;
end;

rename moy_premjnet=moy_txind;
run;

proc freq;
tables accum_ind1;
run;

data verif;
set de_calendrier_ar60;
array ac_in accum_ind1-accum_ind60;

if duree_de_mois then do;
do i=2 to duree_de_mois;
        if ac_in(i)>1 and ac_in(i-1)=0 then anorm=1;
        end;
end;
if anorm=1;
run;


data de_calendrier_ar60;
set de_calendrier_ar60;

array in indem1-indem60;
array ac_in accum_ind1-accum_ind60;
array rin reste_ind1-reste_ind60;
array duri dur_indempot1-dur_indempot60;
array sjr  sjr1-sjr60;

avt_indem=duree_de_di1;

if nb_indem>0 then do;
        if ac_in(1)=1 then do;mois_ind1=1;sal_jour_ref=sjr1;end;
        else do;
        do i=2 to duree_de_mois;
        if ac_in(i)=1 and ac_in(i-1)=0 then do;mois_ind1=i;sal_jour_ref=sjr(i);end;
        end;
        end;

        ref_durind=duri(mois_ind1);
        if ac_in(1)=1 and ref_durind>0 then rin(1)=ref_durind-1;

        if duree_de_mois>1 then do;

        accum_inter=0;
        do i=2 to duree_de_mois;
        if ref_durind>0 and duri(i)=ref_durind then  rin(i)=ref_durind-(ac_in(i)-accum_inter);
        else if ref_durind>0 and duri(i) ne ref_durind and duri(i)>0 then do;
        ref_durind=duri(i);
        accum_inter=ac_in(i-1);
        rin(i)=ref_durind-(ac_in(i)-accum_inter);
        end;
        end;

        end;
end;

run;


proc means; where  compt_de_di>0;
var sal_jour_ref ;
run;





data libs.de_calendrier_id60;
set de_calendrier_ar60;
keep
 reg idx reg_idx ndem_deb ndem_fin ndem_agreg  datins datann datinsm datannm duree_de_mois
indem1-indem60
nb_indem  mois_ind1
avt_indem fin_indem interr_indem
dur_indempot1-dur_indempot60 reste_ind1-reste_ind60
accum_ind1-accum_ind60
txindnet1-txindnet60 txindbrut1-txindbrut60 sjr1-sjr60
txremp1-txremp60 txrempb1-txrempb60
interimaire intermittent
som_ar_di
som_durpayee
som_durnonar
som_mtpaye
moy_txind
moy_txrn
moy_premjbrut
moy_txrb
sal_jour_ref
;
run;





/**** On réunit le calendrier des AR et Interruptions d'IC avec le calendrier des Indeminisations ****/
/**** !!!! Le calendrier des AR ne porte que sur les DE qui présentent de l'AR (un peu moins de 100 000 cas) ****/


data de_calendrier_id60;
set libs.de_calendrier_id60;
reg_idx_ndem_ag=reg_idx||ndem_agreg;
run;


data de_calendrier_idar60;
merge de_calendrier_id60(In=in1) libs.de_ar_60mois(In=in2);
by reg_idx_ndem_ag;
array a ind_ar1-ind_ar60;
array n nbheur_ar1-nbheur_ar60;
array s sal_ar1-sal_ar60;
array int interrup_id_ar1-interrup_id_ar60;
array re  indrem_id_ar1-indrem_id_ar60;
array he  indheur_id_ar1-indheur_id_ar60;

if in2=0 and in1=1 then do;
        nb_ar=0;
        moy_salar=0;
        moy_nbheur_ar=0;
        nb_interrup_id=0;
        nb_interheur_id_ar=0;
        nb_interrem_id_ar=0;
        do i=1 to duree_de_mois;
        a(i)=0;
        n(i)=0;
        s(i)=0;
        int(i)=0;
        re(i)=0;
        he(i)=0;
        end;
end;


run;

/*** On calcule le rapport  des revenus d'AR sur le sal MENSUEL de référence ***/


data de_calendrier_idar60;
set de_calendrier_idar60;
array s sal_ar1-sal_ar60;
array sp salpourc_ar1-salpourc_ar60;
sal_mois_ref=sal_jour_ref*30;
if nb_indem>0 then do;
       do i=1 to duree_de_mois;
        if sal_mois_ref>0 then sp(i)=round(s(i)/sal_mois_ref,.01);
        end;
end;
proc freq;where sal_ar1/sal_mois_ref>0 and nb_indem>0;
tables salpourc_ar1;
run;

/*** On introduit des indicateurs de censure en mettant à la durée de la DE, les mois_ar1 et mois_interrup1
        lorsqu'ils sont en valeurs manquantes  ***/


data de_calendrier_idar60;
set de_calendrier_idar60;
if mois_ar1=. then do;
        mois_ar1=duree_de_mois;
        censur_ar1=1;
end;
else    censur_ar1=0;

/*** La duree écoulée avant interruption d'indemnisation n'a de sens que s'il y a bien Indemnisation
                                et Exercice d'AR ***/
/*** La censure pour cette durée: peut provenir:
                - d'une absence d'exercice d'AR
                - ou d'une pratique d'AR respectant les contraintes de cumul ***/


if mois_interrup1=. and nb_ar>0 and nb_indem>0 then do;
        mois_interrup1=duree_de_mois;
        censur_interrup1=1;
end;
else if mois_interrup1 ne . and nb_ar>0 then  censur_interrup1=0;
run;
proc freq;
tables  censur_ar1 censur_interrup1;
run;

proc means;
var sal_jour_ref;
run;

proc means;where nb_indem>0;
var MOY_TXRN;
run;

data de_calendrier_idar60;
set de_calendrier_idar60;
duree_avt_ar1=mois_ar1;
if censur_interrup1 ne . then duree_avt_interrup1=mois_interrup1-mois_ar1+1;
run;

data libs.de_calendrier_idar60;
set de_calendrier_idar60 ;
run;


/******** On calcule le passé des demandes d'emploi et des pratiques d'AR **********/

data de_calendrier_idar60;
set de_calendrier_idar60 ;
proc sort;
by reg_idx datins;

data de_calendrier_idar60 (drop=duree_de_mois_1 nb_ar_1
duree_avt_ar1_1
moy_salar_1
moy_nbheur_ar_1
nb_interrup_id_1
interimaire_1
datann_1);
set de_calendrier_idar60;
by reg_idx;
retain
passe_durcum_cho
duree_de_mois_1
passe_nbcum_ar
nb_ar_1
duree_avt_ar1_1
moy_salar_1
moy_nbheur_ar_1
nb_interrup_id_1
interimaire_1
datann_1;
array p
passe_durcum_cho
passe_nbcum_ar
passe_duree_cho1
passe_nb_ar1
passe_duree_avt_ar1
passe_moy_salar1
passe_moy_nbheur_ar1
passe_nb_interrup_id1
passe_interimaire1
passe_duree_avt_cho1;

if first.reg_idx then do;
do i=1 to 10;
p(i)=0;
end;
duree_de_mois_1=duree_de_mois;
nb_ar_1=nb_ar;
duree_avt_ar1_1=duree_avt_ar1;
moy_salar_1=moy_salar;
moy_nbheur_ar_1=moy_nbheur_ar;
nb_interrup_id_1=nb_interrup_id;
interimaire_1=interimaire;
datann_1=datann;

num_de=1;
end;
else do;
num_de+1;
passe_durcum_cho=passe_durcum_cho+duree_de_mois_1;
passe_nbcum_ar=passe_nbcum_ar+nb_ar_1;
passe_duree_cho1=duree_de_mois_1;
passe_nb_ar1=nb_ar_1;
passe_duree_avt_ar1=duree_avt_ar1_1;
passe_moy_salar1=moy_salar_1;
passe_moy_nbheur_ar1=moy_nbheur_ar_1;
passe_nb_interrup_id1=nb_interrup_id_1;
passe_interimaire1=interimaire_1;
passe_duree_avt_cho1=intck('month',datann_1,datins);

/* Actualise les variables passées */

duree_de_mois_1=duree_de_mois;
nb_ar_1=nb_ar;
duree_avt_ar1_1=duree_avt_ar1;
moy_salar_1=moy_salar;
moy_nbheur_ar_1=moy_nbheur_ar;
nb_interrup_id_1=nb_interrup_id;
interimaire_1=interimaire;
datann_1=datann;

end;


run;

data libech.de_calendrier_idar60;
set de_calendrier_idar60 ;
run;
