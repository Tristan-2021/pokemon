import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/src/feature/pokemon/model/pokemon.dart';
import 'package:pokemon/src/feature/pokemon/service/data_service.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final DataSourcs dataSourcs;
  PokemonCubit(this.dataSourcs) : super(const PokemonState());

  Future<void> getPOkemon(int page) async {
    emit(state.copyWight(status: PokemonStatus.loading));

    try {
      final data = await dataSourcs.getPokemon(page);
      emit(state.copyWight(status: PokemonStatus.succes, pokemon: data));
    } catch (e) {
      emit(state.copyWight(
          status: PokemonStatus.failure, message: e.toString()));
    }
  }
}
