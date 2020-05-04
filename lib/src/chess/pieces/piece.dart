import 'package:openchess/src/chess/board/board.dart';
import 'package:openchess/src/chess/board/move.dart';

import '../alliance.dart';

abstract class Piece {
  final int piecePosition;
  final Alliance pieceAlliance;

  Piece({this.piecePosition, this.pieceAlliance});

  List<Move> calculateLegalMoves(final Board board);

  int getPiecePosition() {
    return piecePosition;
  }

  Alliance getAlliance() {
    return pieceAlliance;
  }
}
