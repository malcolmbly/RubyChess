class ChessPiece
  attr_reader :piece, :color, :available_moves

  vertical_line_moves = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  horizontal_line_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
  diagonal_line_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
  knight_moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  king_moves = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  rook_moves = [vertical_line_moves,
                vertical_line_moves.map { |move| [0, move[1] * -1] },
                horizontal_line_moves,
                horizontal_line_moves.map { |move| [move[0] * -1, 0] }].flatten(1)
  bishop_moves = [diagonal_line_moves,
                  diagonal_line_moves.map { |move| [move[0] * -1, move[1] * -1] },
                  diagonal_line_moves.map { |move| [move[0], move[1] * -1] },
                  diagonal_line_moves.map { |move| [move[0] * -1, move[1]] }].flatten(1)

  AVAILABLE_MOVES = { pawn: [@color == :white ? [0, 1] : [0, -1]],
                      knight: knight_moves,
                      rook: rook_moves,
                      bishop: bishop_moves,
                      queen: rook_moves + bishop_moves,
                      king: king_moves }.freeze

  def initialize(piece, color)
    @piece = piece
    @color = color
    @available_moves = AVAILABLE_MOVES[piece]
  end
end
