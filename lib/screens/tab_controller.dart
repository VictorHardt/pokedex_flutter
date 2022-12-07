import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/API/pokemon_API/pokemon_API.dart';
import 'package:pokedex_flutter/container/custom_pokemon_container.dart';
import 'package:pokedex_flutter/container/home_container.dart';

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({super.key, required this.api});

  final PokemonAPI api;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
          bottom: TabBar(
            tabs: const [
              Tab(text: "Pokémons"),
              Tab(text: "Custom Pokémons")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeContainer(
                repository: api, 
                onItemTap: (route , arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              ),
              CustomPokemonConatiner()
          ],
        ),
      )
    );
  }
}