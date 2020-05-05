import 'dart:math';

import 'package:flutter/material.dart';
import 'package:openchess/src/bloc/bloc_provider.dart';
import 'package:openchess/src/bloc/default_chess_game_bloc.dart';
import 'package:openchess/src/chess/alliance.dart';
import 'package:openchess/src/chess/board/empty_tile.dart';
import 'package:openchess/src/chess/pieces/bishop.dart';
import 'package:openchess/src/chess/pieces/knight.dart';
import 'package:openchess/src/chess/pieces/pawn.dart';
import 'package:openchess/src/chess/pieces/queen.dart';
import 'package:openchess/src/chess/pieces/rook.dart';

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
                  angle: 1 == 1 ? 0 : -pi,
                  child: buildTable(snapshot, sizeOfBoard, gameStateBloc),
                )
              : Container(
                  child: Text("Nothing yet"),
                );
        });
  }

  Table buildTable(snapshot, sizeOfBoard, gameStateBloc) {
    int listIndex = 0;
    return Table(
      children: snapshot.data.reversed.map<TableRow>((list) {
        listIndex += 1;
        var elementIndex = -1;
        return TableRow(
          children: list.map<Widget>((element) {
            elementIndex += 1;
            return GestureDetector(
              onTap: () => gameStateBloc.tapFunction(element),
              child:
                  drawChessTile(sizeOfBoard, element, listIndex, elementIndex),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Container drawChessTile(
      sizeOfBoard, element, int listIndex, int elementIndex) {
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
                  angle: element.getPiece().getAlliance() == Alliance.WHITE
                      ? 0
                      : -pi,
                  child: Text(
                    getCodeFromPlaceHolder(element),
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    ),
                  ))),
      color: element.getSelected()
          ? Colors.orange[300]
          : ((listIndex + elementIndex) % 2 == 0
              ? Colors.blue
              : Colors.blue[100]),
    );
  }

  String getCodeFromPlaceHolder(element) {
    if (element.getPiece() is Pawn) {
      return element.getPiece().getAlliance() == Alliance.WHITE ? '\u2659' : '\u265F';
    } else if (element.getPiece() is Knight) {
      return element.getPiece().getAlliance() == Alliance.WHITE ? '\u2658' : '\u265E';
    } else if (element.getPiece() is Bishop) {
      return element.getPiece().getAlliance() == Alliance.WHITE ? '\u2657' : '\u265D';
    }  else if (element.getPiece() is Rook) {
      return element.getPiece().getAlliance() == Alliance.WHITE ? '\u2656' : '\u265C';
    }  else if (element.getPiece() is Queen) {
      return element.getPiece().getAlliance() == Alliance.WHITE ? '\u2655' : '\u265B';
    }  else {
      return element.getPiece().getAlliance() == Alliance.WHITE ? '\u2654' : '\u265A';
    }
  }
}
