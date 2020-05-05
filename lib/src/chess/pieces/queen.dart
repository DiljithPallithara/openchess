import 'package:openchess/src/chess/board/move.dart';
import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/occupied_tile.dart';
import 'package:openchess/src/chess/pieces/piece.dart';

import '../alliance.dart';

class Queen extends Piece { 
  Queen({int piecePosition, Alliance pieceAlliance})
      : super(piecePosition: piecePosition, pieceAlliance: pieceAlliance);

  @override
  List<Move> calculateLegalMoves(Board board) {
    return getAllQueenMovesFromCurrentPosition(board)
        .where((pos) =>
            board.getTile(pos).getPiece() == null ||
            board.getTile(pos).getPiece().pieceAlliance != pieceAlliance)
        .where((pos) => board.validateMove(piecePosition, pos))
        .map((pos) => Move(
            previousCoordinate: piecePosition,
            newCoordinate: pos))
        .toList();
  }

  List<int> getAllQueenMovesFromCurrentPosition(Board board) {
    int row = piecePosition ~/ 8;
    int column = piecePosition % 8;
    List<int> result = [];
    int currRow = row;
    while (true) {
      currRow++;
      if (currRow >= 8 || 
      (board.getCurrentState()[currRow][column] is OccupiedTile && 
      board.getCurrentState()[currRow][column].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(currRow * 8 + column);
      if(board.getCurrentState()[currRow][column] is OccupiedTile && 
      board.getCurrentState()[currRow][column].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    currRow = row;
    while (true) {
      currRow--;
      if (currRow < 0 || 
      (board.getCurrentState()[currRow][column] is OccupiedTile && 
      board.getCurrentState()[currRow][column].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(currRow * 8 + column);
      if(board.getCurrentState()[currRow][column] is OccupiedTile && 
      board.getCurrentState()[currRow][column].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    int currCol = column;
    while (true) {
      currCol--;
      if (currCol < 0 || 
      (board.getCurrentState()[row][currCol] is OccupiedTile && 
      board.getCurrentState()[row][currCol].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(row * 8 + currCol);
      if(board.getCurrentState()[row][currCol] is OccupiedTile && 
      board.getCurrentState()[row][currCol].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    currCol = column;
    while (true) {
      currCol++;
      if (currCol >= 8 || 
      (board.getCurrentState()[row][currCol] is OccupiedTile && 
      board.getCurrentState()[row][currCol].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(row * 8 + currCol);
      if(board.getCurrentState()[row][currCol] is OccupiedTile && 
      board.getCurrentState()[row][currCol].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    currRow = row;
    currCol = column;
    while (true) {
      currRow++;
      currCol++;
      if (currRow >= 8 || currCol >= 8 || 
      (board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(currRow * 8 + currCol);
      if(board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    currRow = row;
    currCol = column;
    while (true) {
      currRow--;
      currCol++;
      if (currRow < 0 || currCol >= 8 || 
      (board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(currRow * 8 + currCol);
      if(board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    currRow = row;
    currCol = column;
    while (true) {
      currRow++;
      currCol--;
      if (currRow >= 8 || currCol < 0 || 
      (board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(currRow * 8 + currCol);
      if(board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    currRow = row;
    currCol = column;
    while (true) {
      currRow--;
      currCol--;
      if (currRow < 0 || currCol < 0 || 
      (board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() == pieceAlliance)){
        break;
      }
      result.add(currRow * 8 + currCol);
      if(board.getCurrentState()[currRow][currCol] is OccupiedTile && 
      board.getCurrentState()[currRow][currCol].getPiece().getAlliance() != pieceAlliance) {
        break;
      }
    }
    return result;
  }

}