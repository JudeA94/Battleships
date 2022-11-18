require_relative './ships'

class Game
  def initialize
    patrol_boat = Ship.new(2)
    submarine = Ship.new(3)
    destroyer = Ship.new(3)
    battleship = Ship.new(4)
    carrier = Ship.new(5)
    @unplaced = [patrol_boat, submarine, destroyer, battleship, carrier]
  end

  def unplaced_ships
    @unplaced
  end

  def rows
    10
  end

  def ship_at?(x, y)
    @position.include? [x, y]
  end

  def place_ship(ship_length, ship_orientation, ship_row, ship_col)
    @position = [[ship_col, ship_row]]
    (ship_length-1).times do
      @position << (if ship_orientation == 'v'
                      [@position[-1][0],
                       @position[-1][1] + 1]
                    else
                      [@position[-1][0] + 1,
                       @position[-1][1]]
                    end)
    end
    p @position
  end

  def cols
    10
  end
end
