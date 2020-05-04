import 'dart:async';
import 'dart:collection';

import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/tile.dart';

class DefaultChessGameBloc {
  Board board;

  final _gameStateController = StreamController<UnmodifiableListView<UnmodifiableListView<Tile>>>();

  Stream<UnmodifiableListView<UnmodifiableListView<Tile>>> get gameStateStream =>
      _gameStateController.stream;

  Sink<UnmodifiableListView<UnmodifiableListView<Tile>>> get _gameStateSink =>
      _gameStateController.sink;

  DefaultChessGameBloc() {
    _initializeGameState();
  }

  _initializeGameState() {
    board = Board();
    _gameStateController.add(board.getCurrentState());
  }

  void dispose() {
    _gameStateController.close();
  }

}
