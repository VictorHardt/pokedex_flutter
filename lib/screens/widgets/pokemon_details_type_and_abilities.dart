import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/widgets/type_and_abilities_widget.dart';
import 'package:pokedex_flutter/screens/widgets/type_widget.dart';

class PokemonDetailsTypeAbilities extends StatelessWidget {
  const PokemonDetailsTypeAbilities({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Type: '),
                ...pokemon.type.map((e) => TypeAndAbilitiesWidget(typeOrAbility: e, pokemonColor: pokemon.baseColor!)).toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Abilities: '),
                ...pokemon.abilities.map((e) => TypeAndAbilitiesWidget(typeOrAbility: e, pokemonColor: pokemon.baseColor!)).toList()
              ]
            ),
          ),
        ],
      ),
    );
  }
}