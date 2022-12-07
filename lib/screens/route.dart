import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/API/pokemon_API/pokemon_API.dart';
import 'package:pokedex_flutter/container/custom_pokemon_container.dart';
import 'package:pokedex_flutter/container/custom_pokemon_details_container.dart';
import 'package:pokedex_flutter/container/detail_container.dart';
import 'package:pokedex_flutter/container/home_container.dart';
import 'package:pokedex_flutter/screens/add_custom_pokemon_page.dart';
import 'package:pokedex_flutter/screens/custom_pokemon_details_page.dart';
import 'package:pokedex_flutter/screens/tab_controller.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({super.key, required this.api});
  final PokemonAPI api;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if(settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return TabControllerWidget(api: api);
            }
          );
        }

        if(settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: api, 
                arguments: (settings.arguments as DetailArguments)
              );
            }
          );
        }

        if(settings.name == '/addCustomPokemon') {
          return MaterialPageRoute(
            builder: (context) {
              return AddCustomPokemonPage();
            }
          );
        }

        if(settings.name == '/customDetails') {
          return MaterialPageRoute(
            builder: (context) {
              return CustomPokemonDetailsConatiner();
            }
          );
        }
      },
    );
  }
}