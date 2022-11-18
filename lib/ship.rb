class Ship
  attr_reader :length 
  attr_accessor :placed, :sunk
  def initialize(length)
    @length = length 
    @placed = false 
    @sunk = false 
  end

  def place 
    @place = true
  end

  def sink 
    @sink = true
  end
end