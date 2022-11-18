require_relative './ship.rb'

class Game
  attr_accessor :ships
  def initialize
    ship1 = Ship.new(2)
    ship2 = Ship.new(3)
    ship3 = Ship.new(3)
    ship4 = Ship.new(4)
    ship5 = Ship.new(5)
    @ships = [ship1, ship2, ship3, ship4, ship5]
    @rows = 10
    @cols = 10
  end
  
  def unplaced_ships
    @ships.select { |ship| ship.placed == false }
  end

  def rows
    @rows
  end

  def cols
    @cols
  end

  def place_ship(ship_data)
    col = ship_data[:col]
    height = ship_data[:row]
    length = ship_data[:length]
    @ship_coords = [[col, height]]
    (length - 1).times do
      if ship_data[:orientation] == :vertical
        @ship_coords << [@ship_coords[-1][0], @ship_coords[-1][1] + 1]
      else
        @ship_coords << [@ship_coords[-1][0] + 1, @ship_coords[-1][1]]
      end
    end
  end

  def ship_at?(x,y)
    @ship_coords.include?([x,y])
  end
end
