class SP_Hangman < Hangman

  attr_accessor :player, :words, :dashes, :secret_word, :guessed_letters, :number_of_limbs



  def initialize(player)
    words_raw_json = File.read('english_words.json')
    @words = JSON.parse(words_raw_json)
    @player2 = player
    @guessed_letters = []
  end

  ### unique possbly use inherited version with refactor
  def playgame
    @number_of_limbs = 0

    self.find_word

    self.draws_hangman_and_dashes

    until self.game_over? do
      input = self.get_input
      self.check_input(input)
      self.draws_hangman_and_dashes
    end

    self.end_round
  end

  ##unique
  def find_word
    #107567
    @secret_word = @words[rand(0..107566)]
    @dashes = Dashes.make_dashes(@secret_word)
    @secret_char_array = @secret_word.chars
  end


  def end_round
    dashes_without_spaces = @dashes.gsub(/\s+/, "")
    if dashes_without_spaces == @secret_word.gsub(/\s+/, "")
      #player wins
      puts "You win!!!"
      @player2.wins += 1
      puts "#{@player2.name}'s record is #{@player2.wins} wins and #{@player2.losses} losses"
    else
      #player loses
      puts "You lose!!!"
      puts "The word was #{@secret_word}"
      @player2.losses += 1
      puts "#{@player2.name}'s record is #{@player2.wins} wins and #{@player2.losses} losses"
    end
  end

end
