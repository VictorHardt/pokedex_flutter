import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex_flutter/API/pokemon_API/pokemon_API_url_config.dart';
import 'package:pokedex_flutter/error/failure.dart';
import 'package:pokedex_flutter/models/pokemon.dart';

abstract class IPokemonAPI {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonAPI implements IPokemonAPI {
  final Dio dio;

  PokemonAPI({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final generalResponse = await dio.get(PokemonAPIUrlConfig.allPokemonsURL);
      var pokemonList = [];
      for (var pokemon in generalResponse.data['results']) {
        var pokemonResponse = await dio.get(pokemon['url']);
        pokemonList.add(pokemonResponse.data);
      }
      return pokemonList.map((pokemonJson) => Pokemon.fromMap(pokemonJson)).toList();
    } catch (e) {
      throw Failure(message: 'Erro ao carregar os dados!');
    }
  }
}