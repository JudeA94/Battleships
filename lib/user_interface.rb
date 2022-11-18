class UserInterface
  def initialize(io, game)
    @io = io
    @game = game
    @state = true
    @hits = []
    @board = Array.new(10) { [Array.new(10, '.')] }
  end

  def run
    show "Welcome to the game!"
    show "Set up your ships first."
    show "You have these ships remaining: #{ships_unplaced_message}"
    prompt_for_ship_placement
    while @state
      show "This is your board now:"
      show format_board
      fire
    end
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    return @io.gets.chomp
  end

  def ships_unplaced_message
    return @game.unplaced_ships.map do |ship|
      "#{ship.length}"
    end.join(", ")
  end

  def prompt_for_ship_placement
    ship_length = prompt "Which do you wish to place?"
    ship_orientation = prompt "Vertical or horizontal? [vh]"
    ship_row = prompt "Which row?"
    ship_col = prompt "Which column?"
    fire 
    show "OK."
    @game.place_ship(
      length: ship_length.to_i,
      orientation: {"v" => :vertical, "h" => :horizontal}.fetch(ship_orientation),
      row: ship_row.to_i,
      col: ship_col.to_i
    )
  end
  
  def fire
    @hit_row = prompt "Which row would you like to hit?"
    @hit_col = prompt "Which col would you like to hit"
    @hits << [@hit_row.to_i, @hit_col.to_i]
    
  end

  def format_board
    return (1..@game.rows).to_a.map! do |y|
      (1..@game.cols).to_a.map! do |x|
        if @game.ship_at?(x, y) and @hits.include?([x, y])
           'X' 
        elsif !@game.ship_at?(x, y) and @hits.include?([x, y])
           'O' 
        elsif @game.ship_at?(x, y)
           "S" 
        else
           "." 
        end
      end.join
    end.join("\n")
  end
end
