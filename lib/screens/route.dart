import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/API/pokemon_API/pokemon_API.dart';
import 'package:pokedex_flutter/container/detail_container.dart';
import 'package:pokedex_flutter/container/home_container.dart';

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
              return HomeContainer(
                repository: api, 
                onItemTap: (route , arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
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
      },
    );
  }
}