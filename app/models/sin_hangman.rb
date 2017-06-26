class SinHangman
  attr_accessor :words, :secret_word

  def initialize(player)
    words_raw_json = File.read('english_words.json')
    @words = JSON.parse(words_raw_json)
    @player2 = player
    @guessed_letters = []
    self.find_word
  end


  def find_word
    #107567
    @secret_word = @words[rand(0..107566)]
    @dashes = Dashes.make_dashes(@secret_word)
    @secret_char_array = @secret_word.chars

  end


  def make_dashes
    #draws dashes
    #sets secret_word equal to @@dashes
    dashes = ""
    @secret_word.size.times do
    dashes += "_ "
    end

    secret_word.chars.each_with_index do |character, idx|
      dashes[idx * 2] = " " if character == " "
    end
    dashes
  end


end
