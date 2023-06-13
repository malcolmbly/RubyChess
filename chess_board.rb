# Something about the class
require_relative './chess_piece'

class ChessBoard
  attr_reader :board

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
    @board[1] = @board[1].map { ChessPiece.new(:pawn, :white) }
    @board[6] = @board[6].map { ChessPiece.new(:pawn, :black) }
    %i[white black].map do |color|
      n = color == :white ? 0 : 7
      @board[n][0] = @board[n][7] = ChessPiece.new(:rook, color)
      @board[n][1] = @board[n][6] = ChessPiece.new(:knight, color)
      @board[n][2] = @board[n][5] = ChessPiece.new(:bishop, color)
      @board[n][3] = ChessPiece.new(:queen, color)
      @board[n][4] = ChessPiece.new(:king, color)
    end
  end

  def remove_piece(row, column)
    @board[row][column] = nil
  end

  def to_s
    @board.map do |board_row|
      puts "\n"
      board_row.map do |tile|
        tile.nil? ? puts(' ') : puts(tile)
      end
    end
  end
end
