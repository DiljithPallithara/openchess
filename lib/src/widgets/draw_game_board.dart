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


List<String> rowAlphabets = ["h","g","f","e","d","c","b","a"];

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
//                    color: Color.fromARGB(1, 100, 111, 65),
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
                       getCodeFromPlaceHolder(element),
                       style: TextStyle(
                         fontSize: 40.0,
                         color: Colors.black,
                       ),
                     )),
               ),
          listIndex == 7 ?
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              child: Text("${rowAlphabets[elementIndex].toString()}",
                style: TextStyle(fontSize: 8,
                    color: getColorFromIndexes(listIndex, elementIndex+1)),),
              padding: EdgeInsets.all(2),
            ),
          ) : Container(),

          elementIndex == 7 ?
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(listIndex.toString(),
                    style: TextStyle(fontSize: 8,
                    color: getColorFromIndexes(listIndex, elementIndex+1)),),
                ),
              ) : Container()
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
