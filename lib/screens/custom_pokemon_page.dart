import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/database/database.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/widgets/custom_pokemon_item_list_widget.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_item_list_widget.dart';

class CustomPokemonsPage extends StatefulWidget {
  CustomPokemonsPage({super.key, required this.customPokemonList});

  List<dynamic> customPokemonList;

  @override
  State<CustomPokemonsPage> createState() => _CustomPokemonsPageState();
}

class _CustomPokemonsPageState extends State<CustomPokemonsPage> {
  @override
  void initState() {
    super.initState();
    _loadCustomPokemons();
  }

  _loadCustomPokemons() async {
    widget.customPokemonList = await DB.instance.getAllCustomPokemons();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.customPokemonList.isEmpty ? Center(child: Text("Ainda não há Custom Pokémons cadastrados")) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: widget.customPokemonList.map((e) => CustomPokemonItemListWidget(pokemon: e)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.of(context).pushNamed('/addCustomPokemon');
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}