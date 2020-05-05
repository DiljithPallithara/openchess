import 'package:openchess/src/chess/board/move.dart';
import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/pieces/piece.dart';

import '../alliance.dart';

class Knight extends Piece {
  Knight({int piecePosition, Alliance pieceAlliance})
      : super(piecePosition: piecePosition, pieceAlliance: pieceAlliance);

  @override
  List<Move> calculateLegalMoves(Board board) {
    return getAllKnightMovesFromCurrentPosition()
        .where((pos) =>
            board.getTile(pos).getPiece() == null ||
            board.getTile(pos).getPiece().pieceAlliance != pieceAlliance)
        .map((pos) => Move(
            previousCoordinate: piecePosition,
            newCoordinate: pos))
        .toList();
  }

  List<int> getAllKnightMovesFromCurrentPosition() {
    int row = piecePosition ~/ 8;
    int column = piecePosition % 8;
    List<int> result = [];
    if (row + 1 < 8 && column + 2 < 8) {
      result.add((row + 1) * 8 + (column + 2));
    }
    if (row + 2 < 8 && column + 1 < 8) {
      result.add((row + 2) * 8 + (column + 1));
    }
    if (row + 1 < 8 && column - 2 >= 0) {
      result.add((row + 1) * 8 + (column - 2));
    }
    if (row + 2 < 8 && column - 1 >= 0) {
      result.add((row + 2) * 8 + (column - 1));
    }
    if (row - 1 >= 0 && column + 2 < 8) {
      result.add((row - 1) * 8 + (column + 2));
    }
    if (row - 2 >= 0 && column + 1 < 8) {
      result.add((row - 2) * 8 + (column + 1));
    }
    if (row - 1 >= 0 && column - 2 >= 0) {
      result.add((row - 1) * 8 + (column - 2));
    }
    if (row - 2 >= 0 && column - 1 >= 0) {
      result.add((row - 2) * 8 + (column - 1));
    }
    return result;
  }
}
