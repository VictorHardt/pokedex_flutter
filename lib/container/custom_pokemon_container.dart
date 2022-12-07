import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/error/failure.dart';
import 'package:pokedex_flutter/screens/custom_pokemon_page.dart';
import 'package:pokedex_flutter/screens/error_screen.dart';
import 'package:pokedex_flutter/screens/loading_screen.dart';

class CustomPokemonConatiner extends StatelessWidget {
  const CustomPokemonConatiner({super.key});

  @override
  Widget build(BuildContext context) {

    loadCustomPokemons() async {
      return await [];
    }

    return FutureBuilder(
      future: loadCustomPokemons(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return CustomPokemonsPage(customPokemonList: snapshot.data!);
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