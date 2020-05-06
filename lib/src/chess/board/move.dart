import 'package:openchess/src/chess/pieces/piece.dart';

class Move {
  final int previousCoordinate;
  final int newCoordinate;
  final Piece movedPiece;
  bool isCastling = false;
  bool isEnpassant = false;
  int rookCoordinate = -1;

  Move({
    this.previousCoordinate,
    this.newCoordinate, 
    this.movedPiece
  });

  bool getCastling() {
    return isCastling;
  }

  int getRookCoordinate() {
    return rookCoordinate;
  }

  bool getEnpassant() {
    return isEnpassant;
  }

  Piece getMovedPiece() {
    return movedPiece;
  }

  void setCastling(bool isCastling) {
    this.isCastling = isCastling;
  }

  void setRookCoordinate(int rookCoordinate) {
    this.rookCoordinate = rookCoordinate;
  }

  void setEnPassant(bool isEnpassant) {
    this.isEnpassant = isEnpassant;
  }

  int getPreviousCoordinate() {
    return previousCoordinate;
  }

  int getNewCoordinate() {
    return newCoordinate;
  }

}
