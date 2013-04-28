#!/usr/bin/env ruby

##
# Fichier        : Item.rb
# Auteur         : L3SPI - Groupe de projet B
# Fait partie de : TheGame
#
# Cette classe représente un item défini par :
# == Une caractéristique
#

require './Element.rb'

class Item < Element

   @caracteristique

   attr_reader :caracteristique
   
   def initialize(casePosition, caracteristique)
      super(casePosition)
      @caracteristique = caracteristique
   end
   
   def Item.creer(casePosition, caracteristique)
      new(casePosition, caracteristique)
   end

   def getIntitule()
      return caracteristique.getIntitule()
   end

   def utiliseToi(joueur)
      caracteristique.utiliseToi(joueur)
      joueur.inventaire.retirer(self)
   end
   
   def estEquipable()
       return caracteristique.estEquipable()
   end
   
   ##
   # Represente l'interaction avec un element present sur une case (dans ce cas ramasser un item)
   #
   def interaction(joueur)
     joueur.ramasser(self)
   end
   
   ##
   # Retourne une chaîne de caractères reprenant les différentes caractéristiques
   # de l'objet Item sur lequel la méthode est appellée.
   #
   def to_s
      return "[Item: position="+super()+" , caracteristique=#{@caracteristique}]"
   end

end