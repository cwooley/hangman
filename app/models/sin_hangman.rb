class SinHangman
  attr_accessor :words, :secret_word, :number_of_limbs


  def display_hangman
    hangman_array = [
      '<img src="https://us.123rf.com/450wm/ostill/ostill1307/ostill130700036/20725254-one-caucasian-business-man-portrait-profile-standing-in-front-of-hangman-s-noose-in-silhouette-studi.jpg?ver=6" alt="Hangman" height="300" width="300">',
      '<img src="https://previews.123rf.com/images/ostill/ostill1303/ostill130300043/18238096-one-caucasian-man-judge-standing-in-front-of-hangman-s-noose-in-silhouette-studio-isolated-on-white--Stock-Photo.jpg">',
      '<img src="https://us.123rf.com/450wm/ostill/ostill1305/ostill130500291/19755030-one-caucasian-man-holding-adjusting-hangman-s-noose-in-silhouette-studio-isolated-on-white-backgroun.jpg?ver=6">',
      '<img src="https://previews.123rf.com/images/ostill/ostill1412/ostill141200014/34200917-one-business-man-with-hangman-noose-around-the-neck-in-silhouette-studio-isolated-on-white-Stock-Photo.jpg">',
      '<img src="https://www.123rf.com/photo_17798233_one-caucasian-criminal-man-with-hangman-noose-around-the-neck-in-silhouette-studio-isolated-on-white.html">',
    ]

  end

  def initialize(player)
    words_raw_json = File.read('english_words.json')
    @words = JSON.parse(words_raw_json)
    @player2 = player
    @guessed_letters = []
    @number_of_limbs = 0
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
