import 'dart:collection';

import 'package:openchess/src/chess/alliance.dart';
import 'package:openchess/src/chess/board/empty_tile.dart';
import 'package:openchess/src/chess/board/tile.dart';
import 'package:openchess/src/chess/pieces/bishop.dart';
import 'package:openchess/src/chess/pieces/king.dart';
import 'package:openchess/src/chess/pieces/knight.dart';
import 'package:openchess/src/chess/pieces/pawn.dart';
import 'package:openchess/src/chess/pieces/piece.dart';
import 'package:openchess/src/chess/pieces/queen.dart';
import 'package:openchess/src/chess/pieces/rook.dart';
import 'move.dart';
import 'occupied_tile.dart';

class Board {
  List<List<Tile>> tiles;
  Alliance currentTurn = Alliance.WHITE;
  Piece currentPiece;

  List<Move> possibleMovePositions = [];

  Board() {
    this.tiles = [
      [
        OccupiedTile(
          tileCoordinates: 0,
          occupiedPiece:
              Rook(piecePosition: 0, pieceAlliance: Alliance.WHITE),
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
              Bishop(piecePosition: 2, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 3,
          occupiedPiece:
              Queen(piecePosition: 3, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 4,
          occupiedPiece:
              King(piecePosition: 4, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 5,
          occupiedPiece:
              Bishop(piecePosition: 5, pieceAlliance: Alliance.WHITE),
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
              Rook(piecePosition: 7, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
      ],
      [
        OccupiedTile(
          tileCoordinates: 8,
          occupiedPiece:
              Pawn(piecePosition: 8, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 9,
          occupiedPiece:
              Pawn(piecePosition: 9, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 10,
          occupiedPiece:
              Pawn(piecePosition: 10, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 11,
          occupiedPiece:
              Pawn(piecePosition: 11, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 12,
          occupiedPiece:
              Pawn(piecePosition: 12, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 13,
          occupiedPiece:
              Pawn(piecePosition: 13, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 14,
          occupiedPiece:
              Pawn(piecePosition: 14, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 15,
          occupiedPiece:
              Pawn(piecePosition: 15, pieceAlliance: Alliance.WHITE),
          isSelected: false,
        ),
      ],
      [
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
      ],
      [
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
      ],
      [
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
      ],
      [
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
      ],
      [
        OccupiedTile(
          tileCoordinates: 48,
          occupiedPiece:
              Pawn(piecePosition: 48, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 49,
          occupiedPiece:
              Pawn(piecePosition: 49, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 50,
          occupiedPiece:
              Pawn(piecePosition: 50, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 51,
          occupiedPiece:
              Pawn(piecePosition: 51, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 52,
          occupiedPiece:
              Pawn(piecePosition: 52, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 53,
          occupiedPiece:
              Pawn(piecePosition: 53, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 54,
          occupiedPiece:
              Pawn(piecePosition: 54, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 55,
          occupiedPiece:
              Pawn(piecePosition: 55, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
      ],
      [
        OccupiedTile(
          tileCoordinates: 56,
          occupiedPiece:
              Rook(piecePosition: 56, pieceAlliance: Alliance.BLACK),
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
              Bishop(piecePosition: 58, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 59,
          occupiedPiece:
              Queen(piecePosition: 59, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 60,
          occupiedPiece:
              King(piecePosition: 60, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
        OccupiedTile(
          tileCoordinates: 61,
          occupiedPiece:
              Bishop(piecePosition: 61, pieceAlliance: Alliance.BLACK),
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
              Rook(piecePosition: 63, pieceAlliance: Alliance.BLACK),
          isSelected: false,
        ),
      ],
    ];
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

  Alliance getWhoseTurn() {
    return currentTurn;
  }

  void setTurn(Alliance currentTurn) {
    this.currentTurn = currentTurn;
  }

  void findAllPossibleMovesFrom(Tile tile) {
    if (currentPiece != null) {
      for (Move move in possibleMovePositions) {
        if(move.getPreviousCordinate() == tile.getTileCoordinate()) {
          makeMove(move);
          currentPiece = null;
          possibleMovePositions = [];
          tiles.forEach((e) => e.forEach((f) => f.setSelected(false)));
          return;
        }
      }
    }
    possibleMovePositions = [];
    tiles.forEach((e) => e.forEach((f) => f.setSelected(false)));
    if (tile is OccupiedTile) {
      currentPiece = tile.getPiece();
      possibleMovePositions.addAll(tile.getPiece().calculateLegalMoves(this));
      possibleMovePositions.where((move) => checkOtherConditions(tile)).forEach((e) => tiles[e.newCoordinate ~/ 8][e.newCoordinate % 8].setSelected(true));
    }
  }

  bool checkOtherConditions(Tile tile) {
    return tile.getPiece().getAlliance() == currentTurn;
  }

  void makeMove(Move move) {
    int currentPos = move.getPreviousCordinate();
    int newPos = move.getNewCoordinate();
    tiles[newPos ~/ 8][newPos % 8] = tiles[currentPos ~/ 8][currentPos % 8];
    tiles[currentPos ~/ 8][currentPos % 8] = 
        EmptyTile(
          tileCoordinates: currentPos,
          isSelected: false,
        );
  }

}
