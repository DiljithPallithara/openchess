import 'package:flutter/material.dart';
import 'package:openchess/src/bloc/bloc_provider.dart';
import 'package:openchess/src/bloc/default_chess_game_bloc.dart';

import 'draw_game_board.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DefaultChessGameBloc>(
      builder: (_, bloc) => bloc ?? DefaultChessGameBloc(),
      onDispose: (_, bloc) => bloc.dispose(),
      child: SingleChildScrollView(
        child:  Container(child: DrawGameBoard()),
      ),
    );
  }
}
