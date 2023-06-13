class ChessPiece
  attr_reader :piece, :color

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

  POSSIBLE_MOVES = { pawn: { white: [0, 1], black: [0, -1] },
                     knight: knight_moves,
                     rook: rook_moves,
                     bishop: bishop_moves,
                     queen: rook_moves + bishop_moves,
                     king: king_moves }.freeze

  PIECE_UNICODE = { pawn: { white: "\u2659", black: "\u265f" },
                    knight: { white: "\u2658", black: "\u265e" },
                    rook: { white: "\u2656", black: "\u265c" },
                    bishop: { white: "\u2657", black: "\u265d" },
                    queen: { white: "\u2655", black: "\u265b" },
                    king: { white: "\u2654", black: "\u265a" } }.freeze

  def initialize(piece, color)
    @piece = piece
    @color = color
    @possible_moves = possible_moves
  end

  def possible_moves
    @piece == :pawn ? POSSIBLE_MOVES[@piece][@color] : POSSIBLE_MOVES[@piece]
  end

  def to_s
    PIECE_UNICODE[@piece][@color].encode
  end
end
