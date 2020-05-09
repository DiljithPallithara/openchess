import 'package:flutter/material.dart';
import 'package:openchess/src/bloc/bloc_provider.dart';
import 'package:openchess/src/bloc/default_chess_game_bloc.dart';

class ChessNotations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameMovesBloc = Provider.of<DefaultChessGameBloc>(context);
    return Container(
      height: 20,
      child: StreamBuilder(
        stream: gameMovesBloc.gameMovesStream,
        builder: (context, snapshot) {
          int listIndex = 0;
          int elementIndex = 0;
          return snapshot.hasData ?
          ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data.map<Row>((list) {
              listIndex++;
              elementIndex = 0;
              return Row(
                children: list.map<InkWell>((element) {
                  elementIndex++;
                  return InkWell(
                    onTap: () => {}, 
                    child: Container(child: Text((elementIndex % 2 == 1 ? " " + listIndex.toString() + ". " : " ") + element)), 
                  );
                 }).toList(),
              );
            }).toList(),
          ): Container();
        }
      ),    
    );
  }

}