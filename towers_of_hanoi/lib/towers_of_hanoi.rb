require 'byebug'

class TowersOfHanoi
  attr_accessor :towers, :turns

  def initialize
    @towers = [[3,2,1], [], []]
    @turns = 0
  end

  def move(start, finish)
    raise "Invalid start position" if !start.between?(0,2) || towers[start].empty?
    raise 'Invalid end position' unless finish.between?(0,2)

    unless towers[finish].empty?
      raise ArgumentError.new("Invalid move") if towers[start].last > towers[finish].last
    end

    @towers[finish] << @towers[start].pop
  end

  def won?
    return true if towers[1].length == 3 || towers[2].length == 3
    false
  end

  def run
    until won?
      run_turn
    end
    puts "Congratulations!  You won!"
  end

  def run_turn
    start, finish = get_move
    move(start, finish  )
  rescue
    puts "Invalid input"
    retry
  end

  def get_move
    display
    puts "Where do you want to move the disk to: start, end"
    gets.chomp.split(",").map { |el| Integer(el.strip) }
  end

  def display
    puts towers.inspect
  end
end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.run
end
