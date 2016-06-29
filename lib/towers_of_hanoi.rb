# Towers of Hanoi
#
# Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi

class TowersOfHanoi
  attr_reader :towers

  def initialize(t1 = [3, 2, 1], t2 = [], t3 = [])
    @towers = [t1, t2, t3]
  end

  def move(from_tower, to_tower)
    @towers[to_tower] << @towers[from_tower].pop
  end

  def valid_move?(from_tower, to_tower)
    return false if @towers[from_tower].empty?
    return false if !@towers[to_tower].last.nil? && @towers[from_tower].last > @towers[to_tower].last
    true
  end

  def won?
    if @towers[0].empty? && @towers[1].empty?
      true
    elsif @towers[0].empty? && @towers[2].empty?
      true
    else
      false
    end
  end


  def play
    puts "You've begun the game! Type (move tower #, to tower #) coordinates without the braces but with a comma to move the discs. Example: \"1,3\" will move the last item on the first tower to the third tower"
    until won?
      u_input = gets.chomp.split(',').map(&:to_i)
      if valid_move?(u_input[0]-1, u_input[1]-1)
        move(u_input[0]-1, u_input[1]-1)
      else
        puts 'Invalid input'
      end
      p @towers
    end
    puts "You won!"
  end
end


if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
