class Tic_tac_toe
  attr_accessor :player1, :player2, :current_player, :start
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = []
    @current_player = []
    @start = true
  end
  # set up board
  def create_board
    0.upto(9) do
      |i| @board << i
    end
    return @board
  end
  # Display board
  def print_board
    puts "   |   |   "
    puts "#{@board[7]} | #{@board[8]} | #{@board[9]}"
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
    puts "#{@board[4]} | #{@board[5]} | #{@board[6]}"
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
    puts "#{@board[1]} | #{@board[2]} | #{@board[3]}"
    puts "   |   |   "
    puts "-----------"
  end
  # Player1 chooses to be x or o
  def choose_token
    prompt = "#{player1.name}, choose your token: x, o:"
    token = ""
    other = ""
    until ((token == "x") || (token == "o")) do
      puts prompt
      token = gets.chomp
      token.downcase
    end
    if token == 'x' 
      other = 'o'
    else
      other = 'x'
    end
    @player1.token = token
    @player2.token = other
    puts "#{@player1.name}: your token is #{@player1.token}"
    puts "#{@player2.name}: your token is #{@player2.token}"
  end
  # Randomly choose who goes first
  def choose_first
    num = 1 + rand(2)
    puts "Player #{num} will start the game."
    if num == 1
      @current_player = @player1
    else
      @current_player = @player2
    end
  end
  # place a token on board
  def place(num, token)
    if !(num >=1 && num < 10)
        puts "Square does not exist."
    elsif (@board[num] == "x" || @board[num] == "o")
        puts "Already taken."
    else
        @board[num] = token
        puts "#{token} has been placed in position #{num}." 
    end
    return @board
  end
  # Check if board is filled
  def check_full(board)
    return true if board.all? { |i| i == "x" || i == "o" }
    return false
  end
  # Check if a player has won
  def win_check(mark, board)
      return true if ((board[7] == mark && board[8] == mark && board[9] == mark) || # Top horrizontal
      (board[4] == mark && board[5] == mark && board[6] == mark) || # middle horrizontal
      (board[1] == mark && board[2] == mark && board[3] == mark) or # bottom horrizontal
      (board[1] == mark && board[4] == mark && board[7] == mark) || # Left vertical
      (board[2] == mark && board[5] == mark && board[8] == mark) || # Middle vertical
      (board[3] == mark && board[6] == mark && board[9] == mark) || # Right vertical
      (board[1] == mark && board[5] == mark && board[9] == mark) || # Diagonal
      (board[3] == mark && board[5] == mark && board[7] == mark)) # diagonal
    return false
  end
  # Game loop
  def play_one_turn
    while @start == true do 
      print_board
      puts "#{@current_player.name}, pick a  position: 1-9\n"
      position = gets.chomp.downcase
      position = position.to_i
      place(position, @current_player.token)
      if win_check(@current_player.token, @board)
        print_board
        puts "Congratulations, #{@current_player.name}, you have won the game!"
        @start = false
      elsif check_full(@board)
        puts "The game is a tie"
        @start = false
      end
      if (@current_player == @player1)
        @current_player = @player2
      else
        @current_player = @player1
      end
    end
  end
end
# Player class
class Player
    attr_accessor :name, :token

  def initialize(name=nil, token=nil)
    @name = name
    @token = ""
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


# Main function
def main
  puts 'Welcome to Tic Tac Toe!'
  puts "Player1, please enter your name: "
  name1 = gets.chomp.capitalize
  player1 = Player.new(name1)
  puts "Player2, please enter your name: "
  name2 = gets.chomp.capitalize
  player2 = Player.new(name2)
  my_game = Tic_tac_toe.new(player1, player2)
  my_game.create_board 
    my_game.choose_token
  my_game.choose_first
  my_game.play_one_turn
  if replay
    main
  else
    puts "Goodbye!"
    exit
  end
end

main
