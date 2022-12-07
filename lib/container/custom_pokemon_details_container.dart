import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/error/failure.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/custom_pokemon_details_page.dart';
import 'package:pokedex_flutter/screens/custom_pokemon_page.dart';
import 'package:pokedex_flutter/screens/error_screen.dart';
import 'package:pokedex_flutter/screens/loading_screen.dart';

class CustomPokemonDetailsConatiner extends StatelessWidget {
  const CustomPokemonDetailsConatiner({super.key});

  @override
  Widget build(BuildContext context) {

    loadCustomPokemon() async {
      return await [];
    }

    return FutureBuilder(
      future: loadCustomPokemon(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return CustomPokemonDetailsPage(pokemon: snapshot.data! as Pokemon);
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