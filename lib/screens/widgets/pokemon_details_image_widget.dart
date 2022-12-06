import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/models/pokemon.dart';

class PokemonDetailsImage extends StatelessWidget {
  const PokemonDetailsImage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
              child: Image.network(pokemon.image, scale: 0.3)
            ),
          ],
        ),
      ),
    );
  }
}