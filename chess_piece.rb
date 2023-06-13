class ChessPiece
  attr_reader :piece, :color
  vertical_line_moves = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  horizontal_line_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
  diagonal_line_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
  AVAILABLE_MOVES = { pawn: [[0, 1]],
                      knight: [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]],
                      rook: [vertical_line_moves, vertical_line_moves.map { |move| [0, move[1] * -1] },
                             horizontal_line_moves, horizontal_line_moves.map { |move| [move[0] * -1, 0] }],
                      bishop: [diagonal_line_moves, diagonal_line_moves.map { |move|  },
                               diagonal_line_moves.map { |move|  }] }.flatten(1).freeze

  def initialize(piece, color)
    @piece = piece
    @color = color

  end

end