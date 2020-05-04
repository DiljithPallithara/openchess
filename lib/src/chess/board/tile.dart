import 'package:openchess/src/chess/pieces/piece.dart';

abstract class Tile {
  final int tileCoordinates;

  Tile({
    this.tileCoordinates,
  });

  bool isTileOccupied();
  Piece getPiece();
}
