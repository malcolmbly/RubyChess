# Something about the class
class ChessBoard
  def initialize
    row = Array.new(8)
    @board = Array.new(8, row)
    place_pieces
  end

  def get_piece_at(row, column)
    @board[row, column]
  end

  def move_piece(from_tile, to_tile)
    @board[to_tile] = @board[from_tile]
    @board[from_tile] = nil
  end

  def valid_move?(from_tile, to_tile)
    on_board(from_tile) && on_board(to_tile)
  end

  def on_board?(row, column)
    row >= 0 && row <= 7 && column >= 0 && column <= 7
  end

  def place_pieces
    @board[1] = @board[1].map { ChessPiece.new(:pawn, 'white') }
    @board[6] = @board[6].map { ChessPiece.new(:pawn, 'black') }

  end
end
