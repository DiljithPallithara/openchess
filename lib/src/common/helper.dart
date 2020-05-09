import 'package:openchess/src/chess/alliance.dart';
import 'package:openchess/src/chess/pieces/bishop.dart';
import 'package:openchess/src/chess/pieces/knight.dart';
import 'package:openchess/src/chess/pieces/pawn.dart';
import 'package:openchess/src/chess/pieces/queen.dart';
import 'package:openchess/src/chess/pieces/rook.dart';

class Helper {
  static String getCodeFromPiece(piece) {
    if (piece is Pawn) {
      return piece.getAlliance() == Alliance.WHITE ? '\u2659' : '\u265F';
    } else if (piece is Knight) {
      return piece.getAlliance() == Alliance.WHITE ? '\u2658' : '\u265E';
    } else if (piece is Bishop) {
      return piece.getAlliance() == Alliance.WHITE ? '\u2657' : '\u265D';
    }  else if (piece is Rook) {
      return piece.getAlliance() == Alliance.WHITE ? '\u2656' : '\u265C';
    }  else if (piece is Queen) {
      return piece.getAlliance() == Alliance.WHITE ? '\u2655' : '\u265B';
    }  else {
      return piece.getAlliance() == Alliance.WHITE ? '\u2654' : '\u265A';
    }
  }
}