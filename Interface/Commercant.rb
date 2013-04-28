#!/usr/bin/env ruby

##
# Fichier         : Commercant.rb
# Auteur          : L3SPI - Groupe de projet B
# Fait partie de  : TheGame
#
#  Cette interface definit les actions d'un commercant.
#

require './AbstractInterface.rb'

module Commercant
   include AbstractInterface
  
  
   ##
   # Permet au commercant d'acheter un item à un vendeur.
   #
   # == Parameters:
   #* <b>vendeur :</b> le vendeur à qui on achéte l'item
   #* <b>item :</b> l'item acheté
   #
   def acheter(vendeur, item)
      Commercant.api_not_implemented(self)
   end

   
   ##
   # Permet au commercant de vendre un item à un acheteur.
   #
   # == Parameters:
   #* <b>acheteur :</b> l'acheteur à qui on vend l'item
   #* <b>item :</b> l'item vendu
   #
   def vendre(acheteur, item)
      Commercant.api_not_implemented(self)
   end
   
   
   ##
   # Permet au commercant d'ajouter un item à son stock.
   #
   # == Parameters:
   #* <b>item :</b> l'item à ajouter au stock
   #
   def ajouterAuStock(item)
      Commercant.api_not_implemented(self)
   end
  
  
   ##
   # Permet au commercant de retirer un item de son stock.
   #
   # == Parameters:
   #* <b>item :</b> l'item à retirer du stock
   #
   def retirerDuStock(item)
      Commercant.api_not_implemented(self)
   end
  
end