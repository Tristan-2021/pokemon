part of 'pokemon_cubit.dart';

enum PokemonStatus { initial, loading, succes, failure }

@immutable
class PokemonState extends Equatable {
  final String message;
  final PokemonStatus status;
  final Pokemon pokemon;

  const PokemonState(
      {this.message = '',
      this.status = PokemonStatus.initial,
      this.pokemon = Pokemon.pokemon});

  PokemonState copyWight(
          {String? message, PokemonStatus? status, Pokemon? pokemon}) =>
      PokemonState(
          status: status ?? this.status,
          pokemon: pokemon ?? this.pokemon,
          message: message ?? this.message);
  @override
  List<Object?> get props => [status, pokemon, message];
}
