class Tic-tac-toe
  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = []
    @current_player = []
  end


  def create_board
    0.upto(8) do
      @board << i+1
    end
  end

  def print_board
    print '   |   |   '
    print ' #{@board[7]} | #{@board[8]} | #{@board[9]} '
    print '   |   |   '
    print '-----------'
    print '   |   |   '
    print ' #{@board[4]} | #{@board[5]} | #{@board[6]} '
    print '   |   |   '
    print '-----------'
    print '   |   |   '
    print ' #{@board[1]} | #{@board[2]} | #{@board[3]} '
    print '   |   |   '
    print '-----------'
  end

  def choose_token
    prompt = "Player 1, choose your token: x, o:"
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

  def choose_first
    num = random.randint(1, 2)
    puts 'Player #{num} will start the game.'
    if num == 1
      @current_player = @player1
    else
      @current_player = @player2
    end
  end

  def place(num, token)
    if !(num >=1 && num < 10)
        puts 'Square does not exist.'
    elsif !(@board[num] >= 1 && @board[num] < 10)
        puts 'Already taken.'
    else
        @board[num] = token
        puts '#{@current_player.token} has been placed in position #{num}.' 
    end
  end

  def check_full
    return true unless @board.each { |i| @board[i] >= 1 && @board[i] < 10}
  end

  def win_check(player)
    mark = player.token
      return true if ((@board[7] == mark && @board[8] == mark && @board[9] == mark) || # Top horrizontal
      (@board[4] == mark && @board[5] == mark && @board[6] == mark) || # middle horrizontal
      (@board[1] == mark && @board[2] == mark && @board[3] == mark) or # bottom horrizontal
      (@board[1] == mark && @board[4] == mark && @board[7] == mark) || # Left vertical
      (@board[2] == mark && @board[5] == mark && @board[8] == mark) || # Middle vertical
      (@board[3] == mark && @board[6] == mark && @board[9] == mark) || # Right vertical
      (@board[1] == mark && @board[5] == mark && @board[9] == mark) || # Diagonal
      (@board[3] == mark && @board[5] == mark && @board[7] == mark)) # diagonal
  end
  def play_one_turn
    print_board
    puts '#{@current_player.name}, Pick a position: 1-9\n'
    position = gets.chomp.downcase
    place(position, @current_player.token)
    if @current_player = @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
end



class Player
    attr_accessor :name, :token

  def initialize(name)
    @name = name
    @token = ""
  end
end

def replay()
    prompt = 'Would you like to play again?'
    answer = ''
    while !(answer == 'Y' or answer == 'N') do
      puts prompt
      answer = gets.chomp.downcase
    end
    return true unless answer == "n"
  end

# play one turn
def main():
  puts 'Welcome to Tic-Tac-Toe!'
  puts "Player1, please enter your name: "
  name1 = gets.chomp.capitalize
  player1 = Player.new(name1)
  puts "Player2, please enter your name: "
  name2 = gets.chomp.capitalize
  player2 = Player.new(name2)
  my_game = Tic-tac-toe.new(player1, player2)
  my_game.create_board 
  start = True # Game's on!
  while start do
    my_game.choose_token
    my_game.choose_first
    unless (my_game.check_full) do
      puts '#{@my_game.current_player.name}: '
      my_game.play_one_turn
      if my_game.win_check(my_game.@current_player)
        my_game.print_board
        puts 'Congratulations, #{my_game.@current_player.name}, you have won the game!'
        start = False
      end
    else 
      puts 'The game is a tie!'
      start = false
    end
  if replay
    main
  else
    puts "Goodbye!"
    exit
  end
end
