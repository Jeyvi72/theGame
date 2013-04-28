"#!/usr/bin/env ruby"

require 'gtk2'
require './Zaf.rb'
require './ZoneCtrl.rb'
require './Carte.rb'
require './ReferencesGraphiques.rb'
require './XmlRefGraphiquesReader.rb'

class Vue

  
  @vue; #affichage carte
  @zaf; 
  @zoneCtrl;
  @carte; #la classe carte
  @referencesGraphiques; #fichier xml des images
  @carteVue; #tableau pour affichager la carte
  @hauteurAfficheCarte; #hauteurVisible
  @largeurAfficheCarte; #largeurVisible
  
  @x; #coordonné actuel
  @y; #coordonné actuel
  
  attr_accessor :x ,:y;
  
  def initialize()
    Gtk.init();
    @referencesGraphiques = ReferencesGraphiques.new();
    XmlRefGraphiquesReader.lireXml(@referencesGraphiques);
  
    @hauteurAfficheCarte = 11;
    @largeurAfficheCarte = 23; 
    @vue = Array.new(@hauteurAfficheCarte){|x|Array.new(@largeurAfficheCarte ){|y|Gtk::Image.new()}}
    @zaf = Zaf.new();
    @zoneCtrl = ZoneCtrl.new();
    
    
    @carte = Carte.nouvelle(100,100);

    initInterface();
    Gtk.main();

  end
  
  def initInterface()
   
    window = Gtk::Window.new();
       window.signal_connect('destroy') { 
         Gtk.main_quit();
    }
    
    #tableau pour le bas de la fenêtre
    tabBot = Gtk::Table.new(1,3,true);
    
    tabBot.attach(@zaf,0,2,0,1);
    tabBot.attach(@zoneCtrl,2,3,0,1);
    
    #tableau pour afficher la carte
    @carteVue = Gtk::Table.new(@hauteurAfficheCarte,@largeurAfficheCarte,true);
    
    vbox = Gtk::VBox.new();
    
    #initialisation de la carte
    
    initCarte(0,0);
    vbox.add(@carteVue);
    vbox.add(tabBot)
     
    window.set_resizable(false);
    window.add(vbox);
    
    window.set_title("THE GAME");
    window.show_all();
    
  end
  
  def initCarte(debutX,debutY)
       0.upto(@hauteurAfficheCarte-1) do |x|
       0.upto(@largeurAfficheCarte-1)do |y|
           @carteVue.attach(@vue[x][y],y,y+1,x,x+1);
       end
     end
     
      afficheCarte(debutX,debutY);
   end
  
  
  def afficheCarte(debutX,debutY)
    @x=debutX;
    @y=debutY;

     0.upto(@hauteurAfficheCarte-1) do |x|
      0.upto(@largeurAfficheCarte-1)do |y|
         @vue[x][y].file=((@referencesGraphiques.getRefGraphique(@carte.getCaseAt(x+debutX,y+debutY).typeTerrain().intitule.downcase)));
      end
    end
  end
  

  
  
end

Vue.new()