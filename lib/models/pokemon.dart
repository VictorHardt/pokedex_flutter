import 'dart:ui';

import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String image;
  final List<String> type;
  final List<dynamic> abilities;

   Pokemon({required this.name, required this.image, required this.type, required this.abilities});

  factory Pokemon.fromMap(Map<String, dynamic> pokemonJson) {
    return Pokemon(
      name: pokemonJson['name'], 
      image: pokemonJson['sprites']['front_default'],
      type: (pokemonJson['types'] as List<dynamic>).map((type) => type['type']['name'] as String).toList(),
      abilities: (pokemonJson['abilities'] as List<dynamic>).map((ability) => ability['ability']['name'] as String).toList()
    );
  }

  Color? get baseColor => _color(type: type[0]);

  static Color? _color({required String type}) {
    switch (type) {
      case 'normal':
        return Colors.brown[400];
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'ice':
        return Colors.cyanAccent[400];
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange[300];
      case 'flying':
        return Colors.indigo[200];
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen[500];
      case 'rock':
        return Colors.grey;
      case 'ghost':
        return Colors.indigo[400];
      case 'dark':
        return Colors.brown;
      case 'dragon':
        return Colors.indigo[800];
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
