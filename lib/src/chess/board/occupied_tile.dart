import 'package:openchess/src/chess/board/tile.dart';
import 'package:openchess/src/chess/pieces/piece.dart';

class OccupiedTile extends Tile {
  Piece occupiedPiece;

  OccupiedTile({int tileCoordinates, Piece occupiedPiece, bool isSelected})
      : super(tileCoordinates: tileCoordinates, isSelected: isSelected) {
        this.occupiedPiece = occupiedPiece;
      }

  @override
  Piece getPiece() {
    return occupiedPiece;
  }

  @override
  bool isTileOccupied() {
    return true;
  }
}
