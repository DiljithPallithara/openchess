import 'dart:async';

import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/tile.dart';

class DefaultChessGameBloc {
  Board board;

  final _gameStateController =
      StreamController<List<List<Tile>>>();

  Stream<List<List<Tile>>>
      get gameStateStream => _gameStateController.stream;

  // Sink<List<List<Tile>>> get _gameStateSink =>
  //     _gameStateController.sink;

  DefaultChessGameBloc() {
    _initializeGameState();
  }

  _initializeGameState() {
    board = Board();
    _gameStateController.add(board.getCurrentState());
  }

  void tapFunction(Tile tile) {
    board.findAllPossibleMovesFrom(tile);
    _gameStateController.add(board.getCurrentState());
    if(board.checkIfGameOver()) {
      board = Board();
    }
  }

  void dispose() {
    _gameStateController.close();
  }
}
