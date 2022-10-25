import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/src/feature/pokemon/view/cubit/detail_pokemon_cubit.dart';
import 'package:pokemon/src/feature/pokemon/view/cubit/pokemon_cubit.dart';

class Barra extends StatelessWidget {
  const Barra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        switch (state.status) {
          case PokemonStatus.loading:
            return SizedBox(
              height: 45,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case PokemonStatus.succes:
            context
                .read<DetailPokemonCubit>()
                .getDetail(state.pokemon.results.first.name);

            return Container(
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: state.pokemon.results
                      .getRange(0, 3)
                      .map((e) => GestureDetector(
                            onTap: () {
                              context
                                  .read<DetailPokemonCubit>()
                                  .getDetail(e.name);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 25.0, right: 25),
                              decoration: BoxDecoration(
                                border: e.name != state.pokemon.results[2].name
                                    ? Border(
                                        right: BorderSide(
                                          width: 3,
                                        ),
                                      )
                                    : null,
                              ),
                              child: Center(child: Text(e.name)),
                            ),
                          ))
                      .toList()),
            );
          default:
        }
        return Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(state.message),
        );
      },
    );
  }
}
