require 'Enum/EnumDirection.rb'

class TestControleur
  
  @modele
  @vueDeTest
  
  private_class_method :new
      
  def TestControleur.creer()
      return new()
  end
  
  def defM(modele)
      @modele=modele
  end
  
# ===FONCTIONS DU FICHIER "Fonctions pour le controleur.rb"===
  
  #fonction reliée à chaque icone d'amure pour le popup de choix d'équipement d'armure avant un combat (l'armure cliquée est le paramètre)
  def equipeArmure(armure)
      if(armure!=nil)
        @modele.joueur.armure=armure
      end
  end
  
  #fonction reliée à chaque icone d'arme pour le popup de choix d'équipement d'arme avant un combat (l'arme cliquée est le paramètre)
  def equipeArme(arme)
      if(arme!=nil)
        @modele.joueur.arme=arme
      end
  end
  
  #fonction reliée à chaque icone d'item pour le popup de choix d'item a supprimer pour faire de la place (l'item cliquée est le paramètre)
  def fairePlace(nouvelItem,itemSuppr)
      if(nouvelItem!=itemSuppr)
          @modele.joueur.inventaire.retirer(itemSuppr)
          @modele.joueur.inventaire.ajouter(nouvelItem)
      end
  end
  
  #FONCTIONS ACCESSIBLE EN CHOIX LIBRE
  
  #deplacements: reliées aux touches directionnelles
  def deplacementNord()
      @modele.joueur.deplacementCible(EnumDirection.NORD)
  end
  
  def deplacementSud()
      @modele.joueur.deplacementCible(EnumDirection.SUD)
  end
  
  def deplacementEst()
      @modele.joueur.deplacementCible(EnumDirection.EST)
  end
  
  def deplacementOuest()
      @modele.joueur.deplacementCible(EnumDirection.OUEST)
  end
  
  #relié au bouton repos 
  def utiliserRepos()
     @modele.joueur.utiliserRepos() 
  end
  
  #action via inventaire: relié au bouton utiliser et prend en paramètre l'item séléctionné
  def utiliserItem(item)
      @modele.joueur.utiliser(item)
  end
  
  #action via inventaire: relié au bouton supprimer et prend en paramètre les items séléctionnés
  def supprimerItems(items)
      for i in items
        @modele.joueur.inventaire.retirer(i)
      end
  end
  
  #relié à un élément de la liste précedente
  def interargir(element)
      element.interaction(@modele.joueur)
  end
  
  #relié à un choix (en paramètre) dans la fenêtre d'interaction d'un guerisseur (en paramètre)
  def interactionGueriseur(guerrisseur,choix)
      guerrisseur.guerrir(@modele.joueur,choix)
  end
  
  #relié à un item (en paramètre) dans la fenêtre d'interaction d'un marchand (en paramètre) dans la section achat
  def interactionMarchandAchat(marchand,item)
      @modele.joueur.acheter(marchand,item)
  end
  
  #relié à un item (en paramètre) dans la fenêtre d'interaction d'un marchand (en paramètre) dans la section vente
  def interactionMarchandVente(marchand,item)
      @modele.joueur.vendre(marchand,item)
  end

end