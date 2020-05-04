import 'package:openchess/src/chess/pieces/piece.dart';

class Move {
  Piece movedPiece;
  Piece capturedPiece;
  int previousCoordinate;
  int newCoordinate;

  Move({
    this.movedPiece,
    this.capturedPiece,
    this.previousCoordinate,
    this.newCoordinate,
  });
}
