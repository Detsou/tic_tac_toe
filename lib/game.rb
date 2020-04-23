class Game
  attr_accessor :player1, :player2, :active_player, :starting_turn

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name, "X")
    @player2 = Player.new(player2_name, "O")
    @a_spaces = [Case.new("A1"), Case.new("A2"), Case.new("A3"), Case.new("B1"), Case.new("B2"), Case.new("B3"), Case.new("C1"), Case.new("C2"), Case.new("C3")]
    @active_player = @player1
    @starting_turn = rand(1..2)
  end

  def start
    puts "Bonne chance à vous, #{player1.name} et #{player2.name}."
    puts
    puts "    1   2   3  "
    puts "  -------------"
    puts "A | #{@a_spaces[0].content} | #{@a_spaces[1].content} | #{@a_spaces[2].content} |"
    puts "  -------------"
    puts "B | #{@a_spaces[3].content} | #{@a_spaces[4].content} | #{@a_spaces[5].content} |"
    puts "  -------------"
    puts "C | #{@a_spaces[6].content} | #{@a_spaces[7].content} | #{@a_spaces[8].content} |"
    puts "  -------------"
  end

  def next_player
    if @starting_turn.even?
      @active_player = @player1
      puts "C'est à #{@player1.name} de jouer."
    else
      @active_player = @player2
      puts "C'est à #{@player2.name} de jouer."
    end 
    @starting_turn += 1
  end

  def menu #joueur1/2, voici vos options (affichage visuel de l'array spaces)
    puts "#{@active_player.name}, choisissez une case :"
    @a_spaces.each do |case_|
      puts "- #{case_.name}" if case_.content == " "
    end
  end

  def menu_choice #demande d'input, choix = option a retirer de l'array spaces pour le mettre dans l'array_in_game_inputs
    puts 
    print "> "
    selected_case = gets.chomp
      while !is_valid?(selected_case)
        puts "Veuillez choisir une case valide."
        print "> "
        selected_case = gets.chomp
      end
    @a_spaces.each do |case_|
      case_.content = "#{@active_player.sign}" if selected_case == case_.name
    end
  end

  def is_valid?(input)
    x = 0
    @a_spaces.each do |case_|
      x += 1 if case_.name == input
    end 
    true if x == 1
  end

  def status #affichage du tableau 
    puts "    1   2   3  "
    puts "  -------------"
    puts "A | #{@a_spaces[0].content} | #{@a_spaces[1].content} | #{@a_spaces[2].content} |"
    puts "  -------------"
    puts "B | #{@a_spaces[3].content} | #{@a_spaces[4].content} | #{@a_spaces[5].content} |"
    puts "  -------------"
    puts "C | #{@a_spaces[6].content} | #{@a_spaces[7].content} | #{@a_spaces[8].content} |"
    puts "  -------------"
  end

  def is_ongoing? #verification did_i_win? ou si le tableau est rempli
    number_of_spaces = 0
    @a_spaces.each do |case_|
      number_of_spaces += 1 if case_.content == " "
    end
    return !(self.did_i_win? || number_of_spaces == 0)
  end

  def did_i_win? 
    self.diag_win? || self.horizontal_win? || self.vertical_win?
  end

  def diag_win?
    if (@a_spaces[0].content == @active_player.sign && @a_spaces[4].content == @active_player.sign && @a_spaces[8].content == @active_player.sign)
      return true
    elsif (@a_spaces[6].content == @active_player.sign && @a_spaces[4].content == @active_player.sign && @a_spaces[2].content == @active_player.sign)
      return true
    else
      return false
    end
  end

  def horizontal_win?
    if (@a_spaces[0].content == @active_player.sign && @a_spaces[1].content == @active_player.sign && @a_spaces[2].content == @active_player.sign)
      return true
    elsif (@a_spaces[3].content == @active_player.sign && @a_spaces[4].content == @active_player.sign && @a_spaces[5].content == @active_player.sign)
      return true
    elsif (@a_spaces[6].content == @active_player.sign && @a_spaces[7].content == @active_player.sign && @a_spaces[8].content == @active_player.sign)
      return true
    else
      return false
    end
  end

  def vertical_win?
    if (@a_spaces[0].content == @active_player.sign && @a_spaces[3].content == @active_player.sign && @a_spaces[6].content == @active_player.sign)
      return true
    elsif (@a_spaces[1].content == @active_player.sign && @a_spaces[4].content == @active_player.sign && @a_spaces[7].content == @active_player.sign)
      return true
    elsif (@a_spaces[2].content == @active_player.sign && @a_spaces[5].content == @active_player.sign && @a_spaces[8].content == @active_player.sign)
      return true
    else
      return false
    end
  end

  def end #if is_ongoing false, end. Bravo J1/2.
    puts
    if self.did_i_win?
      puts "Bravo, #{@active_player.name} a gagné !"
    else
      puts "Match nul !"
    end 
  end

end