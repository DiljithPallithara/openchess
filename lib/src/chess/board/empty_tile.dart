import 'package:openchess/src/chess/board/tile.dart';
import 'package:openchess/src/chess/pieces/piece.dart';

class EmptyTile extends Tile {
  EmptyTile({int tileCoordinates}) : super(tileCoordinates: tileCoordinates);

  @override
  Piece getPiece() {
    return null;
  }

  @override
  bool isTileOccupied() {
    return false;
  }
}
