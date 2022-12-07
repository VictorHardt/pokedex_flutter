import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_details_appbar_widget.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_details_image_widget.dart';
import 'package:pokedex_flutter/screens/widgets/pokemon_details_type_and_abilities.dart';
import 'package:pokedex_flutter/screens/widgets/type_and_abilities_widget.dart';

class CustomPokemonDetailsPage extends StatelessWidget {
  const CustomPokemonDetailsPage({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PokemonDetailsAppBar(pokemon: pokemon),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            height: 350,
            child: Container(
              color: pokemon.baseColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name, 
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(pokemon.image, scale: 0.3)
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: SizedBox(
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
                        Text('Abilities: '),
                        ...pokemon.abilities.map((e) => TypeAndAbilitiesWidget(typeOrAbility: e, pokemonColor: pokemon.baseColor!)).toList()
                      ]
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
