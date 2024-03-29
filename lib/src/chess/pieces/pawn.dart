import 'package:openchess/src/chess/board/empty_tile.dart';
import 'package:openchess/src/chess/board/move.dart';
import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/occupied_tile.dart';
import 'package:openchess/src/chess/pieces/piece.dart';

import '../alliance.dart';

class Pawn extends Piece {
  Pawn({int piecePosition, Alliance pieceAlliance})
      : super(piecePosition: piecePosition, pieceAlliance: pieceAlliance);

  @override
  List<Move> calculateLegalMoves(Board board) {
    List<Move> moves =  getAllPawnMovesFromCurrentPosition(board)
        .map((pos) => Move(
            previousCoordinate: piecePosition,
            newCoordinate: pos, 
            movedPiece: this))
        .toList();
    moves.addAll(getPawnEnPassantMove(board));
    return moves;
  }
        
  List<int> getAllPawnMovesFromCurrentPosition(Board board) {
    int row = piecePosition ~/ 8;
    int column = piecePosition % 8;
    List<int> result = [];
    int adder = getAlliance() == Alliance.WHITE ? 1 : -1; 
    if (row + adder < 8 && row + adder >= 0 && board.getCurrentState()[row + adder][column] is EmptyTile) {
      result.add((row + adder) * 8 + column);
      if (initialPos && row + adder + adder < 8 && row + adder + adder >= 0 && board.getCurrentState()[row + adder + adder][column] is EmptyTile) {
        result.add((row + adder + adder) * 8 + column);
      }
    }
    if (row + adder < 8 && row + adder >= 0 && column + 1 < 8 && 
    board.getCurrentState()[row + adder][column + 1] is OccupiedTile && 
    board.getCurrentState()[row + adder][column + 1].getPiece().getAlliance() != pieceAlliance) {
      result.add((row + adder) * 8 + column + 1);
    } 
    if (row + adder < 8 && row + adder >= 0 && column - 1 >= 0 && 
    board.getCurrentState()[row + adder][column - 1] is OccupiedTile && 
    board.getCurrentState()[row + adder][column - 1].getPiece().getAlliance() != getAlliance()) {
      result.add((row + adder) * 8 + column - 1);
    }
    return result;
  }

  List<Move> getPawnEnPassantMove(Board board) {
    int row = piecePosition ~/ 8;
    int column = piecePosition % 8;
    List<Move> ret = [];
    if (row != (pieceAlliance == Alliance.WHITE ? 4 : 3)) {
      return ret;
    }
    if (!(board.getPreviousPlay().getMovedPiece() is Pawn)) {
      return ret;
    }
    if (board.getPreviousPlay().getPreviousCoordinate() ~/ 8 != (pieceAlliance == Alliance.WHITE ? 6 : 1)) {
      return ret;
    }
    if (board.getPreviousPlay().getNewCoordinate() ~/ 8 != (pieceAlliance == Alliance.WHITE ? 4 : 3)) {
      return ret;
    }
    int newRow = ((board.getPreviousPlay().getNewCoordinate() ~/ 8) + (board.getPreviousPlay().getPreviousCoordinate() ~/ 8)) ~/ 2;
    int newCol = board.getPreviousPlay().getNewCoordinate() % 8;
    if (board.getPreviousPlay().getNewCoordinate() % 8 == column + 1 || 
    board.getPreviousPlay().getNewCoordinate() % 8 == column - 1) {
      Move move = new Move(movedPiece: this, previousCoordinate: piecePosition, newCoordinate: newRow * 8 + newCol);
      move.setEnPassant(true);
      ret.add(move);
    }
    return ret;
  }

}