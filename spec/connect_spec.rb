require "./lib/connect.rb"

describe GameBoard do
subject(:game_board) { described_class.new }

  describe "#initialize" do
    context "GameBoard class will initializes a board" do
      it "is an array of six arrays" do
        expect(game_board.board.length).to eql(6)
      end

      it "has six arrays of six o's" do
        expect(game_board.board[0].length).to eql(6)
      end
    end
  end
end