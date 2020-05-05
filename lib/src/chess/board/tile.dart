import 'package:openchess/src/chess/pieces/piece.dart';

abstract class Tile {
  int tileCoordinates;
  bool isSelected;

  Tile({
    this.tileCoordinates,
    this.isSelected,
  });

  bool isTileOccupied();
  
  setSelected(bool isSelected) {
    this.isSelected = isSelected;
  }
  
  bool getSelected() {
    return isSelected;
  }

  int getTileCoordinate() {
    return tileCoordinates;
  }

  void setTileCoordinate(int tileCoordinates) {
    this.tileCoordinates = tileCoordinates;
  }

  Piece getPiece();
}
