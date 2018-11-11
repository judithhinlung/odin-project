class Connect_four
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
    0.upto(42) do
      |i| @board << i
    end
    @board[0] = "x" # Placeholder
    return @board
  end
  # Display board
  def print_board
    puts "   |   |   |   |   |   |   "
    puts "#{@board[36]} | #{@board[37]} | #{@board[38]} | #{@board[39]} | #{@board[40]} | #{@board[41]} | #{@board[42]}"
    puts "   |   |   |   |   |   |   "
    puts "----------------------------"
    puts "   |   |   |   |   |   |   "
    puts "#{@board[29]} | #{@board[30]} | #{@board[31]} | #{@board[32]} | #{@board[33]} | #{@board[34]} | #{@board[35]}"
    puts "   |   |   |   |   |   |   "
    puts "----------------------------"
    puts "   |   |   "
    puts "   |   |   |   |   |   |   "
    puts "#{@board[22]} | #{@board[23]} | #{@board[24]} | #{@board[25]} | #{@board[26]} | #{@board[27]} | #{@board[28]}"
    puts "   |   |   |   |   |   |   "
    puts "----------------------------"
    puts "   |   |   "
    puts "   |   |   |   |   |   |   "
    puts "#{@board[15]} | #{@board[16]} | #{@board[17]} | #{@board[18]} | #{@board[19]} | #{@board[20]} | #{@board[21]}"
    puts "   |   |   |   |   |   |   "
    puts "----------------------------"
    puts "   |   |   |   |   |   |   "
    puts "#{@board[8 ]} | #{@board[9 ]} | #{@board[10]} | #{@board[11]} | #{@board[12]} | #{@board[13]} | #{@board[14]}"
    puts "   |   |   |   |   |   |   "
    puts "----------------------------"
    puts "   |   |   |   |   |   |   "
    puts "#{@board[1 ]} | #{@board[2 ]} | #{@board[3 ]} | #{@board[4 ]} | #{@board[5 ]} | #{@board[6 ]} | #{@board[7 ]}"
    puts "   |   |   |   |   |   |   "
    puts "----------------------------"
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
      return true if ((board[36] == mark && board[37] == mark && board[38] == mark && board[40] == mark) || # First row left
      (board[37] == mark && board[38] == mark && board[39] == mark && board[40] == mark) || # First row middle left
      (board[38] == mark && board[39] == mark && board[40] == mark && board[41] == mark) || # First row middle left
      (board[39] == mark && board[40] == mark && board[41] == mark && board[42] == mark) || # First row right
      (board[29] == mark && board[30] == mark && board[31] == mark && board[32] == mark) || # Second row left
      (board[30] == mark && board[31] == mark && board[32] == mark && board[33] == mark) || # Second row left middle
      (board[31] == mark && board[32] == mark && board[33] == mark && board[34] == mark) || # Second row right middle
      (board[32] == mark && board[33] == mark && board[34] == mark && board[35] == mark) || # Second row right 
      (board[22] == mark && board[23] == mark && board[24] == mark && board[25] == mark) || # Third row left
      (board[23] == mark && board[24] == mark && board[25] == mark && board[26] == mark) || # Third row left middle
      (board[24] == mark && board[25] == mark && board[26] == mark && board[27] == mark) || # Third row right middle
      (board[25] == mark && board[26] == mark && board[27] == mark && board[28] == mark) || # Third row right 
      (board[15] == mark && board[16] == mark && board[17] == mark && board[18] == mark) || # Fourth row left
      (board[16] == mark && board[17] == mark && board[18] == mark && board[19] == mark) || # Fourth row left middle
      (board[17] == mark && board[18] == mark && board[19] == mark && board[20] == mark) || # Fourth row right middle
      (board[18] == mark && board[19] == mark && board[20] == mark && board[21] == mark) || # Fourth row right 
      (board[8] == mark && board[9] == mark && board[10] == mark && board[11] == mark) || # Fifth row left
      (board[9] == mark && board[10] == mark && board[11] == mark && board[12] == mark) || # Fifth row left middle
      (board[10] == mark && board[11] == mark && board[12] == mark && board[13] == mark) || # Fifth row right middle
      (board[11] == mark && board[12] == mark && board[13] == mark && board[14] == mark) || # Fifth row right 
      (board[1] == mark && board[2] == mark && board[3] == mark && board[4] == mark) || # Seventh row left
      (board[2] == mark && board[3] == mark && board[4] == mark && board[5] == mark) || # Seventh row left middle
      (board[3] == mark && board[4] == mark && board[5] == mark && board[6] == mark) || # Seventh row right middle
      (board[4] == mark && board[5] == mark && board[6] == mark && board[7] == mark) || # Seventh row right 
      (board[1] == mark && board[8] == mark && board[15] == mark && board[22] == mark) || # First top vertical
      (board[8] == mark && board[15] == mark && board[22] == mark && board[29] == mark) || # First middle vertical
      (board[15] == mark && board[22] == mark && board[29] == mark && board[36] == mark) || # First right vertical
      (board[2] == mark && board[9] == mark && board[16] == mark && board[23] == mark) || # Second left vertical
      (board[9] == mark && board[16] == mark && board[23] == mark && board[30] == mark) || # Second middle vertical
      (board[16] == mark && board[23] == mark && board[30] == mark && board[37] == mark) || # Second right vertical
      (board[3] == mark && board[10] == mark && board[17] == mark && board[24] == mark) || # Third left vertical
      (board[10] == mark && board[17] == mark && board[24] == mark && board[31] == mark) || # Third middle vertical
      (board[17] == mark && board[24] == mark && board[31] == mark && board[38] == mark) || # Third right vertical
      (board[4] == mark && board[11] == mark && board[18] == mark && board[25] == mark) || # Fourth left vertical
      (board[11] == mark && board[18] == mark && board[25] == mark && board[32] == mark) || # Fourth middle vertical
      (board[18] == mark && board[25] == mark && board[32] == mark && board[39] == mark) || # Fourth right vertical
      (board[5] == mark && board[12] == mark && board[19] == mark && board[26] == mark) || # Fifth left vertical
      (board[12] == mark && board[19] == mark && board[26] == mark && board[33] == mark) || # Fifth middle vertical
      (board[19] == mark && board[26] == mark && board[33] == mark && board[40] == mark) || # Fifth right vertical
      (board[6] == mark && board[13] == mark && board[20] == mark && board[27] == mark) || # Sixth left vertical
      (board[13] == mark && board[20] == mark && board[27] == mark && board[34] == mark) || # Sixth middle vertical
      (board[20] == mark && board[27] == mark && board[34] == mark && board[41] == mark) || # Sixth right vertical
      (board[7] == mark && board[14] == mark && board[21] == mark && board[28] == mark) || # Seventh left vertical
      (board[14] == mark && board[21] == mark && board[28] == mark && board[35] == mark) || # Seventh middle vertical
      (board[21] == mark && board[28] == mark && board[35] == mark && board[42] == mark) || # Seventh right vertical
      (board[1] == mark && board[9] == mark && board[17] == mark && board[25] == mark) || # Diagonal
      (board[2] == mark && board[10] == mark && board[18] == mark && board[26] == mark) || # Diagonal
      (board[3] == mark && board[11] == mark && board[19] == mark && board[27] == mark) || # Diagonal
      (board[4] == mark && board[12] == mark && board[20] == mark && board[28] == mark) || # Diagonal
      (board[8] == mark && board[16] == mark && board[25] == mark && board[32] == mark) || # Diagonal
      (board[9] == mark && board[17] == mark && board[26] == mark && board[33] == mark) || # Diagonal
      (board[10] == mark && board[18] == mark && board[27] == mark && board[34] == mark) || # Diagonal
      (board[11] == mark && board[19] == mark && board[27] == mark && board[35] == mark) || # Diagonal
      (board[15] == mark && board[23] == mark && board[31] == mark && board[40] == mark) || # Diagonal
      (board[16] == mark && board[24] == mark && board[32] == mark && board[40] == mark) || # Diagonal
      (board[17] == mark && board[25] == mark && board[33] == mark && board[41] == mark) || # Diagonal
      (board[18] == mark && board[26] == mark && board[34] == mark && board[42]= mark)) # Diagonal
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
      if win_check(@current_player)
        print_board
        puts "Congratulations, #{@current_player.name}, you have won the game!"
        @start = false
      elsif check_full
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

  def initialize(name)
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
  puts 'Welcome to Connect Four!'
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


