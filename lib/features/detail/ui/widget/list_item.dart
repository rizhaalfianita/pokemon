import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/features/detail/model/pokemon.dart';
import 'package:pokemon/shared/const/constants.dart';

SizedBox listAbilities(Pokemon detailPokemon) {
  return SizedBox(
    height: 46,
    child: ListView.builder(
      itemCount: detailPokemon.abilities!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var abilities = detailPokemon.abilities![index];

        return Container(
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: lightDark,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Text(abilities.ability!.name!,
              style: GoogleFonts.lexendDeca(
                  textStyle: const TextStyle(
                      color: white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500))),
        );
      },
    ),
  );
}

SizedBox listTypes(Pokemon detailPokemon) {
  return SizedBox(
    height: 46,
    child: ListView.builder(
      itemCount: detailPokemon.types!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var types = detailPokemon.types![index];

        return Container(
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: lightDark,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Text(types.type!.name!,
              style: GoogleFonts.lexendDeca(
                  textStyle: const TextStyle(
                      color: white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500))),
        );
      },
    ),
  );
}
