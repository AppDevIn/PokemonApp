import 'package:flutter/material.dart';
import 'package:pokemon/pokemonModel.dart';

class PokeDetail extends StatelessWidget{

  final Pokemon pokemon;

  const PokeDetail(this.pokemon);

  bodyWidget() => Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        title:Text(pokemon.name),
        backgroundColor: Colors.cyan,
      ),
      body: bodyWidget(),
    );
  }
}