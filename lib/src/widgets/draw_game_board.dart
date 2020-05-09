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
    int listIndex = -1;
    return Table(
      children: snapshot.data.reversed.map<TableRow>((list) {
        listIndex++;
        var elementIndex = -1;
        return TableRow(
          children: list.map<Widget>((element) {
            elementIndex++;
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
      child: Stack(
        children: <Widget>[
          element.getSelected() ?
          (element is EmptyTile ? Align(
            alignment: Alignment.center,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.green[400],
                shape: BoxShape.circle,
              ),
            ),
          ) : Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.green[400],
              child: Container(
                decoration: BoxDecoration(
                    color: getColorFromIndexes(listIndex, elementIndex),
                    borderRadius: BorderRadius.circular(sizeOfBoard)
                ),
              ),
            ),
          )
          ) : Container(),
           element is EmptyTile ? Container() :
               Align(
                 alignment: Alignment.center,
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
                     )),
               ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              child: listIndex == 7 ? Text("${String.fromCharCode(elementIndex + ("a").codeUnitAt(0))}",
                style: TextStyle(fontSize: 8,
                    color: getColorFromIndexes(listIndex, elementIndex+1)),) : null,
              padding: EdgeInsets.all(2),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: elementIndex == 7 ? Padding(
              padding: EdgeInsets.all(2),
              child: Text((8 - listIndex).toString(),
                style: TextStyle(fontSize: 8,
                color: getColorFromIndexes(listIndex, elementIndex+1)),),
            ): null,
          )
        ],
      ),
      color:  getColorFromIndexes(listIndex, elementIndex),
    );
  }

  Color getColorFromIndexes(int listIndex, int elementIndex){
    return (listIndex + elementIndex) % 2 == 1
        ? Colors.brown
        : Colors.brown[100];
  }
}
