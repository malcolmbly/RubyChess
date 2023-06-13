require 'chess_game'

RSpec.describe ChessBoard do
  describe '#initialize' do
    it 'creates the correct starting board' do
      board = ChessBoard.new
      expect(board[0].map(&:piece)).to eql(%i[rook knight bishop queen king bishop knight rook])
      expect(board[7].map(&:piece)).to eql(%i[rook knight bishop queen king bishop knight rook])
      expect(board[1].map(&:piece)).to eql(Array.new(8, :pawn))
      expect(board[1].map(&:piece)).to eql(Array.new(8, :pawn))
    end
  end
end
