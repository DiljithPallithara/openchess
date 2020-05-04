import 'dart:collection';

import 'package:openchess/src/chess/alliance.dart';
import 'package:openchess/src/chess/board/empty_tile.dart';
import 'package:openchess/src/chess/board/tile.dart';
import 'package:openchess/src/chess/pieces/knight.dart';
import 'occupied_tile.dart';

class Board {
  UnmodifiableListView<UnmodifiableListView<Tile>> tiles;

  Board() {
    this.tiles = UnmodifiableListView([
      UnmodifiableListView([
        OccupiedTile(
          tileCoordinates: 0,
          occupiedPiece:
              Knight(piecePosition: 0, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 1,
          occupiedPiece:
              Knight(piecePosition: 1, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 2,
          occupiedPiece:
              Knight(piecePosition: 2, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 3,
          occupiedPiece:
              Knight(piecePosition: 3, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 4,
          occupiedPiece:
              Knight(piecePosition: 4, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 5,
          occupiedPiece:
              Knight(piecePosition: 5, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 6,
          occupiedPiece:
              Knight(piecePosition: 6, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 7,
          occupiedPiece:
              Knight(piecePosition: 7, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
      ]),
      UnmodifiableListView([
        EmptyTile(
          tileCoordinates: 8,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 9,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 10,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 11,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 12,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 13,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 14,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 15,
          isSelected: false,
        ),
      ]),
      UnmodifiableListView([
        EmptyTile(
          tileCoordinates: 16,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 17,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 18,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 19,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 20,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 21,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 22,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 23,
          isSelected: false,
        ),
      ]),
      UnmodifiableListView([
        EmptyTile(
          tileCoordinates: 24,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 25,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 26,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 27,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 28,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 29,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 30,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 31,
          isSelected: false,
        ),
      ]),
      UnmodifiableListView([
        EmptyTile(
          tileCoordinates: 32,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 33,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 34,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 35,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 36,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 37,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 38,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 39,
          isSelected: false,
        ),
      ]),
      UnmodifiableListView([
        EmptyTile(
          tileCoordinates: 40,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 41,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 42,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 43,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 44,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 45,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 46,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 47,
          isSelected: false,
        ),
      ]),
      UnmodifiableListView([
        EmptyTile(
          tileCoordinates: 48,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 49,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 50,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 51,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 52,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 53,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 54,
          isSelected: false,
        ),
        EmptyTile(
          tileCoordinates: 55,
          isSelected: false,
        ),
      ]),
      UnmodifiableListView([
        OccupiedTile(
          tileCoordinates: 56,
          occupiedPiece:
              Knight(piecePosition: 56, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 57,
          occupiedPiece:
              Knight(piecePosition: 57, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 58,
          occupiedPiece:
              Knight(piecePosition: 58, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 59,
          occupiedPiece:
              Knight(piecePosition: 59, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 60,
          occupiedPiece:
              Knight(piecePosition: 60, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 61,
          occupiedPiece:
              Knight(piecePosition: 61, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 62,
          occupiedPiece:
              Knight(piecePosition: 62, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 63,
          occupiedPiece:
              Knight(piecePosition: 63, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
      ]),
    ]);
  }

  List<List<Tile>> getCurrentState() {
    return tiles;
  }

  Tile getTile(int pos) {
    return tiles[pos ~/ 8][pos % 8];
  }

  bool validateMove(int piecePosition, int pos) {
    return true;
  }
}
