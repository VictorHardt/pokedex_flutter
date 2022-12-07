import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_details_appbar_widget.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_details_image_widget.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_details_type_and_abilities.dart';

class CustomPokemonDetailsPage extends StatelessWidget {
  const CustomPokemonDetailsPage({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PokemonDetailsAppBar(pokemon: pokemon),
          PokemonDetailsImage(pokemon: pokemon),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: PokemonDetailsTypeAbilities(pokemon: pokemon),
          )
        ],
      )
    );
  }
}
