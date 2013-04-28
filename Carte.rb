require './Case.rb'
require './Type/TypeTerrain.rb'
require './Enum/EnumDirection.rb'
require './Bibliotheque/BibliothequeTypeTerrain.rb'

class Carte

   @longueur
   @largeur
   @cases
   @joueur

   attr_accessor :longueur
   attr_accessor :largeur
   attr_accessor :cases

   private_class_method :new
   ##
   #Initialisation d'une carte avec pour argument sa longueur et sa largeur
   #==Parameters
   #longueur
   #largeur
   def initialize(long,larg)
      @longueur = long
      @largeur = larg
      @cases = Array.new()

      for i in 0..long-1
         for j in 0..larg-1
            @cases.push(Case.nouvelle(i,j))
         end
      end
      for i in 0..long-1
         for j in 0..larg-1
            self.getCaseAt(i,j).initVoisines(self.getCaseAt(i,j-1),self.getCaseAt(i,j+1),self.getCaseAt(i-1,j),self.getCaseAt(i+1,j))
            self.getCaseAt(i,j).typeTerrain = BibliothequeTypeTerrain.getTypeTerrain("Plaine")
         end
      end
      generationMapSemiAleatoire()
   end

   def generationMapSemiAleatoire()
      0.upto(longueur+largeur*2){
         tt = BibliothequeTypeTerrain.getTypeTerrainAuHasard
         repartitionType(tt,tt.probaRepartition,rand(longueur),rand(largeur))
      }
   end

   def repartitionType(type, proba, coordX, coordY)
      if(coordX >= longueur || coordY >= largeur || coordX < 0 || coordY < 0)
         return
      elsif(getCaseAt(coordX,coordY).typeTerrain == type)
         return
      else
         getCaseAt(coordX,coordY).typeTerrain = type
         (rand(100)<proba)?(repartitionType(type,proba-5,coordX-1,coordY)):(return)
         (rand(100)<proba)?(repartitionType(type,proba-5,coordX,coordY-1)):(return)
         (rand(100)<proba)?(repartitionType(type,proba-5,coordX+1,coordY)):(return)
         (rand(100)<proba)?(repartitionType(type,proba-5,coordX,coordY+1)):(return)
      end
      return
   end

   ##
   #Retrouver une case à des coordonnées x et y
   #==Parameters
   #x la coordonnée en X
   #y la coordonnée en Y
   def getCaseAt(x,y)
      return @cases[y%@largeur+(x%@longueur)*@largeur]
   end

   def Carte.nouvelle(long,larg)
      return new(long,larg)
   end

   ##
   #Méthode de test
   def Carte.main
      carte = Carte.nouvelle(50,100)
      print carte.getCaseAt(51,101).typeTerrain
   end

   #Carte.main
end
