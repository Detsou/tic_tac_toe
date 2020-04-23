class Game
attr_accessor 

  def initialize #initialisation du jeu
  end

  def start #bonjour, noms des joueurs, initialisation des joueurs, affichage du plateau vierge
  end

  def menu #joueur1/2, voici vos options (affichage visuel de l'array_available_choices)
  end

  def menu_choice #demande d'input, choix = option à retirer de l'array_available_choices pour le mettre dans l'array_in_game_inputs
  end

  def status #affichage du tableau 
  end

  def is_ongoing? #verification did_i_win? ou si le tableau est rempli
  end

  def did_i_win? #win_diag win_horizontal win_vertical à check
  end

  def end #if is_ongoing false, end. Bravo J1/2.
  end

end