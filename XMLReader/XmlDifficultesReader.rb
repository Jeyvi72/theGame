#!/usr/bin/env ruby 

## 
# Fichier        : XmlDifficultesReader.rb 
# Auteur         : L3SPI - Groupe de projet B 
# Fait partie de : TheGame 
# 
# Cette classe permet de parcourir le fichier XML des difficultés et de les ajouter à la bibliothèque correspondante.
#

require 'Bibliotheque/BibliothequeDifficulte.rb'
require 'Type/Difficulte.rb'
require 'rexml/document'
include REXML

class XmlDifficultesReader


   ##
   # Méthode statique permettant de récupérer les difficultés et de les ajouter
   #
   def XmlDifficultesReader.lireXml()
      #Ouvre le fichier XML contenant les références 
      begin
         file = File.new("XMLFile/difficultes.xml")
         doc = Document.new(file)
      rescue
         puts "Impossible d'ouvrir le fichier XML des difficultés."
      end

      #Pour chaque référence du fichier XML...
      doc.elements.each('difficultes/difficulte') do |s|
         #... on ajoute à la bibliothèque
         BibliothequeDifficulte.ajouter(s.elements['intitule'].text,
                Difficulte.creer(
                                    s.elements['intitule'].text, 
                                    s.elements['longueurCarte'].text.to_i, 
                                    s.elements['largeurCarte'].text.to_i, 
                                    s.elements['energieDepart'].text.to_i, 
                                    s.elements['energieMax'].text.to_i, 
                                    s.elements['nbRepos'].text.to_i,
                                    s.elements['pnjAmisDepart'].text.to_i,
                                    s.elements['pnjAmisParGeneration'].text.to_i, 
                                    s.elements['pnjEnnemisDepart'].text.to_i, 
                                    s.elements['pnjEnnemisParGeneration'].text.to_i, 
                                    s.elements['objetsDepart'].text.to_i,
                                    s.elements['objetsParGeneration'].text.to_i, 
                                    s.elements['nbToursInterGenerations'].text.to_i, 
                                    s.elements['pourcentageTerrain)'].text.to_i
                                  ))
      end
   end


end
