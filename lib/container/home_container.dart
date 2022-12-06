import 'package:flutter/material.dart';
import 'package:pokedex_flutter/API/pokemon_API/pokemon_API.dart';
import 'package:pokedex_flutter/container/detail_container.dart';
import 'package:pokedex_flutter/error/failure.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/error_screen.dart';
import 'package:pokedex_flutter/screens/home_page.dart';
import 'package:pokedex_flutter/screens/loading_screen.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key, 
    required this.repository, 
    required this.onItemTap
  });
  final IPokemonAPI repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return HomePage(pokemonList: snapshot.data!, onItemTap: onItemTap);
        }

        if(snapshot.hasError) {
          return ErrorScreen(
            error: (snapshot.error as Failure).message!
          );
        }

        return Container();
      }
    );
  }
}