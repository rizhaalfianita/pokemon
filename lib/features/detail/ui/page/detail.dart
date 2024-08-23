import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/features/detail/bloc/detail_cubit.dart';
import 'package:pokemon/features/detail/model/pokemon.dart';
import 'package:pokemon/features/detail/ui/widget/list_item.dart';
import 'package:pokemon/features/home/model/list_pokemon.dart';
import 'package:pokemon/shared/const/constants.dart';
import 'package:pokemon/shared/global_widgets/global_widgets.dart';
import 'package:pokemon/shared/model/state_controller.dart';

class Detail extends StatefulWidget {
  final Pokemons pokemon;

  const Detail({required this.pokemon, super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late final DetailCubit _detailCubit;

  @override
  void initState() {
    _detailCubit = DetailCubit()..fetchDetailPokemon(widget.pokemon.url!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: BlocConsumer<DetailCubit, StateController<Pokemon>>(
          bloc: _detailCubit,
          listener: (context, state) {
            if (state.isError) {
              showErrorSnackbar(context, state.inferredErrorMessage!);
              print(state.inferredErrorMessage!);
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is Success) {
              var detailPokemon = state.inferredData!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      Center(
                        child: Text(widget.pokemon.name!,
                            style: GoogleFonts.lexendDeca(
                                textStyle: const TextStyle(
                                    color: white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  Text("Ability",
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 12.0,
                  ),
                 listAbilities(detailPokemon),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text("Types",
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 12.0,
                  ),
                  listTypes(detailPokemon),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text("Base experience",
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(detailPokemon.baseExperience!.toString(),
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text("Height",
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(detailPokemon.height!.toString(),
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text("Weight",
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(detailPokemon.height!.toString(),
                      style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(
                              color: white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300))),
                ],
              );
            }
            return const Center(
              child: Text("No data"),
            );
          },
        ),
      ),
    );
  }
}
