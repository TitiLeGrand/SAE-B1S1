#include<iostream>
#include<stdlib.h>
#include<time.h>
#include <fstream>
#include<string>
#include <sstream>


int Rejouer(std::string choix_jeu);  //prendre en compte qu'il y aura une fonction rejouer par la suite



void PFC_1J() {   //Pierre Feuille Ciseaux version 1 joueur
	std::string utilisateur,ordi, nv_difficulte;
	int val,nb_p, nb_f, nb_c,nb_party,Vj,Vo,Vr;
	float a;
	nb_party=0;
	Vj=0;
	Vo=0;
	Vr=0;

		srand(time(NULL));

		std::ifstream monFluxl("./PFC.txt");      //fichier texte pour l'IA
		if(monFluxl)
		{
			monFluxl >> nb_p >> nb_f >> nb_c;
		}

	std::cout<<"Combien de parties souhaitez vous faire ?"<<std::endl;
	std::cin>>nb_party;


	std::cout<<"Choisissez votre adversaire entre l'ordinateur (entrez ordinateur) ou notre IA de compétition Ralhed (entrez Ralhed) : "<<std::endl;
	std::cin>>nv_difficulte;
	if (nv_difficulte!="ordinateur" && nv_difficulte!="Ralhed") {
		std::cout<<"Choisissez votre adversaire entre l'ordinateur (entrez ordinateur) ou notre IA de compétition Ralhed (entrez Ralhed) : "<<std::endl;
		std::cin>>nv_difficulte;
	}

	else if (nv_difficulte == "ordinateur") {  //version full aléatoire avec l'ordinateur
		while(nb_party>0) {
			while (utilisateur !="pierre" && utilisateur !="feuille" && utilisateur !="ciseaux") {
			std::cout<<"entrez pierre, feuille ou ciseaux"<<std::endl;
			std::cin>>utilisateur;
			}

			val=(rand() % 3);
				if (val == 0) {
					ordi="pierre";
				}
				else if (val == 1) {
					ordi="feuille";
				}
				else if (val == 2) {
					ordi="ciseaux";
				}

			if (utilisateur == ordi) {
				std::cout<<"L'ordi joue "<<ordi<<std::endl;
				std::cout<<"Egalité"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
			}
			else if (utilisateur=="feuille" && ordi=="pierre") {
				std::cout<<"L'ordinateur a joué pierre"<<std::endl;
				std::cout<<"Victoire du joueur"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vj++;
			}
			else if (utilisateur=="ciseaux" && ordi=="pierre") {
				std::cout<<"L'ordinateur a joué pierre"<<std::endl;
				std::cout<<"Victoire de l'ordi"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vo++;
			}
			else if (utilisateur=="pierre" && ordi=="ciseaux") {
				std::cout<<"L'ordinateur a joué ciseaux"<<std::endl;
				std::cout<<"Victoire du joueur"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vj++;
			}
			else if (utilisateur=="feuille" && ordi=="ciseaux") {
				std::cout<<"L'ordinateur a joué ciseaux"<<std::endl;
				std::cout<<"Victoire de l'ordi"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vo++;
			}
			else if (utilisateur=="ciseaux" && ordi=="feuille") {
				std::cout<<"L'ordinateur a joué feuille"<<std::endl;
				std::cout<<"Victoire du joueur"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vj++;
			}
			else if (utilisateur=="pierre" && ordi=="feuille") {
				std::cout<<"L'ordinateur a joué feuille"<<std::endl;
				std::cout<<"Victoire de l'ordi"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vo++;
			}
		nb_party--;
		utilisateur=" ";
		}
		if (Vj>Vo) {
			std::cout<<"BRAVO, vous remportez le jeu "<<Vj<<" à "<<Vo<<std::endl;
		}
		else if (Vo>Vj) {
			std::cout<<"L'ordinateur remporte le jeu "<<Vo<<" à "<<Vj<<std::endl;
		}
		else {
			std::cout<<"Egalité parfaite !"<<std::endl;
		}
	}
	else if (nv_difficulte == "Ralhed") {   //version contre Ralhed (notre IA)
		while(nb_party>0) {
			while (utilisateur !="pierre" && utilisateur !="feuille" && utilisateur !="ciseaux") {
				std::cout<<"entrez pierre, feuille ou ciseaux"<<std::endl;
				std::cin>>utilisateur;
			}


			if (utilisateur == "pierre") {
				nb_p++;
			}
			else if (utilisateur == "feuille") {
				nb_f++;
			}
			else if (utilisateur == "ciseaux") {
				nb_c++;
			}


			float p_p = nb_p/float(nb_p+nb_f+nb_c);
			float p_f = nb_f/float(nb_p+nb_f+nb_c);
			float p_c = nb_c/float(nb_p+nb_f+nb_c);
			a=rand()/float(RAND_MAX);


			if (a-p_p<0) {
				ordi="feuille";
			}
			else if (a-p_p-p_f<0) {
				ordi="ciseaux";
			}
			else {
				ordi="pierre";
			}

 

 

			if (utilisateur == ordi) {
				std::cout<<"Ralhed joue "<<ordi<<std::endl;
				std::cout<<"Egalité"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
			}
			else if (utilisateur=="feuille" && ordi=="pierre") {
				std::cout<<"Ralhed a joué pierre"<<std::endl;
				std::cout<<"Victoire du joueur"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vj++;
			}
			else if (utilisateur=="ciseaux" && ordi=="pierre") {
				std::cout<<"Ralhed a joué pierre"<<std::endl;
				std::cout<<"Victoire de Ralhed"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vr++;
			}
			else if (utilisateur=="pierre" && ordi=="ciseaux") {
				std::cout<<"Ralhed a joué ciseaux"<<std::endl;
				std::cout<<"Victoire du joueur"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vj++;
			}
			else if (utilisateur=="feuille" && ordi=="ciseaux") {
				std::cout<<"Ralhed a joué ciseaux"<<std::endl;
				std::cout<<"Victoire de Ralhed"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vr++;
			}
			else if (utilisateur=="ciseaux" && ordi=="feuille") {
				std::cout<<"Ralhed a joué feuille"<<std::endl;
				std::cout<<"Victoire du joueur"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vj++;
			}
			else if (utilisateur=="pierre" && ordi=="feuille") {
				std::cout<<"Ralhed a joué feuille"<<std::endl;
				std::cout<<"Victoire de Ralhed"<<std::endl;
				std::cout<<" "<<std::endl;
				std::cout<<"----------"<<std::endl;
				std::cout<<" "<<std::endl;
				Vr++;
			}

 

 

			std::string const nomFichier("./PFC.txt");
			std::ofstream monFluxe(nomFichier.c_str());
			if(monFluxe) {
				monFluxe << nb_p << " " << nb_f << " " << nb_c ;
			}
		nb_party--;
		utilisateur=" ";
		}
		if (Vj>Vr) {
			std::cout<<"BRAVO, vous remportez le jeu "<<Vj<<" à "<<Vr<<std::endl;
		}
		else if (Vr>Vj) {
			std::cout<<"Ralhed remporte le jeu "<<Vr<<" à "<<Vj<<std::endl;
		}
		else {
			std::cout<<"Egalité parfaite !"<<std::endl;
		}
	}
}


void PFC_2J () {     //Pierre Feuille Ciseaux version 2 joueurs
	int nb_party,Vu1,Vu2;
	nb_party=0;
	Vu1=0;
	Vu2=0;
	std::string u1="";
	std::string u2="";
	std::string prenom1="";
	std::string prenom2="";
	std::cout<<"Quel est le prénom de l'utilisateur 1 ?"<<std::endl;
	std::cin>>prenom1;
	std::cout<<""<<std::endl;
	std::cout<<"Quel est le prénom de l'utilisateur 2 ?"<<std::endl;
	std::cin>>prenom2;
	std::cout<<""<<std::endl;
	std::cout<<"Combien de parties souhaitez vous faire ?"<<std::endl;
	std::cin>>nb_party;
	
	while (nb_party>0) {
		u1="";
		u2="";
		while ((u1!="pierre") && (u1!="feuille") && (u1!="ciseaux")) {
			std::cout<<prenom1<<" : entrez pierre, feuille ou ciseaux"<<std::endl;
			std::cin>>u1;
			std::system("clear");
		}
		while ((u2!="pierre") && (u2!="feuille") && (u2!="ciseaux")) {
			std::cout<<prenom2<<" : entrez pierre, feuille ou ciseaux"<<std::endl;
			std::cin>>u2;
			}
		while (u1==u2) {
			std::cout<<"égalité, recommencez !"<<std::endl;
			std::cout<<prenom1<<" : entrez pierre, feuille ou ciseaux"<<std::endl;
			std::cin>>u1;
			std::system("clear");
			std::cout<<prenom2<<" : entrez pierre, feuille ou ciseaux"<<std::endl;
			std::cin>>u2;
		}
		if ((u1=="pierre") && (u2=="feuille")) {
			std::cout<<prenom1<<" a fait "<<u1<<" et "<<prenom2<<" a fait "<<u2<<" !"<<std::endl;
			std::cout<<prenom2<<" a gagné cette manche !"<<std::endl;
			Vu2++;
			std::cout<<""<<std::endl;
		}
		else if ((u1=="feuille") && (u2=="pierre")) {
			std::cout<<prenom1<<" a fait "<<u1<<" et "<<prenom2<<" a fait "<<u2<<" !"<<std::endl;
			std::cout<<prenom1<<" a gagné cette manche !"<<std::endl;
			Vu1++;
			std::cout<<""<<std::endl;
		}
		else if ((u1=="pierre") && (u2=="ciseaux")) {
			std::cout<<prenom1<<" a fait "<<u1<<" et "<<prenom2<<" a fait "<<u2<<" !"<<std::endl;
			std::cout<<prenom1<<" a gagné cette manche !"<<std::endl;
			Vu1++;
			std::cout<<""<<std::endl;
		}
		else if ((u1=="ciseaux") && (u2=="pierre")) {
			std::cout<<prenom1<<" a fait "<<u1<<" et "<<prenom2<<" a fait "<<u2<<" !"<<std::endl;
			std::cout<<prenom2<<" a gagné cette manche !"<<std::endl;
			Vu2++;
			std::cout<<""<<std::endl;
		}
		else if ((u1=="feuille") && (u2=="ciseaux")) {
			std::cout<<prenom1<<" a fait "<<u1<<" et "<<prenom2<<" a fait "<<u2<<" !"<<std::endl;
			std::cout<<prenom2<<" a gagné cette manche !"<<std::endl;
			Vu2++;
			std::cout<<""<<std::endl;
		}
		else if ((u1=="ciseaux") && (u2=="feuille")) {
			std::cout<<prenom1<<" a fait "<<u1<<" et "<<prenom2<<" a fait "<<u2<<" !"<<std::endl;
			std::cout<<prenom1<<" a gagné cette manche !"<<std::endl;
			Vu1++;
			std::cout<<""<<std::endl;
		}
		nb_party--;
	}
	if (Vu1>Vu2) {
		std::cout<<prenom1<<" a gagné "<<Vu1<<" à "<<Vu2<<" !"<<std::endl;
		std::cout<<""<<std::endl;
	}
	else if (Vu1<Vu2) {
		std::cout<<prenom2<<" a gagné "<<Vu2<<" à "<<Vu1<<" !"<<std::endl;
		std::cout<<""<<std::endl;
	}
	else {
		std::cout<<"Egalité parfaite ! (score : "<<Vu1<<" à "<<Vu2<<" )"<<std::endl;
		std::cout<<""<<std::endl;
	}
}
	

void morpion() {        //Morpion
	int n,l,c,p,i,j;
	
	std::cout<<"entrez la taille de la grille"<<std::endl;
	std::cin>>n;
	char grille[n][n];
	std::cout<<"L'utilisateur 1 utilisera les 'x' et l'utilisateur 2 utilisera les 'o'"<<std::endl;
	for (i=0;i<n;i++) {
		for (j=0;j<n;j++) {
			grille[i][j]=' ';
		}
	}
	for (int i=0;i<n;i++) {   //affichage de la grille
		std::cout<<"|";
		for (int j=0;j<n;j++) {
			std::cout<<grille[i][j]<<"|";
		}
		std::cout<<""<<std::endl;
	}
	std::cout<<"Entrez les coordonnées de l'endroit ou vous voulez mettre votre symbole"<<std::endl;
	p=n*n;
	while (p>0) {    //tant que toutes les cases ne sont pas occupées
		if (p%2!=0) {
			std::cout<<"C'est à l'utilisateur 1 de jouer !"<<std::endl;
			std::cout<<"Entrez la ligne où vous voulez jouer (entre 1 et la taille max de la grille)"<<std::endl;
			std::cin>>l;
			if ((l<1) || (l>n)) {
				std::cout<<"La coordonnée est trop grande ou trop petite, recommencez (entre 1 et la taille max de la grille)"<<std::endl;
				std::cin>>l;
			}
			std::cout<<"Entrez la colonne où vous voulez jouer (entre 1 et la taille max de la grille)"<<std::endl;
			std::cin>>c;
			if ((c<1) || (c>n)) {
				std::cout<<"La coordonnée est trop grande ou trop petite, recommencez (entre 1 et la taille max de la grille)"<<std::endl;
				std::cin>>c;
			}
			l--;
			c--;
			grille[l][c]='x';
			for (int i=0;i<n;i++) {   //affichage de la grille
				std::cout<<"|";
				for (int j=0;j<n;j++) {
					std::cout<<grille[i][j]<<"|";
				}
				std::cout<<""<<std::endl;
			}
			p--;    //p devient impair donc on passe à l'autre joueur
		}
		else if (p%2==0) {
			std::cout<<"C'est à l'utilisateur 2 de jouer !"<<std::endl;
			std::cout<<"Entrez la ligne où vous voulez jouer (entre 1 et la taille max de la grille)"<<std::endl; 
			std::cin>>l;
			if ((l<1) || (l>n)) {
				std::cout<<"La coordonnée est trop grande ou trop petite, recommencez (entre 1 et la taille max de la grille)"<<std::endl;
				std::cin>>l;
			}
			std::cout<<"Entrez la colonne où vous voulez jouer (entre 1 et la taille max de la grille)"<<std::endl;
			std::cin>>c;
			if ((c<1) || (c>n)) {
				std::cout<<"La coordonnée est trop grande ou trop petite, recommencez (entre 1 et la taille max de la grille)"<<std::endl;
				std::cin>>c;
			}
			l--;
			c--;
			grille[l][c]='o';
			for (int i=0;i<n;i++) {     //affichage de la grille
				std::cout<<"|";
				for (int j=0;j<n;j++) {
					std::cout<<grille[i][j]<<"|";
				}
				std::cout<<""<<std::endl;
			}
			p--;   //p devient pair donc on passe à l'autre joueur
		}
		int nL=0, nC = 0;
		for (int w=0;w<n;w++) {          //vérification des lignes/colonnes/diagonales pour la victoire
			for (int y=0;y<n;y++) {
				if (grille[w][y]=='x') {
					nL++;
				}
				if (grille[w][y]=='o') {
					nL--;
				}
				if (grille[y][w]=='x') {
					nC++;
				}
				if (grille[y][w]=='o') {
					nC--;
				}
			}
			if ((nL==3) || (nC==3)) {
				std::cout<<"L'utilisateur 1 a gagné !"<<std::endl;
				p=0;
			}
			if ((nL==-3) || (nC==-3)) {
				std::cout<<"L'utilisateur 2 a gagné !"<<std::endl;
				p=0;
			}
			nC=0;
			nL=0;
		}
		for (int v=0;v<n;v++) {
			if (grille[v][v]=='x') {
				nL++;
			}
			if (grille[v][v]=='o') {
				nL--;
			}
			if (grille[v][n-(v+1)]=='x') {
				nC++;
			}
			if (grille[v][n-(v+1)]=='o') {
				nC--;
			}
		}
		if (nL==3) {
			std::cout<<"L'utilisateur 1 a gagné"<<std::endl;
			p=0;
		}
		if (nL==-3) {
			std::cout<<"L'utilisateur 2 a gagné"<<std::endl;
			p=0;
		}
		if (nC==3) {
			std::cout<<"L'utilisateur 1 a gagné"<<std::endl;
			p=0;
		}
		if (nC==-3) {
			std::cout<<"L'utilisateur 2 a gagné"<<std::endl;
			p=0;
		}
	}
	Rejouer("morpion");
}


void justePrix() {             //juste prix
	int val, x, n, tentative;
	std::string objet="";
	std::cout<<"Bienvenu dans notre juste prix !"<<std::endl;
	std::cout<<"Choisissez un objet parmi à deviner le prix parmi : téléphone, télé, arrosoir, cuisine"<<std::endl;
	std::cin>>objet;
	std::cout<<""<<std::endl;
	if (objet=="télé") {
		std::cout<<"Vous avez choisi la télé intelligente 4K de chez Samsung !"<<std::endl;
		val=779;
		n=10;
	}
	if (objet=="téléphone") {
		std::cout<<"Vous avez choisi le dernier iPhone 15 !"<<std::endl;
		val=969;
		n=10;
	}
	if (objet=="arrosoir") {
		std::cout<<"Vous avez choisi notre magnifique arrosoir !"<<std::endl;
		val=28;
		n=5;
	}
	if (objet=="cuisine") {
		std::cout<<"Vous avez choisi notre cuisine tout équipée !"<<std::endl;
		val=7969;
		n=15;
	}
	std::cout<<"Devinerez vous son prix ?"<<std::endl;
	std::cout<<"Entrez un nombre pour commencer"<<std::endl;
	tentative=n;
	while (tentative>0) {      //tant que l'utilisateur a encore des tentatives
		std::cin>>x;
		std::cout<<""<<std::endl;
		if (x<val) {
			std::cout<<"Le juste prix est plus grand !"<<std::endl;
			tentative--;
			std::cout<<"Il te reste : "<<tentative<<" tentatives"<<std::endl;
		}
		if (x>val) {
			std::cout<<"Le juste prix est plus petit !"<<std::endl;
			tentative--;
			std::cout<<"Il te reste : "<<tentative<<" tentatives"<<std::endl;
		}
		if (x==val) {
			tentative--;
			std::cout<<"Tu as trouvé en "<<n-tentative<<" tentatives, Bravo !"<<std::endl;
			Rejouer("JP");
		}
	}
	if ((tentative==0) && (x!=val)) {
			std::cout<<"Perdu"<<std::endl;
			std::cout<<"Le prix était : "<<val<<std::endl;
	}
	Rejouer("JP");
}

void pendu() {       //pendu
	std::string mot;
	std::string mot_trous;
	char lettre;
	int i,lettres_trouvees,nb_lettres_mot,nb_vies,compteur;
	std::cout<<"Entrez le mot à faire deviner"<<std::endl;
	std::cin>>mot;
	std::system("clear");
	mot_trous="";
	nb_vies=10;
	compteur=0;
	for (int k=0;k<mot.length();k++) {    //faire afficher les tirets du mot à trouver
		mot_trous=mot_trous+" _";
	}
	lettres_trouvees=0;
	nb_lettres_mot=mot.length();
	while ((nb_vies>0) && (lettres_trouvees<nb_lettres_mot)) {  //tant que le nombre de vie est supérieur à 0 et que toutes les lettres ne sont pas trouvées
		std::cout<<"Avancée actuelle : "<<mot_trous<<std::endl;
		std::cout<<"Entrez une lettre"<<std::endl;
		std::cin>>lettre;
		compteur=0;
		for (i=0;i<mot.length();i++) {
			if (mot[i]==lettre) {
			compteur++;
			}
		}
		if (compteur>=1) {
			std::cout<<"Oui, il y a un "<<" '"<<lettre<<"' "<<"dans le mot !"<<std::endl;
			for (i=0;i<mot.length();i++) {
				if (mot[i]==lettre) {
					if (i==0) {
						mot_trous[i+1]=lettre;
						lettres_trouvees++;
					}
					else {
						mot_trous[i*2+1]=lettre;
						lettres_trouvees++;
					}
				}
			}
		}
		else {
			nb_vies--;
			std::cout<<"Cette lettre n'est pas dans le mot, il vous reste "<<nb_vies<<" chances"<<std::endl;
		}
	}
	if (lettres_trouvees<nb_lettres_mot) {    //si le joueur a perdu
		std::cout<<"Perdu, le mot était : "<<mot<<std::endl;
		std::cout<<""<<std::endl;
		Rejouer("pendu");
	}
	else {         //si le joueur a gagné
		std::cout<<mot_trous<<std::endl;
		std::cout<<"Bravo, vous avez trouvé le mot !"<<std::endl;
		Rejouer("pendu");
	}
}


void TourJoueur(int & score){   //sous fonction qui simule les 2 lancers de dés pour le cinquante points
	
	int lancer1 = 0;
	int lancer2 = 0;
	
	
	lancer1 = rand() % 6 + 1;
	lancer2 = rand() % 6 + 1;

	std::cout<<"lancer 1 : "<<lancer1<<std::endl;
	std::cout<<"lancer 2 : "<<lancer2<<std::endl;
	
	if(lancer1 == lancer2){
		switch(lancer1){
			case 1 : score = score+5; break;
			case 2 : score = score+5; break;
			case 3 : score = 0; break;
			case 4 : score = score+5; break;
			case 5 : score = score+5; break;
			case 6 : score = score+25; break;
		};
	};
}


void cinquantePoints() {  //le cinquante points
	
	srand (time(NULL));
	
	int score_joueur1 = 0;
	int score_joueur2 = 0;
	int ordi_ou_jcj = 0;
	int continuer_ou_non = 1;
	
	std::cout<<std::endl;

	std::cout<<"Règle du jeu :"<<std::endl;
	std::cout<<"À tour de rôle, les joueurs lancent deux dés et le but est d’arriver à 50 points"<<std::endl;
	std::cout<<"S’ils n’obtiennent aucun double, ils ne marquent pas de points."<<std::endl;
	std::cout<<"En revanche, si leurs dés affichent des doubles ils gagnent des points : "<<std::endl;
	std::cout<<"S’ils obtiennent un double 1, 2, 4 ou 5 il gagne 5 points"<<std::endl;
	std::cout<<"S’ils obtiennent un double 6 ils gagnent 25 points"<<std::endl;
	std::cout<<"Mais ATTENTION, s’ils obtiennent un double 3, ils perdent tous leurs points !"<<std::endl;
	
	std::cout<<std::endl;
	
	std::cout<<"Pour jouer contre un autre joueur, taper '1', sinon si vous voulez jouer contre un ordi entrer '0'"<<std::endl;
	std::cin>>ordi_ou_jcj;
	
	while (continuer_ou_non != 0){
		
		if(ordi_ou_jcj == 1){
			std::cout<<"Tour au Joueur 1 : "<<std::endl;
			TourJoueur(score_joueur1);
			std::cout<<"score Joieur 1 : "<<score_joueur1<<std::endl;
			std::cout<<std::endl;
			std::cout<<"Tour au Joueur 2 : "<<std::endl;
			TourJoueur(score_joueur2);
			std::cout<<"score Joueur 2 : "<<score_joueur2<<std::endl;
			if(score_joueur1 >=50){
				std::cout<<std::endl;
				std::cout<<"Bravo, le joueur 1 a gagné !"<<std::endl;
				continuer_ou_non = 0;
			}
			else if(score_joueur2 >=50){
				std::cout<<std::endl;
				std::cout<<"Bravo, le joueur 2 a gagné !"<<std::endl;
				continuer_ou_non = 0;
			}
			else{
				std::cout<<std::endl;
				std::cout<<"--------------------------------------"<<std::endl;
				std::cout<<std::endl;
				std::cout<<"Pour continuer à jouer, taper '1'"<<std::endl;
				std::cin>>continuer_ou_non;
				std::cout<<std::endl;
				std::cout<<"--------------------------------------"<<std::endl;
				std::cout<<std::endl;
			};
		}
		else{
			std::cout<<"Tour au Joueur : "<<std::endl;
			TourJoueur(score_joueur1);
			std::cout<<"score Joueur : "<<score_joueur1<<std::endl;
			std::cout<<std::endl;
			std::cout<<"Tour au Ordi : "<<std::endl;
			TourJoueur(score_joueur2);
			std::cout<<"score Joueur 2 : "<<score_joueur2<<std::endl;
			std::cout<<"score Joueur 2 : "<<score_joueur2<<std::endl;
			if(score_joueur1 >=50){
				std::cout<<std::endl;
				std::cout<<"Bravo, le joueur a gagné !"<<std::endl;
				continuer_ou_non = 0;
			}
			else if(score_joueur2 >=50){
				std::cout<<std::endl;
				std::cout<<"L'Ordi a gagné !"<<std::endl;
				continuer_ou_non = 0;
			}
			else{
				std::cout<<std::endl;
				std::cout<<"--------------------------------------"<<std::endl;
				std::cout<<std::endl;
				std::cout<<"Pour continuer à jouer, tapez '1'"<<std::endl;
				std::cin>>continuer_ou_non;
				std::cout<<std::endl;
				std::cout<<"--------------------------------------"<<std::endl;
				std::cout<<std::endl;
			}
		};
	};	
}





void PFC () {    //sous fonction qui sert à lancer le Pierre Feuille Ciseaux 1 joueur ou 2 joueurs en fonction du choix de l'utilisateur s'il choisi le Pierre Feuille Ciseaux
	std::string choix_jeu;
	int nb_joueurs;
	std::cout<<"Vous avez choisi le pierre feuille ciseaux ! A combien voulez vous jouer ?"<<std::endl;
	std::cout<<"Tapez 1 pour jouer à 1 joueur, ou 2 pour jouer à 2 joueurs"<<std::endl;
	std::cout<<""<<std::endl;
	std::cin>>nb_joueurs;
	if (nb_joueurs==1) {
		PFC_1J();
	}
	else {
		PFC_2J();
	}
	Rejouer("PFC");
}



void afficher_tab(int tab[],int n){   //début des sous programmes pour le Yam's
	std::cout<<std::endl;
	for(int i=0; i<n; i++){
		std::cout<<tab[i]<<" ";
	}
	std::cout<<std::endl;
}

// Explication règle
void rapell_regle(){
	std::string rapelle;
	std::cout<<"Voulez-vous un rappel des règles ? (si oui entrer oui)"<<std::endl;
	std::cin>>rapelle;
	
	if(rapelle == "oui"){
		std::cout<<std::endl;
		
		std::cout<<"L'objectif de ce jeu est tout simplement d'avoir plus de points que son adversaire à la fin des 10 tours."<<std::endl;
		std::cout<<"Chaque joueur joue tour à tour et dispose de 3 lancers de 5 dés et il peut choisir lesquels il garde et lesquels il relance."<<std::endl;
		std::cout<<"A chaque tour, le joueur doit obligatoirement inscrire son score dans une des cases de sa feuille de score. Et s'il ne peut pas, il doit en supprimer une et il sera marqué -1 dans cette case."<<std::endl;
		std::cout<<"Dans les case avec les chiffres il faut simplement mettre la somme de nombre du chiffre indiqué dans la case voulue"<<std::endl;
		
		std::cout<<std::endl;
		std::cout<<"Et pour les combinaisons :"<<std::endl;
		std::cout<<std::endl;
		std::cout<<" - La combinaison du Brelan : c'est la somme de 3 dés avec des faces identiques."<<std::endl;
		std::cout<<" - La combinaison du Carré : c'est la somme de 4 dés avec des faces identiques"<<std::endl;
		std::cout<<" - La combinaison du Full : 3 dés avec des faces identiques, et 2 autres dés avec des faces identiques (25 points)."<<std::endl;
		std::cout<<" - La combinaison de la Petite suite : 4 dés dont les chiffres des faces se suivent (20 points)."<<std::endl;
		std::cout<<" - La combinaison de la Grande suite : 5 dés dont les faces se précèdent (40 points)."<<std::endl;
		std::cout<<" - Et la combinaison du Yam's : lorsque tous les 5 dés présentent des faces identiques (50 points)."<<std::endl;
	};
	std::cout<<std::endl;
	std::cout<<"--------------------------------------------------------------"<<std::endl;
	std::cout<<std::endl;
}

// 	Faire le tableau
void sous_affichage_pour_la_grille(){
	std::cout<<"|_________|_____|_____|"<<std::endl;
	std::cout<<"|         |     |     |"<<std::endl;
}
std::string sqt(int nb){
	if(nb<10){
		return " |   ";
	}
	else if(nb<100 && nb>9){
		return " |  ";
	}
	else if(nb>=100){
		return " | ";
	}
	else if(nb<0){
		return " |  ";
	};
	return " ";
}
void afficher_la_grille(std::string Val_pour_la_grille[],int taille_tab_val_string,int tab_J1[],int tab_J2[],int n_J1_J2){
	int nb_char = 3;
	
	std::cout<<" _________ _____ _____ "<<std::endl;
	std::cout<<"|         |     |     |"<<std::endl;
	std::cout<<"| "<<Val_pour_la_grille[0]<<" |  "<<Val_pour_la_grille[1]<<" |  "<<Val_pour_la_grille[2]<<" |"<<std::endl;
	sous_affichage_pour_la_grille();
	
	for(int i=0; i<n_J1_J2; i++){
		std::cout<<"| "<<Val_pour_la_grille[nb_char]<<sqt(tab_J1[i])<<tab_J1[i]<<sqt(tab_J2[i])<<tab_J2[i]<<" |"<<std::endl;
		nb_char++;
		if(nb_char<18){
		sous_affichage_pour_la_grille();	
		}
		else{
		std::cout<<"|_________|_____|_____|"<<std::endl;	
		};
	};
}

// Initialisation
void init_valeur_de_la_tabl(std::string Val_pour_la_grille[],int n){
	Val_pour_la_grille[0] = "xxxxxxx";
	Val_pour_la_grille[1] = "J1";
	Val_pour_la_grille[2] = "J2";
	Val_pour_la_grille[3] = "   1   ";	
	Val_pour_la_grille[4] = "   2   ";
	Val_pour_la_grille[5] = "   3   ";
	Val_pour_la_grille[6] = "   4   ";
	Val_pour_la_grille[7] = "   5   ";
	Val_pour_la_grille[8] = "   6   ";
	Val_pour_la_grille[9] = "Total 1";
	Val_pour_la_grille[10]= " Bonus ";
	Val_pour_la_grille[11]= " Brelan";
	Val_pour_la_grille[12]= " Carre ";
	Val_pour_la_grille[13]= "  Full ";
	Val_pour_la_grille[14]= "P Suite";
	Val_pour_la_grille[15]= "G Suite";
	Val_pour_la_grille[16]= "  Yams ";
	Val_pour_la_grille[17]= "Total F";
	
}
void init_tab_int(int tab[],int n){
	for(int i=0; i<n; i++){
		tab[i] = 0;
	};
}

// Faire un tour
void lancer_de_des(int des[], int des_a_lancer[], int n){
	
	for(int i=0; i<n; i++){
		if(des_a_lancer[i] == 0){
			des[i] = rand() % 6 + 1;
		};
	};
	for(int i=0; i<n; i++){
		std::cout<<"dé "<<i+1<<" : "<<des[i]<<std::endl;
	};	
}
void quels_des_sont_a_garder(int des[],int des_a_lancer[], int n,int & score){
	std::string garder_ou_pas;
	score = 0;
	
	init_tab_int(des_a_lancer,n);

	for(int i=0; i<n; i++){
		
		std::cout<<"Voulez-vous garder le dé "<<i+1<<" ? (entrez oui ou non)"<<std::endl;
		std::cin>>garder_ou_pas;
				
		if(garder_ou_pas == "oui"){
			des_a_lancer[i] = 1;
			score++;
		}
		else{
			des_a_lancer[i] = 0;
		};
	};

}
void tour(int des[],int des_a_lancer[],int n){
	int lancer = 0;
	int score = 0;
	
	std::cout<<"Pour commencer à lancer les dés, entrez 1"<<std::endl;
	std::cin>>lancer;
	std::cout<<std::endl;
	while (lancer!=1){
		std::cout<<"Pour commencer à lancer les dés, entrez 1"<<std::endl;
		std::cin>>lancer;
		std::cout<<std::endl;
	};
	
	init_tab_int(des_a_lancer,n);
	for(int i=0; i<3; i++){
		if(score != 5){
			lancer_de_des(des,des_a_lancer,n);
			std::cout<<std::endl;
			if(i != 2){
				quels_des_sont_a_garder(des,des_a_lancer,n,score);			
				std::cout<<std::endl;
			};
		};
	};
}

//Partie comparaison
void nb_recur_dun_nb(int tab[],int n,int tab2[],int n2){
	init_tab_int(tab2,n2);
	
	for(int i=0; i<n; i++){
		switch(tab[i]){
			case 1 : tab2[0]++;break;
			case 2 : tab2[1]++;break;
			case 3 : tab2[2]++;break;
			case 4 : tab2[3]++;break;
			case 5 : tab2[4]++;break;
			case 6 : tab2[5]++;break;
		};
	};
}

int un(int tab[],int n){
	int score = 0;
	for(int i=0; i<n; i++){
		if(tab[i] == 1){
			score++;
		};
	};
	return score;
}
int deux(int tab[],int n){
		int score = 0;
	for(int i=0; i<n; i++){
		if(tab[i] == 2){
			score++;
		};
	};
	score = score*2;
	return score;
}
int trois(int tab[],int n){
		int score = 0;
	for(int i=0; i<n; i++){
		if(tab[i] == 3){
			score++;
		};
	};
	score = score*3;
	return score;
}
int quatre(int tab[],int n){
	int score = 0;
	for(int i=0; i<n; i++){
		if(tab[i] == 4){
			score++;
		};
	};
	score = score*4;
	return score;
}
int cinque(int tab[],int n){
		int score = 0;
	for(int i=0; i<n; i++){
		if(tab[i] == 5){
			score++;
		};
	};
	score = score*5;
	return score;
}
int six(int tab[],int n){
		int score = 0;
	for(int i=0; i<n; i++){
		if(tab[i] == 6){
			score++;
		};
	};
	score = score*6;
	return score;
}

int brelan(int tab[],int n){
	int n2 = 6;
	int nb[n2];
	int score = 0;
	
	nb_recur_dun_nb(tab,n,nb,n2);
	
	for(int i=0; i<n2; i++){
		if(nb[i] >= 3){
			score = (i+1)*3;
		};
	};
	return score;
}
int carre(int tab[],int n){
	int n2 = 6;
	int nb[n2];
	int score = 0;
	
	nb_recur_dun_nb(tab,n,nb,n2);
	
	for(int i=0; i<n2; i++){
		if(nb[i] >= 4){
			score = (i+1)*4;
		};
	};
	return score;
}
int full(int tab[],int n){
	int n2 = 6;
	int nb[n2];

	
	nb_recur_dun_nb(tab,n,nb,n2);
	
	for(int i=0; i<n2; i++){
		if(nb[i] == 3){
			for(int i2=0; i2<n2; i2++){
				if(i2 != i){
					if(nb[i2] == 2){
						return 25;
					};
				};
			};
		};
		if(nb[i] == 2){
			for(int i2=0; i2<n2; i2++){
				if(i2 != i){
					if(nb[i2] == 3){
						return 25;
					};
				};
			};
		};
		
	};
	return 0;
}
int petite_suite(int tab[],int n){
	int n2 = 6;
	int tab2[n2];
	int score = 0;
	
	init_tab_int(tab2,n2);
		
	for(int i=0; i<n; i++){
		switch(tab[i]){
			case 1 : tab2[0] = 1;break;
			case 2 : tab2[1] = 1;break;
			case 3 : tab2[2] = 1;break;
			case 4 : tab2[3] = 1;break;
			case 5 : tab2[4] = 1;break;
			case 6 : tab2[5] = 1;break;
		};
	};
	for(int i=0; i<n2; i++){
		if(tab2[i] == 1){score++;};
	};
	if(score >=4){
		return 30;
	}
	else{return 0;};
}
int grande_suite(int tab[],int n){
	int n2 = 6;
	int tab2[n2];
	int score = 0;
	
	init_tab_int(tab2,n2);
		
	for(int i=0; i<n; i++){
		switch(tab[i]){
			case 1 : tab2[0] = 1;break;
			case 2 : tab2[1] = 1;break;
			case 3 : tab2[2] = 1;break;
			case 4 : tab2[3] = 1;break;
			case 5 : tab2[4] = 1;break;
			case 6 : tab2[5] = 1;break;
		};
	};
	for(int i=0; i<n2; i++){
		if(tab2[i] == 1){score++;};
	};
	if(score ==5){
		return 40;
	}
	else{return 0;};
}
int Yams(int tab[],int n){
	int nb = tab[0];
	int score = 0;
	
	for(int i=0; i<n; i++){
		if(tab[i] == nb){score++;};
	};
	
	if(score == 5){
		std::cout<<"Vous avez fait un Yams !!!"<<std::endl;
		return 50;
	}
	else{return 0;};	
}



int Quelle_case_a_sup(int tab[],int n){
	std::string sup;
	int tu_doit_en_sup_une = 1;
		
	while(tu_doit_en_sup_une = 1){
		for(int i=1; i<n; i++){
			if(tab[i] == 0){
				std::cout<<"Veux-tu supprimer la case "<<i<<" ? (entrez oui ou non)"<<std::endl;
				std::cin>>sup;
				if(sup == "oui"){
					tab[i] = -1;
					return 0;
				};
			};
		};
		std::cout<<"Tu doit suprimer une valeur !"<<std::endl;
	};
	return 0;
}
int comparaison_general(int des[],int n,int tab[],int n2){
	std::string veut_ou_pas;

	if(un(des,n)>0 && tab[0] == 0){
		std::cout<<"Veux-tu mettre "<<un(des,n)<<" dans la case du un ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[0] = un(des,n);
			return 1;
		};	
	};
	if(deux(des,n)>0 && tab[1] == 0){
		std::cout<<"Veux-tu mettre "<<deux(des,n)<<" dans la case du deux ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[1] = deux(des,n);	
			return 1;
		};
	};
	if(trois(des,n)>0 && tab[2] == 0){
		std::cout<<"Veux-tu mettre "<<trois(des,n)<<" dans la case du trois ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[2] = trois(des,n);
			return 1;
		};	
	};
	if(quatre(des,n)>0 && tab[3] == 0){
		std::cout<<"Veux-tu mettre "<<quatre(des,n)<<" dans la case du quatre ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[3] = quatre(des,n);
			return 1;
		};	
	};
	if(cinque(des,n)>0 && tab[4] == 0){
		std::cout<<"Veux-tu mettre "<<cinque(des,n)<<" dans la case du cinque ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[4] = cinque(des,n);
			return 1;
		};	
	};
	if(six(des,n)>0 && tab[5] == 0){
		std::cout<<"Veux-tu mettre "<<six(des,n)<<" dans la case du six ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[5] = six(des,n);
			return 1;
		};	
	};
	
	if(brelan(des,n)>0 && tab[8] == 0){
		std::cout<<"Veux-tu mettre "<<brelan(des,n)<<" dans la case du brelan ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[8] = brelan(des,n);
			return 1;
		};	
	};
	if(carre(des,n)>0 && tab[9] == 0){
		std::cout<<"Veux-tu mettre "<<carre(des,n)<<" dans la case du carre ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[9] = carre(des,n);
			return 1;
		};	
	};
	if(full(des,n)>0 && tab[10] == 0){
		std::cout<<"Veux-tu mettre "<<full(des,n)<<" dans la case du full ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[10] = full(des,n);
			return 1;
		};	
	};
	if(petite_suite(des,n)>0 && tab[11] == 0){
		std::cout<<"Veux-tu mettre "<<petite_suite(des,n)<<" dans la case de la petite suite ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[11] = petite_suite(des,n);
			return 1;
		};	
	};
	if(grande_suite(des,n)>0 && tab[12] == 0){
		std::cout<<"Veux-tu mettre "<<grande_suite(des,n)<<" dans la case de la grande suite ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[12] = grande_suite(des,n);
			return 1;
		};	
	};
	if(Yams(des,n)>0 && tab[13] == 0){
		std::cout<<"Veux-tu mettre "<<Yams(des,n)<<" dans la case du Yams ? (entrez oui ou non)"<<std::endl;
		std::cin>>veut_ou_pas;
		if(veut_ou_pas == "oui"){
			tab[13] = Yams(des,n);
			return 1;
		};	
	};
	
	Quelle_case_a_sup(tab,n2);
	return 0;
}

// Partie résultat
int total(int tab[],int n){
	tab[6] = tab[0]+tab[1]+tab[2]+tab[3]+tab[4]+tab[5];
	
	if(tab[6] > 62){tab[7] = 35;};
	
	tab[14] = tab[6]+tab[7]+tab[8]+tab[9]+tab[10]+tab[11]+tab[12]+tab[13];
	
	return tab[14];	
}
void resulat(int tab_J1[],int tab_J2[],int n_J1_J2){
	int total_J1 = total(tab_J1,n_J1_J2);
	int total_J2 = total(tab_J2,n_J1_J2);
	
	if(total_J1 > total_J2){
		std::cout<<"Je joueur 1 gagne avec "<<total_J1<<" points, contre le joueur 2 qui a "<<total_J2<<" points"<<std::endl;
	}
	else if(total_J1 < total_J2) {
		std::cout<<"Je joueur 2 gagne avec "<<total_J2<<" points, contre le joueur 1 qui a "<<total_J1<<" points"<<std::endl;
	}
	else{
		std::cout<<"Egalité ! Les deux joueurs ont "<<total_J1<<" points"<<std::endl;
	};
	
	
}



void Yams(){   //programme principal pour le Yam's
	
	srand (time(NULL));
	
	//Liste pour le tableau
	int taille_tab_val_string = 18;
	std :: string Val_pour_la_grille[taille_tab_val_string];
	int n_J1_J2 = 15;
	int tab_J1[n_J1_J2];
	int tab_J2[n_J1_J2];
	
	//Variable pour faire les lancés
	int n = 5;
	int des[n] = {3,3,3,2,3};
	int des_a_lancer[n];
	
	init_valeur_de_la_tabl(Val_pour_la_grille,taille_tab_val_string);
	init_tab_int(tab_J1,n_J1_J2);
	init_tab_int(tab_J2,n_J1_J2);

	rapell_regle();

	for(int i=0; i<10; i++){	//La partie se finit après 10 tours pour chaque joueur
		std::cout<<"Tour "<<i+1<<"/10 du joueur 1"<<std::endl;
		std::cout<<std::endl;
		
		tour(des,des_a_lancer,n);
		std::cout<<std::endl;
		afficher_la_grille(Val_pour_la_grille,taille_tab_val_string,tab_J1,tab_J2,n_J1_J2);
		std::cout<<std::endl;
		comparaison_general(des,n,tab_J1,n_J1_J2);
		std::cout<<std::endl;
		
		std::cout<<"--------------------------------------------------------------"<<std::endl;
		
		std::cout<<std::endl;
		std::cout<<"Tour "<<i+1<<" du joueur 2"<<std::endl;
		std::cout<<std::endl;

		tour(des,des_a_lancer,n);
		std::cout<<std::endl;
		afficher_la_grille(Val_pour_la_grille,taille_tab_val_string,tab_J1,tab_J2,n_J1_J2);
		std::cout<<std::endl;
		comparaison_general(des,n,tab_J2,n_J1_J2);
		if(i != 9){
			std::cout<<"--------------------------------------------------------------"<<std::endl;
		};
	};
	resulat(tab_J1,tab_J2,n_J1_J2);
	afficher_la_grille(Val_pour_la_grille,taille_tab_val_string,tab_J1,tab_J2,n_J1_J2);
	std::cout<<"--------------------------------------------------------------"<<std::endl;
	Rejouer("yams");
}

//début sous fonctions pour le Pokémon
struct pokemon {     //structure des pokémons
		std::string nom;
		int Nombre_pv;
		int pvMax;
		std::string type;
		std::string faiblesse_type1;
		std::string faiblesse_type2;
		std::string resistance_type1;
		std::string resistance_type2;
		int Vitesse;
		std::string nom_atk1;
		int attaque1;
		std::string typeattaque1;
		int precision_atk1;
		std::string nom_atk2;
		int attaque2;
		std::string typeattaque2;
		int precision_atk2;
		std::string nom_atk3;
		int attaque3;
		std::string typeattaque3;
		int precision_atk3;
		std::string nom_atk4;
		int attaque4;
		std::string typeattaque4;
		int precision_atk4;
	};	
	
	
	
void alea (int & valPreci, int & valCrit) {        //créer une fonction aléatoire qui permettra de faire la précision des attaques et les coups critiques
	valPreci=(rand() % 100);
	valCrit=(rand() % 16);
}


//sous fonction pour les tours d'attaques
int attaqueP(pokemon liste[17],int pokA, int pokB, std::string attaquepok, float faiblesse, float resistance, float stab, int degatsReels, std::string nomAtta, int attaque, std::string typeattaque, int precision, std::string j, int valPreci, int valCrit, std::string typePoke) {
	typePoke = liste[pokA].type;
	if (attaquepok == liste[pokA].nom_atk1) {            //si le pokémon fait l'attaque 1
		nomAtta = liste[pokA].nom_atk1;
		attaque = liste[pokA].attaque1;
		typeattaque = liste[pokA].typeattaque1;
		precision = liste[pokA].precision_atk1;
	}
	else if (attaquepok == liste[pokA].nom_atk2) {       //si le pokémon fait l'attaque 2
		nomAtta = liste[pokA].nom_atk2;
		attaque = liste[pokA].attaque2;
		typeattaque = liste[pokA].typeattaque2;
		precision = liste[pokA].precision_atk2;
	}
	else if (attaquepok == liste[pokA].nom_atk3) {       //si le pokémon fait l'attaque 3
		nomAtta = liste[pokA].nom_atk3;
		attaque = liste[pokA].attaque3;
		typeattaque = liste[pokA].typeattaque3;
		precision = liste[pokA].precision_atk3;
	}
	else if (attaquepok == liste[pokA].nom_atk4) {       //si le pokémon fait l'attaque 4
		nomAtta = liste[pokA].nom_atk4;
		attaque = liste[pokA].attaque4;
		typeattaque = liste[pokA].typeattaque4;
		precision = liste[pokA].precision_atk4;
	}


	std::cout<<liste[pokA].nom<<" attaque "<<liste[pokB].nom<<" avec l'attaque "<<nomAtta<<std::endl;
	alea(valPreci, valCrit);
	if (valPreci<precision) {       //si l'attaque a touché le pokémon ennemi
		if (typeattaque == liste[pokB].faiblesse_type1 or typeattaque == liste[pokB].faiblesse_type2) {           //si c'est super efficace
		std::cout<<"C'est super efficace !"<<std::endl;
			if (typePoke == typeattaque) {                     //ajout du STAB (same type attack bonus)
				degatsReels = attaque*faiblesse*stab;
			}
			else {
				degatsReels = attaque*faiblesse;
			}
		}
		else if (typeattaque == liste[pokB].resistance_type1 or typeattaque == liste[pokB].resistance_type2) {     //si c'est résistant
			std::cout<<"Ce n'est pas très efficace !"<<std::endl;
			if (typePoke == typeattaque) {    //STAB
				degatsReels = attaque*resistance*stab;
			}
			else {
				degatsReels = attaque*resistance; 
			}
		}
		else {                                //si il n'y a pas d'effet particulier
			if (typePoke == typeattaque) {    //STAB                            
				degatsReels = attaque*stab;
			}
			else {
				degatsReels = attaque; 
			}
		}
		if (valCrit == 15) {       //ajout des coups critiques
			degatsReels = degatsReels*1.2;
			std::cout<<"Coup critique !"<<std::endl;
		}
		else if ((valCrit < 12) && (valCrit > 8)) {   //version simplifiée des low roll et high roll (petit pourcentage des dégats enlevés ou rajoutés pour ne pas qu'une attaque fasse systématiquement les mêmes dégats)
			degatsReels = degatsReels - 1;
		}
		else if ((valCrit <= 8) && (valCrit > 5 )) {
			degatsReels = degatsReels - 3;
		}
		else if ((valCrit <= 5) && (valCrit > 2 )) {
			degatsReels = degatsReels - 5;
		}
		else if (valCrit <= 2) {
			degatsReels = degatsReels - 10;
		}
			
		if (nomAtta == "rapace") {
			std::cout<<"Etouraptor se blesse avec le contrecoup ! Il passe de "<<liste[pokA].Nombre_pv<<" à "<<liste[pokA].Nombre_pv-(degatsReels/2)<<" pv !"<<std::endl;
			liste[pokA].Nombre_pv = liste[pokA].Nombre_pv-(degatsReels/2);
		}
		liste[pokB].Nombre_pv = liste[pokB].Nombre_pv - degatsReels;
		std::cout<<liste[pokA].nom<<" inflige "<<degatsReels<<" de dégats "<<std::endl;          //partie affichage pour les utilisateurs
		if (liste[pokB].Nombre_pv > 0) {
			std::cout<<"Il reste "<<liste[pokB].Nombre_pv<<" pv à "<< liste[pokB].nom<<std::endl;
		}
		else {
			std::cout<<"Il reste 0 pv à "<< liste[pokB].nom<<std::endl;
			std::cout<<liste[pokB].nom<<" a été mis KO !"<<std::endl;
			liste[pokB].Nombre_pv=0;
			std::cout<<""<<std::endl;
		}
		std::cout<<""<<std::endl;
		std::cout<<"----------------------------------"<<std::endl;
		std::cout<<""<<std::endl;	
	}
	else {  //si l'attaque a raté
		std::cout<<liste[pokB].nom<<" a évité l'attaque !"<<std::endl;
		std::cout<<""<<std::endl;
	}
	return 0;
}

int sac (pokemon liste[17],int & nb_potion, int & nb_super_potion, int pokA) {  //sous fonction pour créer et utiliser le sac à dos (se soigner)
	std::string soin;
	std::cout<<"Quel objet souhaitez vous utilisez ?"<<std::endl;
	if ((nb_potion > 0) && (nb_super_potion > 0)) {
		std::cout<<"potion (quantité restante : "<<nb_potion<<" ) ou super_potion (quantité restante : "<<nb_super_potion<<" )"<<std::endl;
		std::cin>>soin;
		while ((soin != "potion") && (soin != "super_potion")) {
			std::cout<<"Veuillez choisir un objet présent dans le sac à dos"<<std::endl;
			std::cin>>soin;
		}
		if (soin == "super_potion") {
			if (liste[pokA].Nombre_pv < liste[pokA].pvMax-100) {
				std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<"pv à "<<liste[pokA].Nombre_pv+100<<"pv gràce à la super_potion !"<<std::endl;
				liste[pokA].Nombre_pv = liste[pokA].Nombre_pv + 100;
			}
			else {
				std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<"pv à "<<liste[pokA].pvMax<<"pv gràce à la super_potion !"<<std::endl;
				liste[pokA].Nombre_pv = liste[pokA].pvMax;
			}
			nb_super_potion--;
		}
		else if (soin == "potion") {
			if (liste[pokA].Nombre_pv < liste[pokA].pvMax-50) {
				std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<" à "<<liste[pokA].Nombre_pv+50<<" gràce à la potion !"<<std::endl;
				liste[pokA].Nombre_pv = liste[pokA].Nombre_pv + 50;
			}
			else {
				std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<" à "<<liste[pokA].pvMax<<" gràce à la potion !"<<std::endl;
				liste[pokA].Nombre_pv = liste[pokA].pvMax;
			}
			nb_potion--;
		}
	}
	else if ((nb_potion > 0) && (nb_super_potion == 0)) {
		std::cout<<"potion (quantité restante : "<<nb_potion<<" )"<<std::endl;
		std::cin>>soin;
		while (soin != "potion") {
			std::cout<<"Veuillez choisir un objet présent dans le sac à dos"<<std::endl;
			std::cin>>soin;
		}
		if (liste[pokA].Nombre_pv < liste[pokA].pvMax-50) {
			std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<" à "<<liste[pokA].Nombre_pv+50<<" gràce à la potion !"<<std::endl;
			liste[pokA].Nombre_pv = liste[pokA].Nombre_pv + 50;
		}
		else {
			std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<" à "<<liste[pokA].pvMax<<" gràce à la potion !"<<std::endl;
			liste[pokA].Nombre_pv = liste[pokA].pvMax;
		}
		nb_potion--;
	}
	else if ((nb_super_potion > 0) && (nb_potion == 0)) {
		std::cout<<"super_potion (quantité restante : "<<nb_super_potion<<" )"<<std::endl;
		std::cin>>soin;
		while (soin != "super_potion") {
			std::cout<<"Veuillez choisir un objet présent dans le sac à dos"<<std::endl;
			std::cin>>soin;
		}
		if (liste[pokA].Nombre_pv < liste[pokA].pvMax-100) {
			std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<"pv à "<<liste[pokA].Nombre_pv+100<<"pv gràce à la super_potion !"<<std::endl;
			liste[pokA].Nombre_pv = liste[pokA].Nombre_pv + 100;
		}
		else {
			std::cout<<liste[pokA].nom<<" passe de "<<liste[pokA].Nombre_pv<<"pv à "<<liste[pokA].pvMax<<"pv gràce à la super_potion !"<<std::endl;
			liste[pokA].Nombre_pv = liste[pokA].pvMax;
		}
		nb_super_potion--;
	}
	return 0;
}

void ChoisirPokemon_j1(int c, pokemon liste[17], std::string j, int pokj1[], int & pokA) {  //sous fonction pour choisir un nouveau pokémon avec le joueur 1
	std::cout<<j<<" : Choisissez le numéro du pokémon que vous souhaitez envoyer"<<std::endl;
		std::cout<<"1 : "<<liste[pokj1[0]].nom<<", pv restant : "<<liste[pokj1[0]].Nombre_pv<<std::endl;
		std::cout<<"2 : "<<liste[pokj1[1]].nom<<", pv restant : "<<liste[pokj1[1]].Nombre_pv<<std::endl;
		std::cout<<"3 : "<<liste[pokj1[2]].nom<<", pv restant : "<<liste[pokj1[2]].Nombre_pv<<std::endl;
		std::cout<<"4 : "<<liste[pokj1[3]].nom<<", pv restant : "<<liste[pokj1[3]].Nombre_pv<<std::endl;
		std::cin>>c;
	while ((c < 1) || (c > 4)) {
		std::cout<<"Entrez un nombre cohérent"<<std::endl;
		std::cin>>c;
	}
	pokA=pokj1[c-1];
}

void ChoisirPokemon_j2(int c, pokemon liste[17], std::string j, int pokj2[], int & pokA) {  //sous fonction pour choisir un nouveau pokémon avec le joueur 2
	std::cout<<j<<" : Choisissez le numéro du pokémon que vous souhaitez envoyer"<<std::endl;
		std::cout<<"1 : "<<liste[pokj2[0]].nom<<", pv restant : "<<liste[pokj2[0]].Nombre_pv<<std::endl;
		std::cout<<"2 : "<<liste[pokj2[1]].nom<<", pv restant : "<<liste[pokj2[1]].Nombre_pv<<std::endl;
		std::cout<<"3 : "<<liste[pokj2[2]].nom<<", pv restant : "<<liste[pokj2[2]].Nombre_pv<<std::endl;
		std::cout<<"4 : "<<liste[pokj2[3]].nom<<", pv restant : "<<liste[pokj2[3]].Nombre_pv<<std::endl;
		std::cin>>c;
	while ((c < 1) || (c > 4)) {
		std::cout<<"Entrez un nombre cohérent"<<std::endl;
		std::cin>>c;
	}
	pokA=pokj2[c-1];
}



void Pokemon() {      //sous programme principal pour le jeu de pokémon
	
	srand(time(NULL));
	
	//création des pokémons
	
	std::string tableau[17];
	tableau [0] = "Dracaufeu";
	tableau [1] = "Tortank";
	tableau [2] = "Florizarre";
	tableau [3] = "Togekiss";
	tableau [4] = "Tranchodon";
	tableau [5] = "Darkrai";
	tableau [6] = "Metalosse";
	tableau [7] = "Brutapode";
	tableau [8] = "Crocorible";
	tableau [9] = "Maraiste";
	tableau [10] = "Gigalithe";
	tableau [11] = "Lucario";
	tableau [12] = "Ohmassacre";
	tableau [13] = "Kyurem";
	tableau [14] = "Etouraptor";
	tableau [15] = "Ectoplasma";
	tableau [16] = "Bruyverne";
	
	

	pokemon liste[17];

	liste[0].nom= "Dracaufeu";
	liste[0].Nombre_pv = 180;
	liste[0].pvMax = 180;
	liste[0].type= "feu";
	liste[0].faiblesse_type1= "eau";
	liste[0].faiblesse_type2= "sol";
	liste[0].resistance_type1="plante";
	liste[0].resistance_type2="acier";
	liste[0].Vitesse = 101;
	liste[0].nom_atk1 = "aéropique";
	liste[0].attaque1 = 35;
	liste[0].typeattaque1 ="vol";
	liste[0].precision_atk1 = 100;
	liste[0].nom_atk2 = "déflagration";
	liste[0].attaque2 = 45;
	liste[0].typeattaque2 ="feu";
	liste[0].precision_atk2 = 85;
	liste[0].nom_atk3 = "lanceflamme";
	liste[0].attaque3 = 37;
	liste[0].typeattaque3 ="feu";
	liste[0].precision_atk3 = 100;
	liste[0].nom_atk4 = "draco-choc";
	liste[0].attaque4 = 35;
	liste[0].typeattaque4 ="dragon";
	liste[0].precision_atk4 = 100;

	liste[1].nom= "Tortank";
	liste[1].Nombre_pv = 181;
	liste[1].pvMax = 181;
	liste[1].type= "eau";
	liste[1].faiblesse_type1= "plante";
	liste[1].faiblesse_type2= "électrik";
	liste[1].resistance_type1="feu";
	liste[1].resistance_type2="acier";
	liste[1].Vitesse = 78;
	liste[1].nom_atk1 = "piétisol";
	liste[1].attaque1 = 32;
	liste[1].typeattaque1 ="sol";
	liste[1].precision_atk1 = 100;
	liste[1].nom_atk2 = "hydrocanon";
	liste[1].attaque2 = 45;
	liste[1].typeattaque2 ="eau";
	liste[1].precision_atk2 = 80;
	liste[1].nom_atk3 = "blizzard";
	liste[1].attaque3 = 45;
	liste[1].typeattaque3 ="glace";
	liste[1].precision_atk3 = 70;
	liste[1].nom_atk4 = "casse-brique";
	liste[1].attaque4 = 35;
	liste[1].typeattaque4 ="combat";
	liste[1].precision_atk4 = 100;
	
	liste[2].nom= "Florizarre";
	liste[2].Nombre_pv = 185;
	liste[2].pvMax = 185;
	liste[2].type= "plante";
	liste[2].faiblesse_type1= "feu";
	liste[2].faiblesse_type2= "poison";
	liste[2].resistance_type1="eau";
	liste[2].resistance_type2="sol";
	liste[2].Vitesse = 79;
	liste[2].nom_atk1 = "bombe_beurk";
	liste[2].attaque1 = 37;
	liste[2].typeattaque1 ="poison";
	liste[2].precision_atk1 = 100;
	liste[2].nom_atk2 = "écosphère";
	liste[2].attaque2 = 35;
	liste[2].typeattaque2 ="plante";
	liste[2].precision_atk2 = 100;
	liste[2].nom_atk3 = "tempête_florale";
	liste[2].attaque3 = 37;
	liste[2].typeattaque3 ="plante";
	liste[2].precision_atk3 = 100;
	liste[2].nom_atk4 = "force";
	liste[2].attaque4 = 32;
	liste[2].typeattaque4 ="normal";
	liste[2].precision_atk4 = 100;
	
	liste[3].nom= "Togekiss";
	liste[3].Nombre_pv = 187;
	liste[3].pvMax = 187;
	liste[3].type= "fée";
	liste[3].faiblesse_type1= "acier";
	liste[3].faiblesse_type2= "poison";
	liste[3].resistance_type1="ténèbre";
	liste[3].resistance_type2="dragon";
	liste[3].Vitesse = 80;
	liste[3].nom_atk1 = "éclat_magique";
	liste[3].attaque1 = 37;
	liste[3].precision_atk1 = 100;
	liste[3].typeattaque1 ="fée";
	liste[3].nom_atk2 = "lanceflamme";
	liste[3].attaque2 = 37;
	liste[3].typeattaque2 ="feu";
	liste[3].precision_atk2 = 100;
	liste[3].nom_atk3 = "calinerie";
	liste[3].attaque3 = 42;
	liste[3].typeattaque3 ="fée";
	liste[3].precision_atk3 = 90;
	liste[3].nom_atk4 = "aéropique";
	liste[3].attaque4 = 35;
	liste[3].typeattaque4 ="vol";
	liste[3].precision_atk4 = 100;
	
	liste[4].nom= "Tranchodon";
	liste[4].Nombre_pv = 179;
	liste[4].pvMax = 179;
	liste[4].type= "dragon";
	liste[4].faiblesse_type1= "fée";
	liste[4].faiblesse_type2= "dragon";
	liste[4].resistance_type1="eau";
	liste[4].resistance_type2="plante";
	liste[4].Vitesse = 97;
	liste[4].nom_atk1 = "draco-griffe";
	liste[4].attaque1 = 30;
	liste[4].typeattaque1 ="dragon";
	liste[4].precision_atk1 = 100;
	liste[4].nom_atk2 = "colère";
	liste[4].attaque2 = 48;
	liste[4].typeattaque2 ="dragon";
	liste[4].precision_atk2 = 85;
	liste[4].nom_atk3 = "machouille";
	liste[4].attaque3 = 33;
	liste[4].typeattaque3 ="ténèbre";
	liste[4].precision_atk3 = 100;
	liste[4].nom_atk4 = "plaie_croix";
	liste[4].attaque4 = 33;
	liste[4].typeattaque4 ="insecte";
	liste[4].precision_atk4 = 100;
	
	liste[5].nom= "Darkrai";
	liste[5].Nombre_pv = 172;
	liste[5].pvMax = 172;
	liste[5].type= "ténèbre";
	liste[5].faiblesse_type1= "fée";
	liste[5].faiblesse_type2= "insecte";
	liste[5].resistance_type1="ténèbre";
	liste[5].resistance_type2="spectre";
	liste[5].Vitesse = 125;
	liste[5].nom_atk1 = "vibrobscur";
	liste[5].attaque1 = 38;
	liste[5].typeattaque1 ="ténèbre";
	liste[5].precision_atk1 = 100;
	liste[5].nom_atk2 = "tranche_nuit";
	liste[5].attaque2 = 30;
	liste[5].typeattaque2 ="ténèbre";
	liste[5].precision_atk2 = 100;
	liste[5].nom_atk3 = "ball'ombre";
	liste[5].attaque3 = 35;
	liste[5].typeattaque3 ="spectre";
	liste[5].precision_atk3 = 100;
	liste[5].nom_atk4 = "psyko";
	liste[5].attaque4 = 35;
	liste[5].typeattaque4 ="psy";
	liste[5].precision_atk4 = 100;

	liste[6].nom= "Metalosse";
	liste[6].Nombre_pv = 182;
	liste[6].pvMax = 182;
	liste[6].type= "acier";
	liste[6].faiblesse_type1= "feu";
	liste[6].faiblesse_type2= "sol";
	liste[6].resistance_type1="dragon";
	liste[6].resistance_type2="fée";
	liste[6].Vitesse = 70;
	liste[6].nom_atk1 = "luminocanon";
	liste[6].attaque1 = 32;
	liste[6].typeattaque1 ="acier";
	liste[6].precision_atk1 = 100;
	liste[6].nom_atk2 = "point_météor";
	liste[6].attaque2 = 35;
	liste[6].typeattaque2 ="acier";
	liste[6].precision_atk2 = 90;
	liste[6].nom_atk3 = "marto-poing";
	liste[6].attaque3 = 43;
	liste[6].typeattaque3 ="combat";
	liste[6].precision_atk3 = 90;
	liste[6].nom_atk4 = "éboulement";
	liste[6].attaque4 = 32;
	liste[6].typeattaque4 ="roche";
	liste[6].precision_atk4 = 90;
	
	liste[7].nom= "Brutapode";
	liste[7].Nombre_pv = 172;
	liste[7].pvMax = 172;
	liste[7].type= "poison";
	liste[7].faiblesse_type1= "sol";
	liste[7].faiblesse_type2= "psy";
	liste[7].resistance_type1="fée";
	liste[7].resistance_type2="plante";
	liste[7].Vitesse = 112;
	liste[7].nom_atk1 = "direct_toxik";
	liste[7].attaque1 = 40;
	liste[7].typeattaque1 ="poison";
	liste[7].precision_atk1 = 100;
	liste[7].nom_atk2 = "mégacorne";
	liste[7].attaque2 = 45;
	liste[7].typeattaque2 ="insecte";
	liste[7].precision_atk2 = 85;
	liste[7].nom_atk3 = "métalliroue";
	liste[7].attaque3 = 52;
	liste[7].typeattaque3 ="acier";
	liste[7].precision_atk3 = 75;
	liste[7].nom_atk4 = "bombe beurk";
	liste[7].attaque4 = 37;
	liste[7].typeattaque4 ="poison";
	liste[7].precision_atk4 = 100;
	
	liste[8].nom= "Crocorible";
	liste[8].Nombre_pv = 197;
	liste[8].pvMax = 197;
	liste[8].type= "sol";
	liste[8].faiblesse_type1= "plante";
	liste[8].faiblesse_type2= "eau";
	liste[8].resistance_type1="poison";
	liste[8].resistance_type2="glace";
	liste[8].Vitesse = 92;
	liste[8].nom_atk1 = "machouille";
	liste[8].attaque1 = 33;
	liste[8].typeattaque1 ="ténèbre";
	liste[8].precision_atk1 = 100;
	liste[8].nom_atk2 = "cavalerie_lourde";
	liste[8].attaque2 = 45;
	liste[8].typeattaque2 ="sol";
	liste[8].precision_atk2 = 95;
	liste[8].nom_atk3 = "séisme";
	liste[8].attaque3 = 43;
	liste[8].typeattaque3 ="sol";
	liste[8].precision_atk3 = 100;
	liste[8].nom_atk4 = "lame_de_roc";
	liste[8].attaque4 = 43;
	liste[8].typeattaque4 = "roche";
	liste[8].precision_atk4 = 80;

	liste[9].nom= "Maraiste";
	liste[9].Nombre_pv = 164;
	liste[9].pvMax = 164;
	liste[9].type= "eau";
	liste[9].faiblesse_type1= "plante";
	liste[9].faiblesse_type2= "électrik";
	liste[9].resistance_type1="feu";
	liste[9].resistance_type2="acier";
	liste[9].Vitesse = 35;
	liste[9].nom_atk1 = "aqua-brèche";
	liste[9].attaque1 = 33;
	liste[9].typeattaque1 ="eau";
	liste[9].precision_atk1 = 100;
	liste[9].nom_atk2 = "casse-brique";
	liste[9].attaque2 = 33;
	liste[9].typeattaque2 ="combat";
	liste[9].precision_atk2 = 100;
	liste[9].nom_atk3 = "séisme";
	liste[9].attaque3 = 43;
	liste[9].typeattaque3 ="sol";
	liste[9].precision_atk3 = 100;
	liste[9].nom_atk4 = "lame_de_roc";
	liste[9].attaque4 = 43;
	liste[9].typeattaque4 = "roche";
	liste[9].precision_atk4 = 80;
	
	liste[10].nom= "Gigalithe";
	liste[10].Nombre_pv = 187;
	liste[10].pvMax = 187;
	liste[10].type= "roche";
	liste[10].faiblesse_type1= "combat";
	liste[10].faiblesse_type2= "sol";
	liste[10].resistance_type1="vol";
	liste[10].resistance_type2="feu";
	liste[10].Vitesse = 25;
	liste[10].nom_atk1 = "luminocanon";
	liste[10].attaque1 = 32;
	liste[10].typeattaque1 ="acier";
	liste[10].precision_atk1 = 100;
	liste[10].nom_atk2 = "telluriforce";
	liste[10].attaque2 = 37;
	liste[10].typeattaque2 ="sol";
	liste[10].precision_atk2 = 100;
	liste[10].nom_atk3 = "rayon_gemme";
	liste[10].attaque3 = 33;
	liste[10].typeattaque3 ="roche";
	liste[10].precision_atk3 = 100;
	liste[10].nom_atk4 = "lame_de_roc";
	liste[10].attaque4 = 43;
	liste[10].typeattaque4 = "roche";
	liste[10].precision_atk4 = 80;
	
	liste[11].nom= "Lucario";
	liste[11].Nombre_pv = 197;
	liste[11].pvMax = 197;
	liste[11].type= "combat";
	liste[11].faiblesse_type1= "psy";
	liste[11].faiblesse_type2= "vol";
	liste[11].resistance_type1="roche";
	liste[11].resistance_type2="ténèbre";
	liste[11].Vitesse = 93;
	liste[11].nom_atk1 = "aurasphère";
	liste[11].attaque1 = 33;
	liste[11].typeattaque1 ="combat";
	liste[11].precision_atk1 = 100;
	liste[11].nom_atk2 = "close_combat";
	liste[11].attaque2 = 47;
	liste[11].typeattaque2 ="combat";
	liste[11].precision_atk2 = 75;
	liste[11].nom_atk3 = "draco-choc";
	liste[11].attaque3 = 35;
	liste[11].typeattaque3 ="dragon";
	liste[11].precision_atk3 = 100;
	liste[11].nom_atk4 = "plaquage";
	liste[11].attaque4 = 35;
	liste[11].typeattaque4 = "normal";
	liste[11].precision_atk4 = 100;
	
	liste[12].nom= "Ohmassacre";
	liste[12].Nombre_pv = 187;
	liste[12].pvMax = 187;
	liste[12].type= "électrik";
	liste[12].faiblesse_type1= "sol";
	liste[12].faiblesse_type2= "";
	liste[12].resistance_type1="acier";
	liste[12].resistance_type2="vol";
	liste[12].Vitesse = 50;
	liste[12].nom_atk1 = "élecanon";
	liste[12].attaque1 = 52;
	liste[12].typeattaque1 ="électrik";
	liste[12].precision_atk1 = 50;
	liste[12].nom_atk2 = "tonnerre";
	liste[12].attaque2 = 37;
	liste[12].typeattaque2 ="électrik";
	liste[12].precision_atk2 = 100;
	liste[12].nom_atk3 = "machouille";
	liste[12].attaque3 = 33;
	liste[12].typeattaque3 ="ténèbre";
	liste[12].precision_atk3 = 100;
	liste[12].nom_atk4 = "colère";
	liste[12].attaque4 = 48;
	liste[12].typeattaque4 = "dragon";
	liste[12].precision_atk4 = 85;
	
	// pokémon glace
	liste[13].nom= "Kyurem";
	liste[13].Nombre_pv = 194;
	liste[13].pvMax = 194;
	liste[13].type= "glace";
	liste[13].faiblesse_type1= "feu";
	liste[13].faiblesse_type2= "combat";
	liste[13].resistance_type1="glace";
	liste[13].resistance_type2="";
	liste[13].Vitesse = 95;
	liste[13].nom_atk1 = "blizzard";
	liste[13].attaque1 = 45;
	liste[13].typeattaque1 ="glace";
	liste[13].precision_atk1 = 70;
	liste[13].nom_atk2 = "laser_glace";
	liste[13].attaque2 = 37;
	liste[13].typeattaque2 ="glace";
	liste[13].precision_atk2 = 100;
	liste[13].nom_atk3 = "draco-choc";
	liste[13].attaque3 = 35;
	liste[13].typeattaque3 ="dragon";
	liste[13].precision_atk3 = 100;
	liste[13].nom_atk4 = "double_volée";
	liste[13].attaque4 = 33;
	liste[13].typeattaque4 = "vol";
	liste[13].precision_atk4 = 90;
	
	// pokémon vol
	liste[14].nom= "Etouraptor";
	liste[14].Nombre_pv = 187;
	liste[14].pvMax = 187;
	liste[14].type= "vol";
	liste[14].faiblesse_type1= "électrik";
	liste[14].faiblesse_type2= "glace";
	liste[14].resistance_type1="combat";
	liste[14].resistance_type2="glace";
	liste[14].Vitesse = 100;
	liste[14].nom_atk1 = "aéropique";
	liste[14].attaque1 = 35;
	liste[14].typeattaque1 ="vol";
	liste[14].precision_atk1 = 100;
	liste[14].nom_atk2 = "lame_d'air";
	liste[14].attaque2 = 37;
	liste[14].typeattaque2 ="vol";
	liste[14].precision_atk2 = 95;
	liste[14].nom_atk3 = "close_combat";
	liste[14].attaque3 = 47;
	liste[14].typeattaque3 ="combat";
	liste[14].precision_atk3 = 75;
	liste[14].nom_atk4 = "rapace";
	liste[14].attaque4 = 47;
	liste[14].typeattaque4 = "vol";
	liste[14].precision_atk4 = 100;
	
	// pokémon spectre
	liste[15].nom= "Ectoplasma";
	liste[15].Nombre_pv = 162;
	liste[15].pvMax = 162;
	liste[15].type= "spectre";
	liste[15].faiblesse_type1= "spectre";
	liste[15].faiblesse_type2= "ténèbre";
	liste[15].resistance_type1="poison";
	liste[15].resistance_type2="insecte";
	liste[15].Vitesse = 110;
	liste[15].nom_atk1 = "ball'ombre";
	liste[15].attaque1 = 38;
	liste[15].typeattaque1 ="spectre";
	liste[15].precision_atk1 = 100;
	liste[15].nom_atk2 = "vibrobscur";
	liste[15].attaque2 = 38;
	liste[15].typeattaque2 ="ténèbre";
	liste[15].precision_atk2 = 100;
	liste[15].nom_atk3 = "éclat_magique";
	liste[15].attaque3 = 38;
	liste[15].typeattaque3 ="fée";
	liste[15].precision_atk3 = 100;
	liste[15].nom_atk4 = "psyko";
	liste[15].attaque4 = 36;
	liste[15].typeattaque4 = "psy";
	liste[15].precision_atk4 = 100;
	
	
	liste[16].nom= "Bruyverne";
	liste[16].Nombre_pv = 187;
	liste[16].pvMax = 187;
	liste[16].type= "dragon";
	liste[16].faiblesse_type1= "fée";
	liste[16].faiblesse_type2= "dragon";
	liste[16].resistance_type1="eau";
	liste[16].resistance_type2="plante";
	liste[16].Vitesse = 123;
	liste[16].nom_atk1 = "colère";
	liste[16].attaque1 = 48;
	liste[16].typeattaque1 ="dragon";
	liste[16].precision_atk1 = 85;
	liste[16].nom_atk2 = "bombe_beurk";
	liste[16].attaque2 = 37;
	liste[16].typeattaque2 ="poison";
	liste[16].precision_atk2 = 100;
	liste[16].nom_atk3 = "draco-choc";
	liste[16].attaque3 = 35;
	liste[16].typeattaque3 ="dragon";
	liste[16].precision_atk3 = 100;
	liste[16].nom_atk4 = "lame_d'air";
	liste[16].attaque4 = 37;
	liste[16].typeattaque4 = "vol";
	liste[16].precision_atk4 = 95;

	
	int valPreci;    //création de la plupart des variables          
	int valCrit;
	std::string cpokemon1;
	std::string cpokemon2;
	std::string pokmaj;
	std::string j1;
	std::string j2;
	int pok1;
	int pok2;
	int nb_potion_j1 = 2;
	int nb_potion_j2 = 2;
	int nb_super_potion_j1 = 1;
	int nb_super_potion_j2 = 1;
	int pokj1 [4];
	int pokj2 [4];
	std::string attaquepok1;
	std::string attaquepok2;
	float faiblesse;
	faiblesse = 1.5;
	float resistance;
	resistance = 0.5;
	float stab;
	stab = 1.25;
	int degatsReels;
	std::string nomAtta;
	int attaque;
	std::string typeattaque;
	int precision;
	std::string typePoke;
	std::string action_j1;
	std::string action_j2;
	int c1,c2;
	
	
	
	std::cout<<"Joueur 1 choisissez votre pseudo : ";    //choisir son pseudo et son pokémon
	std::cin>>j1;
	std::cout<<"Joueur 2 choisissez votre pseudo : ";
	std::cin>>j2;
	std::cout<<""<<std::endl;
	std::cout<<"----------------------------------"<<std::endl;
	std::cout<<""<<std::endl;
	std::cout<<j1<<" Choisissez vos 4 pokemons pour le duel parmi : "<<std::endl;
	std::cout<<" "<<std::endl;
	for (int i=0; i<=16; i++) {	
		std::cout<<tableau[i]<<" : type "<<liste[i].type<<", "<<liste[i].Nombre_pv<<" pv"<<std::endl;
	}
	std::cout<<" "<<std::endl;
	for (int i=0; i<4; i++) {
		std::cin>>cpokemon1;
		while (cpokemon1 != "Dracaufeu" && cpokemon1 != "dracaufeu" && cpokemon1 != "Tortank" && cpokemon1 != "tortank" && cpokemon1 != "Florizarre" && cpokemon1 != "florizarre" && cpokemon1 != "Togekiss" && cpokemon1 != "togekiss" && cpokemon1 != "Tranchodon" && cpokemon1 != "tranchodon" && cpokemon1 != "Darkrai" && cpokemon1 != "darkrai" && cpokemon1 != "Metalosse" && cpokemon1 != "metalosse" && cpokemon1 != "Brutapode" && cpokemon1 != "brutapode" && cpokemon1 != "Crocorible" && cpokemon1 != "crocorible" && cpokemon1 != "Maraiste" && cpokemon1 != "maraiste" && cpokemon1 != "Gigalithe" && cpokemon1 != "gigalithe" && cpokemon1 != "Lucario" && cpokemon1 != "lucario" && cpokemon1 != "Ohmassacre" && cpokemon1 != "ohmassacre" && cpokemon1 != "Kyurem" && cpokemon1 != "kyurem" && cpokemon1 != "Etouraptor" && cpokemon1 != "etouraptor" && cpokemon1 != "Ectoplasma" && cpokemon1 != "ectoplasma" && cpokemon1 != "Bruyverne" && cpokemon1 != "bruyverne") {
			std::cout<<j1<<" veuillez choisir un des pokemons de la liste"<<std::endl; 
			std::cin>>cpokemon1;
		}
		if(cpokemon1  == "Dracaufeu" or cpokemon1 == "dracaufeu"){
			pok1 = 0;
		}
		else if(cpokemon1 == "Tortank" or cpokemon1 == "tortank"){
			pok1 = 1;
		}
		else if(cpokemon1 == "Florizarre" or cpokemon1 == "florizarre"){
			pok1 = 2;
		}
		else if(cpokemon1 == "Togekiss" or cpokemon1 == "togekiss"){
			pok1 = 3;
		}
		else if(cpokemon1 == "Tranchodon" or cpokemon1 == "tranchodon"){
			pok1 = 4;
		}
		else if(cpokemon1 == "Darkrai" or cpokemon1 == "darkrai"){
			pok1 = 5;
		}
		else if(cpokemon1 == "Metalosse" or cpokemon1 == "metalosse"){
			pok1 = 6;
		}
		else if(cpokemon1 == "Brutapode" or cpokemon1 == "brutapode"){
			pok1 = 7;
		}
		else if(cpokemon1 == "Crocorible" or cpokemon1 == "crocorible"){
			pok1 = 8;
		}
		else if(cpokemon1 == "Maraiste" or cpokemon1 == "maraiste"){
			pok1 = 9;
		}
		else if(cpokemon1 == "Gigalithe" or cpokemon1 == "gigalithe"){
			pok1 = 10;
		}
		else if(cpokemon1 == "Lucario" or cpokemon1 == "lucario"){
			pok1 = 11;
		}
		else if(cpokemon1 == "Ohmassacre" or cpokemon1 == "ohmassacre"){
			pok1 = 12;
		}
		else if(cpokemon1 == "Kyurem" or cpokemon1 == "kyurem"){
			pok1 = 13;
		}
		else if(cpokemon1 == "Etouraptor" or cpokemon1 == "etouraptor"){
			pok1 = 14;
		}
		else if(cpokemon1 == "Ectoplasma" or cpokemon1 == "ectoplasma"){
			pok1 = 15;
		}
		else if(cpokemon1 == "Bruyverne" or cpokemon1 == "bruyverne"){
			pok1 = 16;
		}
		
		
		pokj1[i]=pok1;
	}
	
	
	std::system("clear");
	std::cout<<" "<<std::endl;
	std::cout<<j2<<" Choisissez vos 4 pokemons pour le duel parmi : "<<std::endl;   //pareil pour J2
	for (int i=0; i<=16; i++) {
		std::cout<<tableau[i]<<" : type "<<liste[i].type<<", "<<liste[i].Nombre_pv<<" pv"<<std::endl;
	}
	std::cout<<" "<<std::endl;
	int a = 0;
	while (a != 4) {
		std::cin>>cpokemon2;
		while (cpokemon2 != "Dracaufeu" && cpokemon2 != "dracaufeu" && cpokemon2 != "Tortank" && cpokemon2 != "tortank" && cpokemon2 != "Florizarre" && cpokemon2 != "florizarre" && cpokemon2 != "Togekiss" && cpokemon2 != "togekiss" && cpokemon2 != "Tranchodon" && cpokemon2 != "tranchodon" && cpokemon2 != "Darkrai" && cpokemon2 != "darkrai" && cpokemon2 != "Metalosse" && cpokemon2 != "metalosse" && cpokemon2 != "Brutapode" && cpokemon2 != "brutapode" && cpokemon2 != "Crocorible" && cpokemon2 != "crocorible" && cpokemon2 != "Maraiste" && cpokemon2 != "maraiste" && cpokemon2 != "Gigalithe" && cpokemon2 != "gigalithe" && cpokemon2 != "Lucario" && cpokemon2 != "lucario" && cpokemon2 != "Ohmassacre" && cpokemon2 != "ohmassacre" && cpokemon2 != "Kyurem" && cpokemon2 != "kyurem" && cpokemon2 != "Etouraptor" && cpokemon2 != "etouraptor" && cpokemon2 != "Ectoplasma" && cpokemon2 != "ectoplasma" && cpokemon2 != "Bruyverne" && cpokemon2 != "bruyverne") {
			std::cout<<j2<<" veuillez choisir un des pokemons de la liste"<<std::endl;
			std::cin>>cpokemon2;
		}

		for (int j = 0; j < cpokemon2.length(); j++){
			if (j == 0) {
				pokmaj += toupper(cpokemon2[0]);
			}
			else pokmaj += cpokemon2[j];
		}
		 if ((pokmaj != liste[pokj1[0]].nom) and (pokmaj != liste[pokj1[1]].nom) and (pokmaj != liste[pokj1[2]].nom) and (pokmaj != liste[pokj1[3]].nom )) {
			if(cpokemon2 =="Dracaufeu" or cpokemon2 =="dracaufeu"){
				pok2 = 0;
			}
			else if(cpokemon2 =="Tortank" or cpokemon2 =="tortank"){
				pok2 = 1;
			}
			else if(cpokemon2 =="Florizarre" or cpokemon2 =="florizarre"){
				pok2 = 2;
			}
			else if(cpokemon2 =="Togekiss" or cpokemon2 =="togekiss"){
				pok2 = 3;
			}
			else if(cpokemon2 =="Tranchodon" or cpokemon2 =="tranchodon"){
				pok2 = 4;
			}
			else if(cpokemon2 =="Darkrai" or cpokemon2 =="darkrai"){
				pok2 = 5;
			}
			else if(cpokemon2 =="Metalosse" or cpokemon2 =="metalosse"){
				pok2 = 6;
			}
			else if(cpokemon2 =="Brutapode" or cpokemon2 =="brutapode"){
				pok2 = 7;
			}
			else if(cpokemon2 =="Crocorible" or cpokemon2 =="crocorible"){
				pok2 = 8;
			}
			else if(cpokemon2 == "Maraiste" or cpokemon2 == "maraiste"){
				pok2 = 9;
			}
			else if(cpokemon2 == "Gigalithe" or cpokemon2 == "gigalithe"){
				pok2 = 10;
			}
			else if(cpokemon2 == "Lucario" or cpokemon2 == "lucario"){
				pok2 = 11;
			}
			else if(cpokemon2 == "Ohmassacre" or cpokemon2 == "ohmassacre"){
				pok2 = 12;
			}
			else if(cpokemon2 == "Kyurem" or cpokemon2 == "kyurem"){
				pok2 = 13;
			}
			else if(cpokemon2 == "Etouraptor" or cpokemon2 == "etouraptor"){
				pok2 = 14;
			}
			else if(cpokemon2 == "Ectoplasma" or cpokemon2 == "ectoplasma"){
				pok2 = 15;
			}
			else if(cpokemon2 == "Bruyverne" or cpokemon2 == "bruyverne"){
				pok2 = 16;
			}
			pokj2[a]=pok2;
			a++;
		}
		else {
			std::cout<<j1<<" a déjà choisi ce pokémon, prenez en un autre"<<std::endl;
		}
	pokmaj="";
	}
	
	

	
	
	
	std::system("clear");
	std::cout<<""<<std::endl;
	std::cout<<"----------------------------------"<<std::endl;
	std::cout<<""<<std::endl;

	
	ChoisirPokemon_j1(c1, liste, j1, pokj1, pok1);
	
	std::cout<<""<<std::endl;
	std::cout<<"----------------------------------"<<std::endl;
	std::cout<<""<<std::endl;
	
	ChoisirPokemon_j2(c2, liste, j2, pokj2, pok2);
	std::cout<<""<<std::endl;
	std::cout<<"----------------------------------"<<std::endl;
	std::cout<<""<<std::endl;
	
	
	while ((liste[pokj1[0]].Nombre_pv + liste[pokj1[1]].Nombre_pv + liste[pokj1[2]].Nombre_pv + liste[pokj1[3]].Nombre_pv > 0) && (liste[pokj2[0]].Nombre_pv + liste[pokj2[1]].Nombre_pv + liste[pokj2[2]].Nombre_pv + liste[pokj2[3]].Nombre_pv > 0)) {
		if (liste[pok1].Nombre_pv <= 0) {
			ChoisirPokemon_j1(c1, liste, j1, pokj1, pok1);
		}
		if (liste[pok2].Nombre_pv <= 0) {
			ChoisirPokemon_j2(c2, liste, j2, pokj2, pok2);
		}
		while ((liste[pok1].Nombre_pv>0) && (liste[pok2].Nombre_pv>0)) {   //lancement du combat
			std::cout<<j1<<" : Que souhaitez-vous faire ?"<<std::endl;
			std::cout<<""<<std::endl;
			std::cout<<"         attaquer            "<<std::endl;
			std::cout<<""<<std::endl;
			std::cout<<"sac                 changer_pokemon"<<std::endl;
			std::cout<<""<<std::endl;
			std::cin>>action_j1;
			while ((action_j1 != "attaquer") && (action_j1 != "sac") && action_j1 != "changer_pokemon") {
				std::cout<<"Choisissez une action réalisable"<<std::endl;
				std::cin>>action_j1;
			}
			if (action_j1 == "sac") {
				std::cout<<""<<std::endl;
				std::cout<<"----------------------------------"<<std::endl;
				std::cout<<""<<std::endl;
				if ((nb_potion_j1 == 0) && (nb_super_potion_j1 == 0)) {
					std::cout<<"Vous n'avez plus rien dans votre sac à dos !"<<std::endl;
					std::cout<<"Vous êtes obligé d'attaquer ou changer de pokemon !"<<std::endl;
					std::cout<<"Choisissez quoi faire (attaquer ou changer_pokemon)"<<std::endl;
					std::cin>>action_j1;
				}
				else {
					sac(liste, nb_potion_j1, nb_super_potion_j1, pok1);
				}
			}
			if (action_j1 == "attaquer") {
				std::cout<<""<<std::endl;
				std::cout<<"----------------------------------"<<std::endl;
				std::cout<<""<<std::endl;
				std::cout<<"Choisissez quelle attaque "<<liste[pok1].nom<<" doit faire parmi "<<liste[pok1].nom_atk1<<", "<<liste[pok1].nom_atk2<<", "<<liste[pok1].nom_atk3<<" et "<<liste[pok1].nom_atk4<<std::endl;
				std::cin>>attaquepok1;
				while (attaquepok1 != liste[pok1].nom_atk1 && attaquepok1 != liste[pok1].nom_atk2 && attaquepok1 != liste[pok1].nom_atk3 && attaquepok1 != liste[pok1].nom_atk4) {
					std::cout<<"Veuillez choisir une attaque que possède "<<liste[pok1].nom<<std::endl;
					std::cin>>attaquepok1;
				}
			}
			if (action_j1 == "changer_pokemon") {
				std::cout<<liste[pok2].nom<<" retourne dans sa pokéball !"<<std::endl;
				std::cout<<""<<std::endl;
				ChoisirPokemon_j1(c1, liste, j1, pokj1, pok1);
				std::cout<<""<<std::endl;
				std::cout<<liste[pok1].nom<<" entre en jeu !"<<std::endl;
			}
			
			std::cout<<""<<std::endl;
			std::cout<<"----------------------------------"<<std::endl;
			std::cout<<""<<std::endl;
			
			std::cout<<j2<<" : Que souhaitez-vous faire ?"<<std::endl;
			std::cout<<""<<std::endl;
			std::cout<<"         attaquer            "<<std::endl;
			std::cout<<""<<std::endl;
			std::cout<<"sac                 changer_pokemon"<<std::endl;
			std::cout<<""<<std::endl;
			std::cin>>action_j2;	
			while ((action_j2 != "attaquer") && (action_j2 != "sac") && (action_j2 != "changer_pokemon")) {
				std::cout<<"Choisissez une action réalisable"<<std::endl;
				std::cin>>action_j2;
			}
			if (action_j2 == "sac") {
				std::cout<<""<<std::endl;
				std::cout<<"----------------------------------"<<std::endl;
				std::cout<<""<<std::endl;
				if ((nb_potion_j2 == 0) && (nb_super_potion_j2 == 0)) {
					std::cout<<"Vous n'avez plus rien dans votre sac à dos !"<<std::endl;
					std::cout<<"Vous êtes obligé d'attaquer ou changer de pokemon !"<<std::endl;
					std::cout<<"Choisissez quoi faire (attaquer ou changer_pokemon)"<<std::endl;
					std::cin>>action_j2;
				}
				else {
					sac(liste, nb_potion_j2, nb_super_potion_j2, pok2);
				}
			}
			if (action_j2 == "attaquer") {
			std::cout<<""<<std::endl;
			std::cout<<"----------------------------------"<<std::endl;
			std::cout<<""<<std::endl;
			std::cout<<"Choisissez quelle attaque "<<liste[pok2].nom<<" doit faire parmi "<<liste[pok2].nom_atk1<<", "<<liste[pok2].nom_atk2<<", "<<liste[pok2].nom_atk3<<" et "<<liste[pok2].nom_atk4<<std::endl;
			std::cin>>attaquepok2;
				while (attaquepok2 != liste[pok2].nom_atk1 && attaquepok2 != liste[pok2].nom_atk2 && attaquepok2 != liste[pok2].nom_atk3 && attaquepok2 != liste[pok2].nom_atk4) {
					std::cout<<"Veuillez choisir une attaque que possède "<<liste[pok2].nom<<std::endl;
					std::cin>>attaquepok2;
				}
			}
			if (action_j2 == "changer_pokemon") {
				std::cout<<liste[pok2].nom<<" retourne dans sa pokéball !"<<std::endl;
				std::cout<<""<<std::endl;
				ChoisirPokemon_j2(c2, liste, j2, pokj2, pok2);
				std::cout<<""<<std::endl;
				std::cout<<liste[pok2].nom<<" entre en jeu !"<<std::endl;
			}
			std::cout<<""<<std::endl;
			std::cout<<"----------------------------------"<<std::endl;
			std::cout<<""<<std::endl;
			
			if ((action_j1 == "attaquer") && (action_j2 == "attaquer"))	 {
				if (liste[pok1].Vitesse > liste[pok2].Vitesse) {  //si le pokémon 1 est plus rapide son attaque est avant le pokémon 2
					attaqueP(liste,pok1,pok2,attaquepok1, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision, j1, valPreci, valCrit, typePoke);
					if (liste[pok2].Nombre_pv > 0) {
						attaqueP(liste,pok2,pok1,attaquepok2, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision, j2, valPreci, valCrit, typePoke);
					}
				}
				else if (liste[pok1].Vitesse < liste[pok2].Vitesse) {  //inversement
					attaqueP(liste, pok2,pok1,attaquepok2, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision,j2, valPreci, valCrit, typePoke);
					if (liste[pok1].Nombre_pv > 0) {
						attaqueP(liste, pok1,pok2,attaquepok1, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision,j1, valPreci, valCrit, typePoke);
					}
				}
			}
			else if ((action_j1 == "attaquer") && (action_j2 == "sac")) {
				attaqueP(liste,pok1,pok2,attaquepok1, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision, j1, valPreci, valCrit, typePoke);
			}
			else if ((action_j1 == "attaquer") && (action_j2 == "changer_pokemon")) {
				attaqueP(liste,pok1,pok2,attaquepok1, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision, j1, valPreci, valCrit, typePoke);
			}
			else if ((action_j1 == "sac") && (action_j2 == "attaquer")) {
				attaqueP(liste,pok2,pok1,attaquepok2, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision, j2, valPreci, valCrit, typePoke);
			}
			else if ((action_j1 == "changer_pokemon") && (action_j2 == "attaquer")) {
				attaqueP(liste,pok2,pok1,attaquepok2, faiblesse, resistance, stab, degatsReels, nomAtta, attaque, typeattaque, precision, j1, valPreci, valCrit, typePoke);
			}
		}
	}
	if (liste[pokj1[0]].Nombre_pv + liste[pokj1[1]].Nombre_pv + liste[pokj1[2]].Nombre_pv + liste[pokj1[3]].Nombre_pv == 0) {
		std::cout<<j2<<" remporte la partie !!"<<std::endl;
	}
	else if (liste[pokj2[0]].Nombre_pv + liste[pokj2[1]].Nombre_pv + liste[pokj2[2]].Nombre_pv + liste[pokj2[3]].Nombre_pv == 0) {
		std::cout<<j1<<" remporte la partie !!"<<std::endl;
	}
	Rejouer("pokemon");
}




int main() {           //menu principal de l'application
	int score_joueur1 = 0;  //4 variables pour le 50_points
	int score_joueur2 = 0;
	int ordi_ou_jcj = 0;
	int continuer_ou_non = 1;
	int n;
	std::string choix_jeu="";
	std::cout<<"A quel jeu voulez-vous jouer ?"<<std::endl;
	std::cout<<""<<std::endl;
	std::cout<<"- Pierre feuille ciseaux (entrez PFC)"<<std::endl;
	std::cout<<"- Morpion"<<std::endl;
	std::cout<<"- Juste Prix (entrez JP)"<<std::endl;
	std::cout<<"- pendu"<<std::endl;
	std::cout<<"- le 50 points (entrez 50_points)"<<std::endl;
	std::cout<<"- Yam's (entrez yams)"<<std::endl;
	std::cout<<"- Combat pokémon (entrez pokemon)"<<std::endl;
	std::cin>>choix_jeu;
	std::cout<<""<<std::endl;
	while (choix_jeu != "PFC" && choix_jeu != "morpion" && choix_jeu != "JP" && choix_jeu != "pendu" && choix_jeu != "50_points" && choix_jeu != "yams" && choix_jeu != "pokemon") {
		std::cout<<"Veuillez entrez un jeu disponible"<<std::endl;
		std::cin>>choix_jeu;
	}
	if (choix_jeu=="PFC") {
		std::system("clear");
		PFC();
	}
	else if (choix_jeu=="morpion") {
		std::system("clear");
		morpion();
	}
	else if (choix_jeu=="JP") {
		std::system("clear");
		justePrix();
	}
	else if (choix_jeu=="pendu") {
		std::system("clear");
		pendu();
	}
	else if (choix_jeu=="50_points") {
		std::system("clear");
		cinquantePoints();
	}
	else if (choix_jeu=="yams") {
		std::system("clear");
		Yams();
	}
	else if (choix_jeu=="pokemon") {
		std::system("clear");
		Pokemon();
	}
	return 0;
}


int Rejouer(std::string choix_jeu) {    //sous fonction utilisée à la fin de chaque jeu pour demander à l'utilisateur s'il veut rejouer
	std::string x;
	std::cout<<"Voulez vous rejouer ?"<<std::endl;
	std::cout<<""<<std::endl;
	std::cout<<"- Rejouer (entrez oui)"<<std::endl;
	std::cout<<"- Revenir au menu (entrez menu)"<<std::endl;
	std::cout<<"- Ne pas rejouer (entrez non)"<<std::endl;
	std::cin>>x;
	if ((x=="oui") && (choix_jeu=="PFC")) {
		PFC();
		return 0;
	}
	else if ((x=="oui") && (choix_jeu=="morpion")) {
		morpion();
		return 0;
	}
	else if ((x=="oui") && (choix_jeu=="JP")) {
		justePrix();
		return 0;
	}
	else if ((x=="oui") && (choix_jeu=="pendu")) {
		pendu();
		return 0;
	}
	else if ((x=="oui") && (choix_jeu=="50_points")) {
		cinquantePoints();
		return 0;
	}
	else if ((x=="oui") && (choix_jeu=="yams")) {
		Yams();
		return 0;
	}
	else if ((x=="oui") && (choix_jeu=="pokemon")) {
		Pokemon();
		return 0;
	}
	else if (x=="menu") {
		main();
		return 0;
	}
	else {
		return 1;
	}
}