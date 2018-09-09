class Dungeon
  attr_accessor :player


  def initialize(player)
    @player = player
    @rooms = {}

  end

  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
end


class Player
  attr_accessor :name, :location

  def initialize(name)
    @name = name
  end
end

class Room
  attr_accessor :reference, :name, :description, :connections

  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end

  def full_description
    @name + "\n\nYou are in " + @description
  end
end


# Add rooms to the dungeon
def add_rooms_to_dungeon(dungeon)
  dungeon.add_room(:largecave,
                    "Large Cave",
                    "a large cavernous cave",
                    { :west => :smallcave })

  dungeon.add_room(:smallcave,
                    "Small Cave",
                    "a small, claustrophobic cave",
                    { :east => :largecave })

end


def game_loop(dungeon)
    game_on = true
    puts "Please enter a command (type Help for a list of commands I understand)"
    while game_on == true do
      command = gets.chomp
      if command.downcase == "quit"
        puts "Goodbye!"
        game_on = false
      elsif command.downcase == "north" || command.downcase == "south" || command.downcase == "east" || command.downcase == "west"
        if dungeon.find_room_in_direction(command.to_sym) == nil
          puts "You can't go that way"
        else
  			   dungeon.go(command.to_sym)
      end
      elsif command.downcase == "help"
        puts "Commands I understand include North, South, East, West, and i (to check your inventory"
      else
        puts "I don't understand this command"
      end
    end
  end
def start_game 
    puts "Welcome to the Dungeon 
Adventure. Enter your name: "
    name = gets.chomp
    player = Player.new(name)
    my_dungeon = Dungeon.new(player)
    puts "Welcome, #{player.name}.  We are so glad to have you.  Get ready to discover what's in this dungeon!"
add_rooms_to_dungeon(my_dungeon)
    my_dungeon.start(:largecave)
    game_loop(my_dungeon)
    play_again?
  end

  def play_again?
      puts "Would you like to play again? (y/n)"
      input = gets.chomp
      if input.downcase == "y"
        start_game
      elsif input.downcase == "n"
        exit
      else
        play_again
      end
  end
start_game
