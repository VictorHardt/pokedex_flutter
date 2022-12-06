import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/API/pokemon_API/pokemon_API.dart';
import 'package:pokedex_flutter/error/failure.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/details_page.dart';
import 'package:pokedex_flutter/screens/error_screen.dart';
import 'package:pokedex_flutter/screens/loading_screen.dart';

class DetailArguments {
  DetailArguments({required this.pokemon});

  final Pokemon pokemon;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({super.key, required this.repository, required this.arguments});
  final IPokemonAPI repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return DetailsPage(pokemon: arguments.pokemon, pokemonList: snapshot.data!);
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