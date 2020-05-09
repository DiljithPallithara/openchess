import 'dart:async';

import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/tile.dart';

class DefaultChessGameBloc {
  Board board;

  final _gameStateController =
      StreamController<List<List<Tile>>>();

  Stream<List<List<Tile>>>
      get gameStateStream => _gameStateController.stream;

  final _gameMovesController = 
  StreamController<List<List<String>>>();

  Stream<List<List<String>>> 
  get gameMovesStream => _gameMovesController.stream;

  // Sink<List<List<Tile>>> get _gameStateSink =>
  //     _gameStateController.sink;

  DefaultChessGameBloc() {
    _initializeGameState();
  }

  _initializeGameState() {
    board = Board();
    _gameStateController.add(board.getCurrentState());
    _gameMovesController.add([]);
  }

  void tapFunction(Tile tile) {
    board.findAllPossibleMovesFrom(tile);
    _gameStateController.add(board.getCurrentState());
    _gameMovesController.add(board.getNotations());
    if (board.checkIfGameOver()) {
      board = Board();
      // board.setInitialTilesPosition(); 
      _gameStateController.add(board.getCurrentState());
      _gameMovesController.add([[]]);
    }
  }

  void dispose() {
    _gameStateController.close();
    _gameMovesController.close();
  }
}
