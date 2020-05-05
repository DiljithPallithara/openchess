import 'package:openchess/src/chess/board/move.dart';
import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/pieces/piece.dart';

import '../alliance.dart';

class King extends Piece { 
  King({int piecePosition, Alliance pieceAlliance})
      : super(piecePosition: piecePosition, pieceAlliance: pieceAlliance);

  @override
  List<Move> calculateLegalMoves(Board board) {
    return getAllKingMovesFromCurrentPosition()
        .where((pos) =>
            board.getTile(pos).getPiece() == null ||
            board.getTile(pos).getPiece().pieceAlliance != pieceAlliance)
        .where((pos) => board.validateMove(piecePosition, pos))
        .map((pos) => Move(
            previousCoordinate: piecePosition,
            newCoordinate: pos))
        .toList();
  }

  List<int> getAllKingMovesFromCurrentPosition() {
    int row = piecePosition ~/ 8;
    int column = piecePosition % 8;
    List<int> result = [];
    if (row + 1 < 8 && column + 1 < 8) {
      result.add((row + 1) * 8 + column + 1);
    }
    if (row + 1 < 8 && column - 1 >= 0) {
      result.add((row + 1) * 8 + column - 1);
    }
    if (row - 1 >= 0 && column + 1 < 8) {
      result.add((row - 1) * 8 + column + 1);
    }
    if (row - 1 >= 0 && column - 1 >= 0) {
      result.add((row - 1) * 8 + column - 1);
    }
    if (row - 1 >= 0) {
      result.add((row - 1) * 8 + column);
    }
    if (row + 1 < 8) {
      result.add((row + 1) * 8 + column);
    }
    if (column - 1 >= 0) {
      result.add(row * 8 + column - 1);
    }
    if (column + 1 < 8) {
      result.add(row * 8 + column + 1);
    }
    return result;
  }

}