import 'package:openchess/src/chess/board/empty_tile.dart';
import 'package:openchess/src/chess/board/move.dart';
import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/pieces/piece.dart';
import 'package:openchess/src/chess/pieces/rook.dart';

import '../alliance.dart';

class King extends Piece {

  King({int piecePosition, Alliance pieceAlliance})
      : super(piecePosition: piecePosition, pieceAlliance: pieceAlliance);

  @override
  List<Move> calculateLegalMoves(Board board) {
    List<Move> moves = getAllKingMovesFromCurrentPosition()
        .where((pos) =>
            board.getTile(pos).getPiece() == null ||
            board.getTile(pos).getPiece().pieceAlliance != pieceAlliance)
        .map((pos) => Move(
            previousCoordinate: piecePosition,
            newCoordinate: pos, 
            movedPiece: this))
        .toList();
    moves.addAll(getKingCastlingMoves(board));
    return moves;
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

  List<Move> getKingCastlingMoves(Board board) {
    List<Move> result = [];
    if (!initialPos) {
      return result;
    }
    int row = piecePosition ~/ 8;
    int column = piecePosition % 8;
    int currColumn = column - 1;
    while (currColumn >= 0 && board.getCurrentState()[row][currColumn] is EmptyTile) {
      currColumn--;
    }
    if (currColumn >= 0 && 
    board.getCurrentState()[row][currColumn].getPiece().getAlliance() == pieceAlliance && 
    board.getCurrentState()[row][currColumn].getPiece() is Rook && 
    board.getCurrentState()[row][currColumn].getPiece().isInitialPosition()) {
      int newCoordinate = row * 8 + (column - ((column - currColumn) > 1 ? 2 : 1));
      Move move = Move(movedPiece: this, newCoordinate: newCoordinate, previousCoordinate: piecePosition);
      move.setCastling(true);
      move.setRookCoordinate(row * 8 + currColumn);
      result.add(move);
    }
    currColumn = column + 1;
    while (currColumn < 8 && board.getCurrentState()[row][currColumn] is EmptyTile) {
      currColumn++;
    }
    if (currColumn < 8 && 
    board.getCurrentState()[row][currColumn].getPiece().getAlliance() == pieceAlliance && 
    board.getCurrentState()[row][currColumn].getPiece() is Rook && 
    board.getCurrentState()[row][currColumn].getPiece().isInitialPosition()) {
      int newCoordinate = row * 8 + (column + ((currColumn - column) > 1 ? 2 : 1));
      Move move = Move(movedPiece: this, newCoordinate: newCoordinate, previousCoordinate: piecePosition);
      move.setCastling(true);
      move.setRookCoordinate(row * 8 + currColumn);
      result.add(move);
    }
    return result;
  }
    
}
    
    