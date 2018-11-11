require './lib/connect_four'
describe Connect_four do
  let (:player1) { Player.new("Amy") }
  let (:player2) { Player.new("Victor") }
  let (:game) { Connect_four.new(player1, player2) }

  describe '#create_board' do
    it "creates the game board" do
      expect(game.create_board).to eql(
    ["x", 1, 2, 3, 4, 5, 6, 7,
    8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21,
    22, 23, 24, 25, 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42])
    end
  end

  describe '#place' do
    it "Places token on specified square" do
      game.create_board
      expect(game.place(4, "x")).to eql(
    ["x", 1, 2, 3, "x", 5, 6, 7,
    8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21,
    22, 23, 24, 25, 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42])
    end

    it "Prevents a token from being placed on an occupied square" do
      game.create_board
      game.place(4, "x")
      expect(game.place(4, "x")).to eql (
    ["x", 1, 2, 3, "x", 5, 6, 7,
    8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21,
    22, 23, 24, 25, 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42])
    end

    it "handles inappropriate numbers" do
      game.create_board
      expect(game.place(43, "x")).to eql(
    ["x", 1, 2, 3, 4, 5, 6, 7,
    8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21,
    22, 23, 24, 25, 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42])
    end
  end

  describe '#checkfull' do
    it "Returns true if the game board is full" do
      board = game.create_board
      board = ["x", "x", "o", "x", "o", "x", "x", "x", "x", "o", "o", "o", "o",  "x", "x", "x", "o", "o", "o", "o", "x", "x", "x", "o", "o", "o", "o", "x", "x", "x", "o", "o", "o", "o", "x", "x", "x", "o", "o", "o", "o", "x", "x", "x", "o", "o", "o", "o", "x", "x"]
      expect(game.check_full(board)).to eql(true)
    end

    it "returns false if there is still space on the board" do
      board = ["x", "x", "o", "x", "o", "x", "x", "x",
        "x", "o", "o", "o", "o", "x", "x",
        "x", "o", "o", "o", "o", "x", "x",
        "x", "o", "o", "o", "o", "x", "x",
        "x", "o", "o", "o", "o", "x", "x",
        "x", "o", "o", "o", "o", "x", "x",
        "x", "o", "o", "o", "o", "x", 42]
      board = ["x", "x", "o", "x", "o", "x", "x", "x", 8, 9]
      expect(game.check_full(board)).to eql(false)
    end
  end

  describe '#win_check' do
    it "Returns true if a player has four tokens in a row" do
    board = ["x", "x", "x", "x", "x", 5, 6, 7,
    8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21,
    22, 23, 24, 25, 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42]
    expect(game.win_check("x", board)).to eql(true)
    end

    it "Returns true if a player has four tokens in a column" do
    board = ["x", 1, 2, 3, "x", 5, 6, 7,
    8, 9, 10, "x", 12, 13, 14,
    15, 16, 17, "x", 19, 20, 21,
    22, 23, 24, "x", 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42]
    expect(game.win_check("x", board)).to eql(true)
    end

    it "Returns true if a player has four tokens in a diagonal" do
    board = ["x", "x", 2, 3, "x", 5, 6, 7,
    8, "x", 10, "x", 12, 13, 14,
    15, 16, "x", 18, 19, 20, 21,
    22, 23, 24, "x", 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42]
    expect(game.win_check("x", board)).to eql(true)
    end

    it "Returns false if a player does not have three tokens in a row" do
    board = ["x", 1, 2, 3, 4, 5, 6, 7,
    8, 9, 10, "x", 12, 13, 14,
    15, 16, 17, "x", 19, 20, 21,
    22, 23, 24, "x", 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42]
    expect(game.win_check("x", board)).to eql(false)
    end
  end
end
