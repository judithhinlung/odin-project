require './lib/tic_tac_toe'
describe Tic_tac_toe do
  let (:player1) { Player.new("Amy") }
  let (:player2) { Player.new("Victor") }
  let (:game) { Tic_tac_toe.new(player1, player2) }

  describe '#create_board' do
    it "creates the game board" do
      expect(game.create_board).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#place' do
    it "Places token on specified square" do
      game.create_board
      expect(game.place(4, "x")).to eql([0, 1, 2, 3, "x", 5, 6, 7, 8, 9])
    end

    it "Prevents a token from being placed on an occupied square" do
      game.create_board
      game.place(4, "x")
      expect(game.place(4, "x")).to eql ([0, 1, 2, 3, "x", 5, 6, 7, 8, 9])
    end

    it "handles inappropriate numbers" do
      game.create_board
      expect(game.place(12, "x")).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#checkfull' do
    it "Returns true if the game board is full" do
      board = game.create_board
      board = ["x", "x", "o", "x", "o", "x", "x", "x", "x", "x"]
      expect(game.check_full(board)).to eql(true)
    end

    it "returns false if there is still space on the board" do
      board = game.create_board
      board = ["x", "x", "o", "x", "o", "x", "x", "x", 8, 9]
      expect(game.check_full(board)).to eql(false)
    end
  end

  describe '#win_check' do
    it "Returns true if a player has three tokens in a row" do
    board = [0, "x", 2, 3, "x", 5, 6, "x", 8, 9]
    expect(game.win_check("x", board)).to eql(true)
    end

    it "Returns false if a player does not have three tokens in a row" do
    board = [0, "x", "o", "o", "x", "x", "o", "x", "o", "x"]
    expect(game.win_check("o", board)).to eql(false)
    end
  end
end
