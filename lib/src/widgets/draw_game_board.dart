import 'dart:math';

import 'package:flutter/material.dart';
import 'package:openchess/src/bloc/bloc_provider.dart';
import 'package:openchess/src/bloc/default_chess_game_bloc.dart';
import 'package:openchess/src/chess/alliance.dart';
import 'package:openchess/src/chess/board/empty_tile.dart';
import 'package:openchess/src/common/helper.dart';

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
                    Helper.getCodeFromPiece(element.getPiece()),
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

}
