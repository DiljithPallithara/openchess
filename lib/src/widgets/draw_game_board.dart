import 'dart:math';

import 'package:flutter/material.dart';
import 'package:openchess/src/bloc/bloc_provider.dart';
import 'package:openchess/src/bloc/default_chess_game_bloc.dart';
import 'package:openchess/src/chess/alliance.dart';
import 'package:openchess/src/chess/board/empty_tile.dart';
import 'package:openchess/src/chess/pieces/knight.dart';

class DrawGameBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameStateBloc = Provider.of<DefaultChessGameBloc>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final sizeOfBoard = min(width, height) / 8;
    return StreamBuilder(
        stream: gameStateBloc.gameStateStream,
        builder: (_, snapshot) {
          return snapshot.hasData
              ? Transform.rotate(
                  angle: true ? 0 : -pi,
                  child: buildTable(snapshot, sizeOfBoard),
                )
              : Container(
                  child: Text("Nothing yet"),
                );
        });
  }

  Widget buildTable(snapshot, sizeOfBoard) {
    int listIndex = 0;
    return Table(
      children: snapshot.data.reversed.map<TableRow>((list) {
        listIndex += 1;
        var elementIndex = -1;
        return TableRow(
          children: list.map<Widget>((element) {
            elementIndex += 1;
            return Container(
              constraints: BoxConstraints(
                maxHeight: sizeOfBoard,
                maxWidth: sizeOfBoard,
                minWidth: sizeOfBoard,
                minHeight: sizeOfBoard,
              ),
              child: element is EmptyTile
                  ? null
                  : Center(
                      child: Transform.rotate(
                          angle:
                              element.getPiece().getAlliance() == Alliance.WHITE
                                  ? 0
                                  : -pi,
                          child: Text(
                            getCodeFromPlaceHolder(element),
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                            ),
                          ))),
              color: (listIndex + elementIndex) % 2 == 0
                  ? Colors.blue[100]
                  : Colors.blue,
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  String getCodeFromPlaceHolder(element) {
    if (element.getPiece() is Knight &&
        element.getPiece().getAlliance() == Alliance.WHITE) {
      return '\u2658';
    } else if (element.getPiece() is Knight &&
        element.getPiece().getAlliance() == Alliance.BLACK) {
      return '\u265E';
    } else {
      return "";
    }
// const String DEFAULT_CHESS_GAME_WHITE_PAWN = '\u2659';
// const String DEFAULT_CHESS_GAME_BLACK_PAWN = '\u265F';
// const String DEFAULT_CHESS_GAME_WHITE_BISHOP = '\u2657';
// const String DEFAULT_CHESS_GAME_BLACK_BISHOP = '\u265D';
// const String DEFAULT_CHESS_GAME_WHITE_ROOK = '\u2656';
// const String DEFAULT_CHESS_GAME_BLACK_ROOK = '\u265C';
// const String DEFAULT_CHESS_GAME_WHITE_QUEEN = '\u2655';
// const String DEFAULT_CHESS_GAME_BLACK_QUEEN = '\u265B';
// const String DEFAULT_CHESS_GAME_WHITE_KING = '\u2654';
// const String DEFAULT_CHESS_GAME_BLACK_KING = '\u265A';
  }
}
