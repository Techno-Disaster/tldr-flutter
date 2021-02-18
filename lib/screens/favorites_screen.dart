import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tldr/command/bloc/command_bloc.dart';
import 'package:tldr/utils/favorites_tile.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17181c),
      appBar: AppBar(
        elevation: 0,
        title: Text("Favorite Commands"),
        backgroundColor: Color(0xff17181c),
      ),
      body: BlocBuilder<CommandBloc, CommandState>(builder: (context, state) {
        if (state is CommandState) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: state.favoriteCommands.length,
            itemBuilder: (context, index) {
              return FavoritesTile(index: index);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}