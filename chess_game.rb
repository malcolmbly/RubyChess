class ChessGame
  def initialize
    @board = chess_board.initialize
  end

  def get_moves(row, column)
    @board[row, column].available_moves
    'TODO: add smart logic for en passant, castling, append to available moves'
    'TODO: map current position to available moves, filter out invalid moves, provide final list'
  end

  def print_available_moves
    'TODO: Add prompting and providing possible moves'
  end
  
  def game_over?
    'TODO: check for check + checkmate, force moves'
  end
end
