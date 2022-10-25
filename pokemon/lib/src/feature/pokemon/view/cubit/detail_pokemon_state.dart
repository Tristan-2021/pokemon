part of 'detail_pokemon_cubit.dart';

enum DetailPokemonStatus { initial, loading, succes, failure }

@immutable
class DetailPokemonState extends Equatable {
  final String message;
  final DetailPokemonStatus status;
  final DetailPokemon data;

  const DetailPokemonState(
      {this.message = '',
      this.status = DetailPokemonStatus.initial,
      this.data = DetailPokemon.details});

  DetailPokemonState copyWith({
    String? message,
    DetailPokemonStatus? status,
    DetailPokemon? data,
  }) =>
      DetailPokemonState(
          message: message ?? this.message,
          status: status ?? this.status,
          data: data ?? this.data);
  @override
  List<Object?> get props => [
        message,
        status,
        data,
      ];
}
