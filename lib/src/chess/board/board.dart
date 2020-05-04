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
                Knight(piecePosition: 0, pieceAlliance: Alliance.WHITE)),
        OccupiedTile(
            tileCoordinates: 1,
            occupiedPiece:
                Knight(piecePosition: 1, pieceAlliance: Alliance.WHITE)),
        OccupiedTile(
            tileCoordinates: 2,
            occupiedPiece:
                Knight(piecePosition: 2, pieceAlliance: Alliance.WHITE)),
        OccupiedTile(
            tileCoordinates: 3,
            occupiedPiece:
                Knight(piecePosition: 3, pieceAlliance: Alliance.WHITE)),
        OccupiedTile(
            tileCoordinates: 4,
            occupiedPiece:
                Knight(piecePosition: 4, pieceAlliance: Alliance.WHITE)),
        OccupiedTile(
            tileCoordinates: 5,
            occupiedPiece:
                Knight(piecePosition: 5, pieceAlliance: Alliance.WHITE)),
        OccupiedTile(
            tileCoordinates: 6,
            occupiedPiece:
                Knight(piecePosition: 6, pieceAlliance: Alliance.WHITE)),
        OccupiedTile(
            tileCoordinates: 7,
            occupiedPiece:
                Knight(piecePosition: 7, pieceAlliance: Alliance.WHITE)),
      ]),
      UnmodifiableListView([
        EmptyTile(tileCoordinates: 8),
        EmptyTile(tileCoordinates: 9),
        EmptyTile(tileCoordinates: 10),
        EmptyTile(tileCoordinates: 11),
        EmptyTile(tileCoordinates: 12),
        EmptyTile(tileCoordinates: 13),
        EmptyTile(tileCoordinates: 14),
        EmptyTile(tileCoordinates: 15),
      ]),
      UnmodifiableListView([
        EmptyTile(tileCoordinates: 16),
        EmptyTile(tileCoordinates: 17),
        EmptyTile(tileCoordinates: 18),
        EmptyTile(tileCoordinates: 19),
        EmptyTile(tileCoordinates: 20),
        EmptyTile(tileCoordinates: 21),
        EmptyTile(tileCoordinates: 22),
        EmptyTile(tileCoordinates: 23),
      ]),
      UnmodifiableListView([
        EmptyTile(tileCoordinates: 24),
        EmptyTile(tileCoordinates: 25),
        EmptyTile(tileCoordinates: 26),
        EmptyTile(tileCoordinates: 27),
        EmptyTile(tileCoordinates: 28),
        EmptyTile(tileCoordinates: 29),
        EmptyTile(tileCoordinates: 30),
        EmptyTile(tileCoordinates: 31),
      ]),
      UnmodifiableListView([
        EmptyTile(tileCoordinates: 32),
        EmptyTile(tileCoordinates: 33),
        EmptyTile(tileCoordinates: 34),
        EmptyTile(tileCoordinates: 35),
        EmptyTile(tileCoordinates: 36),
        EmptyTile(tileCoordinates: 37),
        EmptyTile(tileCoordinates: 38),
        EmptyTile(tileCoordinates: 39),
      ]),
      UnmodifiableListView([
        EmptyTile(tileCoordinates: 40),
        EmptyTile(tileCoordinates: 41),
        EmptyTile(tileCoordinates: 42),
        EmptyTile(tileCoordinates: 43),
        EmptyTile(tileCoordinates: 44),
        EmptyTile(tileCoordinates: 45),
        EmptyTile(tileCoordinates: 46),
        EmptyTile(tileCoordinates: 47),
      ]),
      UnmodifiableListView([
        EmptyTile(tileCoordinates: 48),
        EmptyTile(tileCoordinates: 49),
        EmptyTile(tileCoordinates: 50),
        EmptyTile(tileCoordinates: 51),
        EmptyTile(tileCoordinates: 52),
        EmptyTile(tileCoordinates: 53),
        EmptyTile(tileCoordinates: 54),
        EmptyTile(tileCoordinates: 55),
      ]),
      UnmodifiableListView([
        OccupiedTile(
            tileCoordinates: 56,
            occupiedPiece:
                Knight(piecePosition: 56, pieceAlliance: Alliance.BLACK)),
        OccupiedTile(
            tileCoordinates: 57,
            occupiedPiece:
                Knight(piecePosition: 57, pieceAlliance: Alliance.BLACK)),
        OccupiedTile(
            tileCoordinates: 58,
            occupiedPiece:
                Knight(piecePosition: 58, pieceAlliance: Alliance.BLACK)),
        OccupiedTile(
            tileCoordinates: 59,
            occupiedPiece:
                Knight(piecePosition: 59, pieceAlliance: Alliance.BLACK)),
        OccupiedTile(
            tileCoordinates: 60,
            occupiedPiece:
                Knight(piecePosition: 60, pieceAlliance: Alliance.BLACK)),
        OccupiedTile(
            tileCoordinates: 61,
            occupiedPiece:
                Knight(piecePosition: 61, pieceAlliance: Alliance.BLACK)),
        OccupiedTile(
            tileCoordinates: 62,
            occupiedPiece:
                Knight(piecePosition: 62, pieceAlliance: Alliance.BLACK)),
        OccupiedTile(
            tileCoordinates: 63,
            occupiedPiece:
                Knight(piecePosition: 63, pieceAlliance: Alliance.BLACK)),
      ]),
    ]);
  }

  List<List<Tile>> getCurrentState() {
    return tiles;
  }

  Tile getTile(int pos) {
    return null;
  }

  bool validateMove(int piecePosition, int pos) {
    return true;
  }
}
