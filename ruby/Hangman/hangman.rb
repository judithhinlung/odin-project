require 'json'

class Hangman
  attr_accessor :lines, :board, :word_list, :word, :turns, :wrong_guesses, :score

  def initialize(word="", board=[], turns=0, wrong_guesses=[], score=0)
    @lines = lines 
    @word_list = word_list
    @word = word
    @start = true
    @turns = turns
    @board = board
    @wrong_guesses = wrong_guesses
    @score = score
  end
  # Load dictionary
  def get_lines
    @lines = File.readlines("5desk.txt", "r")
  end
# Create an array of words btw 5-12 characters in length
  def get_word_list
    @word_list = @lines.reject do |line|
      line.length < 5 || line.length > 12
    end
  end
  # Select a random word from list
  def get_word
    word =  @word_list[rand(@word_list.length)]
    @word = word.gsub(/\s+/, "").downcase
  end

  # Prints the game board
  def make_board
    @board = []
    index = 0
    while index < @word.length
      @board << "___ "
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
  def display
    puts "#{@board.join(" ")}"
  end
  def fill_board(letter)
    index = 0
    while index < word.length
      if @word[index] == letter
        @board[index] = letter
        @score += 1
      end
      index += 1
    end
  end
  def win_check
    puts "Current score: #{@score}"
  if @score >= @word.length
    puts "Congratulations, you have won the game!"
    @turns = 0
    elsif @turns - 1 <= 0 
      puts "You have no more turns."
      @turns -= 1
    else
      puts "You have #{@turns - 1} more turns. Try again!"
      @turns -= 1
    end
  end

  # Game loop
  def play_one_turn
    while @turns > 0  do

      puts "The word is #{@word.length} letters long, you have #{@word.length} turns to guess it."
      puts #{@board.join(" ") }
      choice = get_input
      if choice == "quit"
        exit
      elsif choice  == "save"
        save_file_prompt
      elsif @board.include?(choice)
        puts "You already guessed that one."
      elsif @word.include?(choice)
        puts "Correct!"
        fill_board(choice)
        display
        win_check
      else
        puts "Sorry, that's not correct."
        @wrong_guesses << choice
        display
        win_check
      end
    end
  end

  def to_json
    JSON.dump ({
      :board => @board, 
      :word => @word, 
    :turns => @turns,
      :wrong_guesses => @wrong_guesses, 
      :score => @score
    })
  end

  def self.from_json(string)
    data = JSON.load string
    self.new(data['word'], data['board'], data['turns'], data['wrong_guesses'], data['score'])
  end

  def save_file_prompt
    filename = ""
    while filename.empty?
      prompt = puts "Enter filename: "
      input = gets.chomp
      if File.exists?("#{input}.txt")
        puts "File already exists.  Overwrite file? (y/n)"
        answer = gets.chomp.downcase
        if answer == "y"
          filename = input
        else 
          prompt
        end
      else
        filename = "#{input}.txt"
      end
    end
    save_file(filename)
  end

  def save_file(file)
    unless Dir.exist?("games")
      Dir.mkdir("games")
    end
    contents = to_json
    puts "Saving #{file}..."
    f = File.open("games/#{file}", "w") 
    f.puts contents
    f.close
    exit
  end

  def load_file(file)
    puts "Loading file #{file}..."
    f = File.open("games/#{file}", "r+")
    contents = f.readlines.join
    Hangman.from_json(contents)
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

# Main game function
def main
  puts "Welcome to Hangman!"
  puts "Your job is to guess my secret word, between 5-12 characters long, in as many turns as the length of the word."
  puts "Note: type 'save' anytime to save your game, and 'quit' to quit."
  # Sets up the game
  game = Hangman.new
  game.get_lines
  game.get_word_list
  game.get_word
  game.make_board
  game.turns = game.word.length
  game.play_one_turn
  if replay
    main
  end
end

def game_options
  filename = ""
  if Dir.exist?("games") 
    prompt = "Would you like to load a saved game, start a new one, or quit? (l/n/q)"
    puts prompt
    answer = gets.chomp.downcase
    if answer == "quit" || answer == "q"
      exit
    elsif answer == "l"
      retrieved_file = false
      while retrieved_file == false do
        file_prompt = "Enter filename, or type\'ls\' to get a list of saved games."
        puts file_prompt
        input = gets.chomp.downcase
        if input == "ls" 
          puts Dir.entries("games").join(' ')
        elsif File.exist?("games/#{input}.txt") 
           filename = input
          retrieved_file = true
        else
          puts "#{input}.txt does not exist."
        end
      end
      my_game = Hangman.new
      my_game = my_game.load_file("#{filename}.txt")
      my_game.play_one_turn
      game_options
    elsif answer == "n" 
      main
    else 
      puts "Invalid command!"
      game_options
    end
  else 
    main
  end
end
game_options
