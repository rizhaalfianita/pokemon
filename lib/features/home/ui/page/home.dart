import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/features/detail/ui/page/detail.dart';
import 'package:pokemon/features/home/bloc/home_cubit.dart';
import 'package:pokemon/features/home/model/list_pokemon.dart';
import 'package:pokemon/shared/const/constants.dart';
import 'package:pokemon/shared/global_widgets/global_widgets.dart';
import 'package:pokemon/shared/model/state_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit()..fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: BlocConsumer<HomeCubit, StateController<List<Pokemons>>>(
        bloc: _homeCubit,
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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Text("Select Your",
                        style: GoogleFonts.lexendDeca(
                            textStyle: const TextStyle(
                                color: white,
                                fontSize: 32.0,
                                fontWeight: FontWeight.w300))),
                    Text("Pokemon",
                        style: GoogleFonts.lexendDeca(
                            textStyle: const TextStyle(
                                color: white,
                                fontSize: 32.0,
                                fontWeight: FontWeight.w500))),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.inferredData!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        var pokemon = state.inferredData![index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  Detail(pokemon: pokemon,)));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: lightDark),
                            child: Center(
                              child: Text(pokemon.name!,
                                  style: GoogleFonts.lexendDeca(
                                      textStyle: const TextStyle(
                                          color: white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text("No data"),
          );
        },
      ),
    );
  }
}
