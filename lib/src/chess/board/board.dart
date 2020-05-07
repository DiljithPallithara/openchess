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
  Move previousPlay;

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

  Alliance getWhoseTurn() {
    return currentTurn;
  }

  void setTurn(Alliance currentTurn) {
    this.currentTurn = currentTurn;
  }

  Move getPreviousPlay() {
    return previousPlay;
  }

  void findAllPossibleMovesFrom(Tile tile) {
    if (currentPiece != null) {
      for (Move move in possibleMovePositions) {
        if(move.getNewCoordinate() == tile.getTileCoordinate()) {
          makeMove(move);
          currentPiece = null;
          possibleMovePositions = [];
          tiles.forEach((e) => e.forEach((f) => f.setSelected(false)));
          return;
        }
      }
      currentPiece = null;
      possibleMovePositions = [];
      tiles.forEach((e) => e.forEach((f) => f.setSelected(false)));
      findAllPossibleMovesFrom(tile);
    }
    possibleMovePositions = [];
    tiles.forEach((e) => e.forEach((f) => f.setSelected(false)));
    if (tile is OccupiedTile) {
      if (tile.getPiece().getAlliance() != currentTurn) {
        return;
      }
      currentPiece = tile.getPiece();
      possibleMovePositions.addAll(tile.getPiece().calculateLegalMoves(this).where((move) => validateMove(move)).toList());
      possibleMovePositions.forEach((e) => tiles[e.newCoordinate ~/ 8][e.newCoordinate % 8].setSelected(true));
    }
  }
      
  void makeMove(Move move) {
    int currentPos = move.getPreviousCoordinate();
    int newPos = move.getNewCoordinate();
    tiles[newPos ~/ 8][newPos % 8] = tiles[currentPos ~/ 8][currentPos % 8];
    tiles[newPos ~/ 8][newPos % 8].getPiece().setPiecePosition(newPos);
    tiles[newPos ~/ 8][newPos % 8].getPiece().setInitialPosition(false);
    tiles[newPos ~/ 8][newPos % 8].setTileCoordinate(newPos);
    tiles[currentPos ~/ 8][currentPos % 8] = 
        EmptyTile(
          tileCoordinates: currentPos,
          isSelected: false,
        );
    if (move.getEnpassant()) {
      tiles[previousPlay.getNewCoordinate() ~/ 8][previousPlay.getNewCoordinate() % 8] = EmptyTile(
          tileCoordinates: previousPlay.getNewCoordinate(),
          isSelected: false,
        );
    } else if (move.getCastling()) {
      int currentRookPos = move.getRookCoordinate();
      int newRookPos = (newPos > move.getRookCoordinate() ? newPos + 1 : newPos - 1);
      tiles[newRookPos ~/ 8][newRookPos % 8] = tiles[currentRookPos ~/ 8][currentRookPos % 8];
      tiles[newRookPos ~/ 8][newRookPos % 8].getPiece().setPiecePosition(newRookPos);
      tiles[newRookPos ~/ 8][newRookPos % 8].getPiece().setInitialPosition(false);
      tiles[newRookPos ~/ 8][newRookPos % 8].setTileCoordinate(newRookPos);
      tiles[currentRookPos ~/ 8][currentRookPos % 8] = 
          EmptyTile(
            tileCoordinates: currentRookPos,
            isSelected: false,
          );
    }
    currentTurn = currentTurn == Alliance.WHITE ? Alliance.BLACK : Alliance.WHITE;
    previousPlay = move;
  }
      
  bool checkIfGameOver() {
    for(List<Tile> tilesList in tiles) {
      for(Tile tile in tilesList) {
        if (tile is EmptyTile && tile.getPiece().getAlliance() != currentTurn) {
          continue;
        }
        if (tile.getPiece().calculateLegalMoves(this).where((move) => validateMove(move)).toList() != []) {
          return false;
        }
      }
    }
    return true;
  }
      
  bool isKingInCheck(Alliance alliance, List<List<int>> tilesArray) {
    int counter = 0;
    int kingPos;
    for (List<int> tilesList in tilesArray) {
      for (int tile in tilesList) {
        if (tile == (alliance == Alliance.WHITE ? 1 : 2)) {
          kingPos = counter;
        }
        counter++;
      }
    }
    int row = kingPos ~/ 8;
    int column = kingPos % 8;
    return kingCheckWithPawn(row, column, alliance, tilesArray) || kingCheckWithKnight(row, column, alliance, tilesArray) || 
    kingCheckWithBishopOrQueen(row, column, alliance, tilesArray) || kingCheckWithRookOrQueen(row, column, alliance, tilesArray) ||
    kingCheckWithKing(row, column, alliance, tilesArray);
  }

  bool kingCheckWithKing(int row, int column, Alliance alliance, List<List<int>> tilesArray) {
    if (row + 1 < 8 && tilesArray[row + 1][column] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    if (column + 1 < 8 && tilesArray[row][column + 1] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    if (row + 1 < 8 && column + 1 < 8 && tilesArray[row + 1][column + 1] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    if (row - 1 >= 0 && tilesArray[row - 1][column] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    if (column - 1 >= 0 && tilesArray[row][column - 1] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    if (row - 1 >= 8 && column - 1 >= 0 && tilesArray[row - 1][column - 1] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    if (row - 1 >= 0 && column + 1 < 8 && tilesArray[row - 1][column + 1] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    if (row + 1 < 8 && column - 1 >= 0 && tilesArray[row + 1][column - 1] == (alliance == Alliance.WHITE ? 2 : 1)) {
      return true;      
    }
    return false;
  }
      
  bool kingCheckWithPawn(int row, int column, Alliance alliance, List<List<int>> tilesArray) {
    int adder = alliance == Alliance.WHITE ? 1 : -1;
    if (row + adder >= 0 && row + adder < 8) {
      if (column - 1 >= 0 && tilesArray[row + adder][column - 1] == (alliance == Alliance.WHITE ? 4 : 3)) {
        return true;
      }
      if (column + 1 < 8 && tilesArray[row + adder][column + 1] == (alliance == Alliance.WHITE ? 4 : 3)) {
        return true;
      }
    }
    return false;
  }
      
  bool kingCheckWithKnight(int row, int column, Alliance alliance, List<List<int>> tilesArray) {
    if (row + 1 < 8 && column + 2 < 8 && tilesArray[row + 1][column + 2] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    if (row + 2 < 8 && column + 1 < 8 && tilesArray[row + 2][column + 1] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    if (row + 1 < 8 && column - 2 >= 0 && tilesArray[row + 1][column - 2] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    if (row + 2 < 8 && column - 1 >= 0 && tilesArray[row + 2][column - 1] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    if (row - 1 >= 0 && column + 2 < 8 && tilesArray[row - 1][column + 2] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    if (row - 2 >= 0 && column + 1 < 8 && tilesArray[row - 2][column + 1] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    if (row - 1 >= 0 && column - 2 >= 0 && tilesArray[row - 1][column - 2] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    if (row - 2 >= 0 && column - 1 >= 0 && tilesArray[row - 2][column - 1] == (alliance == Alliance.WHITE ? 6 : 5)) {
      return true;
    }
    return false;
  }

  bool kingCheckWithBishopOrQueen(int row, int column, Alliance alliance, List<List<int>> tilesArray) {
    int currRow = row;
    int currCol = column;
    while (true) {
      currRow++;
      currCol++;
      if (currRow >= 8 || currCol >= 8 || 
      (tilesArray[currRow][currCol] != 0 && tilesArray[currRow][currCol] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[currRow][currCol] != 0) {
        if (tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 8 : 7) || 
        tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    currRow = row;
    currCol = column;
    while (true) {
      currRow--;
      currCol++;
      if (currRow < 0 || currCol >= 8 || 
      (tilesArray[currRow][currCol] != 0 && tilesArray[currRow][currCol] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[currRow][currCol] != 0) {
        if (tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 8 : 7) || 
        tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    currRow = row;
    currCol = column;
    while (true) {
      currRow++;
      currCol--;
      if (currRow >= 8 || currCol < 0 || 
      (tilesArray[currRow][currCol] != 0 && tilesArray[currRow][currCol] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[currRow][currCol] != 0) {
        if (tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 8 : 7) || 
        tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    currRow = row;
    currCol = column;
    while (true) {
      currRow--;
      currCol--;
      if (currRow < 0 || currCol < 0 || 
      (tilesArray[currRow][currCol] != 0 && tilesArray[currRow][currCol] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[currRow][currCol] != 0) {
        if (tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 8 : 7) || 
        tilesArray[currRow][currCol] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    return false;
  }
      
  bool kingCheckWithRookOrQueen(int row, int column, Alliance alliance, List<List<int>> tilesArray) {
    int currRow = row;
    while (true) {
      currRow++;
      if (currRow >= 8 || 
      (tilesArray[currRow][column] != 0 && tilesArray[currRow][column] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[currRow][column] != 0) {
        if (tilesArray[currRow][column] == (alliance == Alliance.WHITE ? 10 : 9) || 
        tilesArray[currRow][column] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    currRow = row;
    while (true) {
      currRow--;
      if (currRow < 0 || 
      (tilesArray[currRow][column] != 0 && tilesArray[currRow][column] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[currRow][column] != 0) {
        if (tilesArray[currRow][column] == (alliance == Alliance.WHITE ? 10 : 9) || 
        tilesArray[currRow][column] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    int currCol = column;
    while (true) {
      currCol--;
      if (currCol < 0 || 
      (tilesArray[row][currCol] != 0 && tilesArray[row][currCol] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[row][currCol] != 0) {
        if (tilesArray[row][currCol] == (alliance == Alliance.WHITE ? 10 : 9) || 
        tilesArray[row][currCol] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    currCol = column;
    while (true) {
      currCol++;
      if (currCol >= 8 || 
      (tilesArray[row][currCol] != 0 && tilesArray[row][currCol] % 2 == (alliance == Alliance.WHITE ? 1: 0))){
        break;
      }
      if(tilesArray[row][currCol] != 0) {
        if (tilesArray[row][currCol] == (alliance == Alliance.WHITE ? 10 : 9) || 
        tilesArray[row][currCol] == (alliance == Alliance.WHITE ? 12 : 11)) {
          return true;
        }
        break;
      }
    }
    return false;
  }
      
  bool validateMove(Move move) {
    int currentPos = move.getPreviousCoordinate();
    int newPos = move.getNewCoordinate();
    List<List<int>> copy = [];
    for (List<Tile> tilesList in tiles) {
      List<int> copyList = [];
      for (Tile tile in tilesList) {
        if (tile is EmptyTile) {
          copyList.add(0);
        } else if (tile.getPiece() is King) {
          copyList.add(tile.getPiece().getAlliance() == Alliance.WHITE ? 1: 2);
        } else if (tile.getPiece() is Pawn) {
          copyList.add(tile.getPiece().getAlliance() == Alliance.WHITE ? 3 : 4);
        } else if (tile.getPiece() is Knight) {
          copyList.add(tile.getPiece().getAlliance() == Alliance.WHITE ? 5 : 6);
        } else if (tile.getPiece() is Bishop) {
          copyList.add(tile.getPiece().getAlliance() == Alliance.WHITE ? 7 : 8);
        } else if (tile.getPiece() is Rook) {
          copyList.add(tile.getPiece().getAlliance() == Alliance.WHITE ? 9 : 10);
        } else {
          copyList.add(tile.getPiece().getAlliance() == Alliance.WHITE ? 11 : 12);
        }
      }
      copy.add(copyList);
    } 
    copy[newPos ~/ 8][newPos % 8] = copy[currentPos ~/ 8][currentPos % 8];
    copy[currentPos ~/ 8][currentPos % 8] = 0;
    return !isKingInCheck(currentTurn, copy);
  }
  
}
