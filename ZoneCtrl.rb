#!/usr/bin/env ruby

require 'gtk2'
require './ReferencesGraphiques.rb'
require './XmlRefGraphiquesReader.rb'
require './Controller.rb'



#pour le model
#haut @vue.afficheCarte(@vue.x-1,@vue.y);
#bas  @vue.afficheCarte(@vue.x+1,@vue.y);
#gauche  @vue.afficheCarte(@vue.x,@vue.y-1);
#droite   @vue.afficheCarte(@vue.x,@vue.y+1);


class ZoneCtrl <  Gtk::Frame
  
  @referencesGraphiques
  def initialize()
    super(); #Frame
    #Gtk.init();
    @referencesGraphiques = ReferencesGraphiques.new();
    XmlRefGraphiquesReader.lireXml(@referencesGraphiques);
    initInterface();
    #Gtk.main();
  end
  
  def initInterface()
    #creation image bouton
    gauche = Gtk::EventBox.new.add(Gtk::Image.new(@referencesGraphiques.getRefGraphique("gauche")));
    droite = Gtk::EventBox.new.add(Gtk::Image.new(@referencesGraphiques.getRefGraphique("droite")));
    haut = Gtk::EventBox.new.add(Gtk::Image.new(@referencesGraphiques.getRefGraphique("haut")));
    bas = Gtk::EventBox.new.add(Gtk::Image.new(@referencesGraphiques.getRefGraphique("bas")));
    #association au controlleur
    Controller::DeplacementGauche.creer(gauche);  
    Controller::DeplacementDroite.creer(droite);
    Controller::DeplacementHaut.creer(haut);
    Controller::DeplacementBas.creer(bas);
    #creation bouton  
    repos = Gtk::Button.new("REPOS");
    inventaire = Gtk::Button.new("INVENTAIRE");
    menu = Gtk::Button.new("MENU");
    interaction = Gtk::Button.new("INTERACTON");
    #association au controler
    Controller::Repos.creer(repos);
    Controller::Inventaire.creer(inventaire);
    Controller::Menu.creer(menu);
    Controller::Interaction.creer(interaction);
    
    
    

    vbox = Gtk::VBox.new(true, 3);
    hbox1 = Gtk::HBox.new(true, 3);
    hbox2 = Gtk::HBox.new(true, 3);
    hbox3 = Gtk::HBox.new(true, 3);
    
    vbox.add(hbox1);
    vbox.add(hbox2);
    vbox.add(hbox3);
    #ligne 1
    hbox1.add(repos);
    hbox1.add(haut);
    hbox1.add(inventaire);
    
    #ligne2
    hbox2.add(gauche);
    hbox2.add(Gtk::Label.new(""));
    hbox2.add(droite);
    
    #ligne3
    hbox3.add(menu);
    hbox3.add(bas);
    hbox3.add(interaction);
    
    add(vbox);
    show_all();
    
  end

  
end



