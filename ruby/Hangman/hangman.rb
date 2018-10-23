class Hangman
  attr_accessor :lines, :board, :word_list, :word, :turns, :wrong_guesses, :score

  def initialize
    @lines = File.readlines("5desk.txt")
    @word_list = self.get_word_list
    @game_on = true
    @word = self.get_word
    @board = make_board
    @turns = @word.length
    @wrong_guesses = [] 
    @score= 0 
  end

# Create an array of words btw 5-12 characters in length
  def get_word_list
    @word_list = @lines.reject do |line|
      line.length < 5 || line.length > 12
    end
  end
  # Select a random word from list
  def get_word
    @word =  word_list[rand(word_list.length)]
  end

  # Prints the game board
  def make_board
    @board = []
    index = 0
    while index < @word.length
      @board << "x"
    index += 1
    end
    return @board
  end

# Gets one letter
  def get_input 
    letter = ""
    until letter.match(/[a-z]/) do
      puts "Enter a letter: "
      letter = gets.chomp.downcase
    end
    return letter
  end
# Guessed the right letter?
# Fill in game board with correct letters
  def play_one_turn
    # Game loop
    puts "The word is #{@word}"
  puts #{@board.join(" ") }
    while @turns > 0
      letter = get_input
      if @word.include?(letter)
        index = 0
        while index < word.length
          if @word[index] == letter
            @board[index] = letter
            @score += 1
        end
          index += 1
        end
      else
        puts "incorrect! Guess again"
        @wrong_guesses << letter
      end
      puts "The letters you guessed correctly so far are #{@board.join(" ")}"

      if @score >= @word.length
        puts "Congratulations, you have won the game!"
        break
      else
        unless @turns - 1 <= 0 {
          puts "You have #{@turns - 1} more turns."
      end
      @turns -= 1
    end
    if @turns-1 <= 0
      puts "You have no more turns!"
    end
  end
end

# Play again?
def replay
    prompt = "Would you like to play again? (y/n)"
    puts prompt
    answer = gets.chomp.downcase
    if answer == "y"
      return true
    elsif answer == "n"
      return false
     exit
    else
      puts "Invalid command"
      replay
    end
  end

def main
  puts "Welcome to Hangman!"
  puts "Your job is to guess my secret word, between 5-12 characters long, in as many turns as the length of the word."
  game = Hangman.new
  while game.game_on == true
    game.play_one_turn
  end
  if replay
    main
  end
end
