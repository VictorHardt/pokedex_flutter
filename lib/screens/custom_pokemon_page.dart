import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/widgets/custom_pokemon_item_list_widget.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_item_list_widget.dart';

class CustomPokemonsPage extends StatelessWidget {
  const CustomPokemonsPage({super.key, required this.customPokemonList});

  final List<dynamic> customPokemonList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customPokemonList.isEmpty ? Center(child: Text("Ainda não há Custom Pokémons cadastrados")) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: customPokemonList.map((e) => CustomPokemonItemListWidget(pokemon: e)).toList(),
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