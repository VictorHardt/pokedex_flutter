import 'package:flutter/material.dart';
import 'package:pokedex_flutter/container/detail_container.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_item_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key, 
    required this.pokemonList, 
    required this.onItemTap
  });
  final List<Pokemon> pokemonList;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Pokedex'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: pokemonList.map((e) => PokemonItemListWidget(pokemon: e, onTap: onItemTap)).toList(),
        ),
      )
    );
  }
}
