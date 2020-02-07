import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pokemon/pokemonModel.dart';

import 'PokemoneDetail.dart';


void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
    
  }

  fetchData() async{
    var res = await http.get(url);

    var decodedJson = convert.jsonDecode(res.body);

    pokeHub = PokeHub.fromJson(decodedJson);

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Poke App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
        child: Icon(Icons.refresh),
        ),
      body: pokeHub == null ? Center(
          child:CircularProgressIndicator()
        ): GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke) => 
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PokeDetail(poke)));
            },
            child: Hero(
              tag: poke.img,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          image:NetworkImage(poke.img))
                        )
                      ),
                      Text(poke.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ).toList(),
        ),
      drawer: Drawer(),
    );
  }
}