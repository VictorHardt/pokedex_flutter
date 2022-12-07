import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter/API/pokemon_API/pokemon_API.dart';
import 'package:pokedex_flutter/database/database.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/route.dart';

class AddCustomPokemonPage extends StatefulWidget {
  const AddCustomPokemonPage({super.key});

  @override
  _AddCustomPokemonPageState createState() => _AddCustomPokemonPageState();
}

class _AddCustomPokemonPageState extends State<AddCustomPokemonPage> {
  final TextEditingController _pokemonName = TextEditingController();
  final TextEditingController _pokemonAbilities = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar novo Pokémon")
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            customPokemonImage(),
            SizedBox(
              height: 20,
            ),
            customPokemonName(),
            SizedBox(
              height: 20,
            ),
            customPokemonAbilities(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await DB.instance.inserirCustomPokemon(
                  Pokemon(
                    name: _pokemonName.text, 
                    image: "assets/default_profile_image.jpg", 
                    type: [], 
                    abilities: [_pokemonAbilities.text]
                  )
                );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => PokedexRoute(
                      api: PokemonAPI(
                        dio: Dio()
                      )
                    )
                  ), ((route) => false));
              }, 
              child: Text("Salvar")
            )
          ],
        )
      ),
    );
  }

  Widget customPokemonImage() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage("assets/default_profile_image.jpg"),
          // backgroundImage: _imageFile == null
          //     ? AssetImage("assets/profile.jpeg")
          //     : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 22.0,
          right: 22.0,
          child: InkWell(
            onTap: () {
              // showModalBottomSheet(
              //   context: context,
              //   builder: ((builder) => bottomSheet()),
              // );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.red,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget customPokemonName() {
    return TextFormField(
      controller: _pokemonName,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        labelText: "Nome",
        // helperText: "O campo Nome não pode ser vazio",
        hintText: "Nome do Custom Pokemon",
      ),
    );
  }

  Widget customPokemonAbilities() {
    return TextFormField(
      controller: _pokemonAbilities,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        labelText: "Habilidades",
        // helperText: "O campo Habilidades não pode ser vazio",
        hintText: "Habilidades do Custom Pokemon",
      ),
    );
  }
}

