import 'package:flutter/material.dart';
import 'package:pokemon/pokemonModel.dart';

class PokeDetail extends StatelessWidget{

  final Pokemon pokemon;

  const PokeDetail(this.pokemon);

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width-20,
        left:10.0,
        top: MediaQuery.of(context).size.height *0.1,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                ),
              Text(pokemon.name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map((e) => FilterChip(label: Text(e), onSelected: (b){})).toList()
              ),
              Text("Weakness"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map((e) => FilterChip(label: Text(e), onSelected: (b){})).toList()
              ),
              Text("Next Evolution"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.nextEvolution.map((e) => FilterChip(label: Text(e.name), onSelected: (b){})).toList()
              ),
            ],)
          ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: pokemon.img, child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(pokemon.img)
            )
          ),
        )) ,
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        title:Text(pokemon.name),
        backgroundColor: Colors.cyan,
      ),
      body: bodyWidget(context),
    );
  }
}