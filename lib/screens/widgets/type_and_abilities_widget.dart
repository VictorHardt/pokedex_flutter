import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TypeAndAbilitiesWidget extends StatelessWidget {
  const TypeAndAbilitiesWidget({super.key, required this.typeOrAbility, required this.pokemonColor});

  final String typeOrAbility;
  final Color pokemonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: Container(
        decoration: BoxDecoration(
          color: pokemonColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            typeOrAbility, 
            style: TextStyle(
              color: pokemonColor, 
              fontWeight: FontWeight.bold, 
              fontSize: 12
            )
          ),
        ),
      ),
    );
  }
}