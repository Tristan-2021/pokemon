import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/src/feature/pokemon/model/pokemon_details.dart';
import 'package:pokemon/src/feature/pokemon/service/data_service.dart';

part 'detail_pokemon_state.dart';

class DetailPokemonCubit extends Cubit<DetailPokemonState> {
  final DataSourcs dataSourcs;
  DetailPokemonCubit(this.dataSourcs) : super(const DetailPokemonState());

  Future<void> getDetail(String name) async {
    emit(state.copyWith(status: DetailPokemonStatus.loading));

    try {
      final data = await dataSourcs.getPokemonDetail(name);
      emit(state.copyWith(
        status: DetailPokemonStatus.succes,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DetailPokemonStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
