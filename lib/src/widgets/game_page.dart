import 'package:flutter/material.dart';
import 'package:openchess/src/bloc/bloc_provider.dart';
import 'package:openchess/src/bloc/default_chess_game_bloc.dart';

import 'draw_game_board.dart';
import 'dart:math';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;
      final heightOfRow = (width - height).abs();
      return BlocProvider<DefaultChessGameBloc>(
      builder: (_, bloc) => bloc ?? DefaultChessGameBloc(),
      onDispose: (_, bloc) => bloc.dispose(),
      child: Container(
        color: Colors.brown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            playTrack(),
            playerOne(),
            DrawGameBoard(),
            playerOne(),
            options()
          ],
        )
      ),
    );
  }

  Widget playTrack(){
    return Container(
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),

          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),

          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
          Text("ab cd"),
        ],
      ),    );

  }

  Widget playerTwo(){}

  Widget playerOne(){
    return Row(
      children: <Widget>[
        SizedBox(width: 30,),
        Text("Player 1"),
        Spacer(),
        Text("01:00", style: TextStyle(fontSize: 30),),
        SizedBox(width: 30,),
      ],
    );
  }

  Widget options(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.chat),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.repeat),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.fast_rewind),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.fast_forward),
          onPressed: (){},
        ),
      ],
    );
  }

}
