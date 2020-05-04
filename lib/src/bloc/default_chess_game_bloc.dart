import 'dart:async';
import 'dart:collection';

import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/tile.dart';

import '../chess/board/empty_tile.dart';
import '../chess/board/empty_tile.dart';
import '../chess/board/occupied_tile.dart';

class DefaultChessGameBloc {
  Board board;

  final _gameStateController =
      StreamController<UnmodifiableListView<UnmodifiableListView<Tile>>>();

  Stream<UnmodifiableListView<UnmodifiableListView<Tile>>>
      get gameStateStream => _gameStateController.stream;

  Sink<UnmodifiableListView<UnmodifiableListView<Tile>>> get _gameStateSink =>
      _gameStateController.sink;

  DefaultChessGameBloc() {
    _initializeGameState();
  }

  _initializeGameState() {
    board = Board();
    _gameStateController.add(board.getCurrentState());
  }

  void findAllPossibleMovesFrom(Tile tile) {
    UnmodifiableListView<UnmodifiableListView<Tile>> tiles =
        board.getCurrentState();
    tiles.map((e) => e.forEach((f) => f.setSelected(false)));
    if (tile is OccupiedTile) {
      tile.getPiece().calculateLegalMoves(board).forEach((e) =>
          {tiles[e.newCoordinate ~/ 8][e.newCoordinate % 8].setSelected(true)});
    }
    _gameStateController.add(tiles);
  }

  void dispose() {
    _gameStateController.close();
  }
}
