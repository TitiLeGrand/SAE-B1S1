#include<iostream>
#include "morpion.h"

struct coord{
	int x;
	int y;
};

void initTabOuPlacer(int tab[15][15]){
	for(int i=0; i<15; i++){
		for(int j=0; j<15; j++){tab[i][j]=0;};
	};
}

void afficherTabOuPlacer(int tab[15][15]){
    for(int i=0; i<15; i++){
		for(int j=0; j<15; j++){
			if(tab[i][j] < 0){std::cout <<tab[i][j]<<" ";}
			else{std::cout <<" "<<tab[i][j]<<" ";}
		};
		std::cout<<std::endl;
	}
}



void RemplirTabOuPlacer(char** tab, int size, int nbpion,char pion, int TabOuPlacer[15][15]){
	
	for(int i = 0; i < size; ++i) {
		for(int j = 0; j < size; ++j) if (tab[i][j] == pion) {
		
			int align = 0, i2, j2; 
			
			// colone
			i2 = i; align = 0;
			while( i2 < size && (i2-i) < nbpion ) { align = align + (tab[i2][j] == pion); i2++; }
			if(align == nbpion) {
                if (estLibre_morpion(tab,size,i-1,j)) {TabOuPlacer[i-1][j]++;};
                if (estLibre_morpion(tab,size,i2,j)) {TabOuPlacer[i2][j]++;};
			};

			//ligne
			j2 = j; align = 0;
			while( j2 < size && (j2-j) < nbpion ) { align = align + (tab[i][j2] == pion); j2++; }
			if(align == nbpion) {
                if (estLibre_morpion(tab,size,i,j-1)) {TabOuPlacer[i][j-1]++;};
                if (estLibre_morpion(tab,size,i,j2)) {TabOuPlacer[i][j2]++;};
			};

			/*Diago  (\)*/
			j2 = j; i2 = i; align = 0;
			while( i2 < size && (j2-j) < nbpion && j2 < size && (j2-j) < nbpion) { align = align + (tab[i2][j2] == pion); i2++; j2++; }
			if(align == nbpion) {
                if (estLibre_morpion(tab,size,i-1,j-1)) {TabOuPlacer[i-1][j-1]++;};
                if (estLibre_morpion(tab,size,i2,j)) {TabOuPlacer[i2][j2]++;};
			};

			/*Diago  (/)*/
			j2 = j; i2 = i; align = 0;
			while( i2 < size && (j2-j) < nbpion && j2 >=0 && (j-j2) < nbpion) { align = align + (tab[i2][j2] == pion); i2++; j2--; }
			if(align == nbpion) {
                if (estLibre_morpion(tab,size,i-1,j+1)) {TabOuPlacer[i-1][j+1]++;};
                if (estLibre_morpion(tab,size,i2,j)) {TabOuPlacer[i2][j2]++;};
			}
		}
	}
}

void CasePrise(char ** tab,int & size, int TabOuPlacer[15][15]){
	for(int i=0; i<15; i++){
		for(int j=0; j<15; j++){
			if(tab[i][j]=='X' || tab[i][j]=='O'){
				TabOuPlacer[i][j] = -8;
			}
		}
	}
} 

int valMaxDuTab(int tab[15][15]){
	int val = 0;
	for(int i=0; i<15; i++){
		for(int j=0; j<15; j++){
			if (tab[i][j]>val){
				val = tab[i][j];
			}
		}
	}
	return val;
}

void RemplirTabCoord(coord tab[20],int & TailleTabCoord,int Max,int TabOuPlacer[15][15]){
	TailleTabCoord = 0;

	for(int i=0; i<15; i++){
		for(int j=0; j<15; j++){
			if(TabOuPlacer[i][j]==Max){
				tab[TailleTabCoord].x = i;
				tab[TailleTabCoord].y = j;
				TailleTabCoord++;
			}
		}
	}
}

void jouerCroix(char ** tab, int & x, int & y){
    int TabOuPlacer[15][15];	

	int size = 15;
	char pion='O';

	int max = 0;
	coord tabCoord[20];
	int TailleTabCoord = 0;
	int poseRand = 0;

	for(int nbPionAlign = 1; nbPionAlign < 5; nbPionAlign++){
		initTabOuPlacer(TabOuPlacer);
		RemplirTabOuPlacer(tab, size, nbPionAlign,pion, TabOuPlacer);	
		CasePrise(tab, size, TabOuPlacer);

		max = valMaxDuTab(TabOuPlacer);
		if(max != 0){ 
			RemplirTabCoord(tabCoord,TailleTabCoord,max,TabOuPlacer);
			poseRand = rand()% TailleTabCoord; 

			x = tabCoord[poseRand].x;
			y = tabCoord[poseRand].y;
		}
	}
}

void jouerRond(char ** tab, int & x, int & y){
    x=rand()%10+2;
	y=rand()%10+2;
	
	int TabOuPlacer[15][15];

	int size = 15;
	char pion='O';

	int max = 0;
	coord tabCoord[20];
	int TailleTabCoord = 0;
	int poseRand = 0;

	for(int nbPionAlign = 1; nbPionAlign < 5; nbPionAlign++){
		initTabOuPlacer(TabOuPlacer);
		RemplirTabOuPlacer(tab, size, nbPionAlign,pion, TabOuPlacer);
		CasePrise(tab, size, TabOuPlacer);

		max = valMaxDuTab(TabOuPlacer);
		if(max != 0){
			RemplirTabCoord(tabCoord,TailleTabCoord,max,TabOuPlacer);
			poseRand = rand()% TailleTabCoord;

			x = tabCoord[poseRand].x;
			y = tabCoord[poseRand].y;
		}
	}
}