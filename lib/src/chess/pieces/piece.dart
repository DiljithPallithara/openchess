import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/move.dart';

import '../alliance.dart';

abstract class Piece {
  final int piecePosition;
  final Alliance pieceAlliance;
  bool initialPos = true;

  Piece({this.piecePosition, this.pieceAlliance});

  List<Move> calculateLegalMoves(final Board board);

  bool isInitialPosition() {
    return initialPos;
  } 

  void setInitialPosition(bool initialPos) {
    this.initialPos = initialPos;
  }

  int getPiecePosition() {
    return piecePosition;
  }

  Alliance getAlliance() {
    return pieceAlliance;
  }
}
