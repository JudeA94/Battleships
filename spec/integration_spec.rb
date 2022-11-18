require 'game'
require 'user_interface'
require 'ship'

describe 'integration tests' do 
  describe 'ship setup' do 
      it "allows the user to set up ships" do
        game = Game.new
        interface = UserInterface.new(Kernel, game)
        expect(Kernel).to receive(:puts).with("Welcome to the game!")
        expect(Kernel).to receive(:puts).with("Set up your ships first.")
        expect(game).to receive(:unplaced_ships).and_return(game.ships)
        expect(Kernel).to receive(:puts).with("You have these ships remaining: 2, 3, 3, 4, 5")
        expect(Kernel).to receive(:puts).with("Which do you wish to place?")
        expect(Kernel).to receive(:gets).and_return("2\n")
        expect(Kernel).to receive(:puts).with("Vertical or horizontal? [vh]")
        expect(Kernel).to receive(:gets).and_return("v\n")
        expect(Kernel).to receive(:puts).with("Which row?")
        expect(Kernel).to receive(:gets).and_return("3\n")
        expect(Kernel).to receive(:puts).with("Which column?")
        expect(Kernel).to receive(:gets).and_return("2\n")
        expect(Kernel).to receive(:puts).with("OK.")
        expect(game).to receive(:place_ship).with({
          length: 2,
          orientation: :vertical,
          row: 3,
          col: 2
        })
        expect(Kernel).to receive(:puts).with("This is your board now:")
        allow(game).to receive(:ship_at?).and_return(false)
        allow(game).to receive(:ship_at?).with(2, 3).and_return(true)
        allow(game).to receive(:ship_at?).with(2, 4).and_return(true)
        expect(Kernel).to receive(:puts).with([
          "..........",
          "..........",
          ".S........",
          ".S........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          ".........."
        ].join("\n"))
        interface.run
      end
    end
end
