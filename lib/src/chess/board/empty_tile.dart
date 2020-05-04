import 'package:openchess/src/chess/board/tile.dart';
import 'package:openchess/src/chess/pieces/piece.dart';

class EmptyTile extends Tile {
  EmptyTile({int tileCoordinates, bool isSelected}) : super(tileCoordinates: tileCoordinates, isSelected: isSelected);

  @override
  Piece getPiece() {
    return null;
  }

  @override
  bool isTileOccupied() {
    return false;
  }
}
