import 'dart:convert';

String DetailPokemonToJson(DetailPokemon data) => json.encode(data.toJson());

class DetailPokemon {
  const DetailPokemon({
    // required this.abilities,
    // required this.forms,
    required this.id,
    // required this.moves,
    required this.name,
    // required this.species,
    required this.sprites,
    required this.stats,
  });
  factory DetailPokemon.fromJson(Map<String, dynamic> json) => DetailPokemon(
        // forms: List<Species>.from(json['forms'].map(Species.fromJson) as List),
        id: json['id'] as int,
        // moves: List<Move>.from(json['moves'].map(Move.fromJson) as List),
        name: json['name'] as String,
        //species: Species.fromJson(json['species'] as Map<String, dynamic>),
        sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
      );

  final String name;
  final Sprites sprites;
  final int id;
  final List<Stat> stats;

  Map<String, dynamic> toJson() => {
        // 'abilities': List<dynamic>.from(abilities.map((x) => x.toJson())),
        //'forms': List<dynamic>.from(forms.map((x) => x.toJson())),
        'id': id,
        // 'moves': List<dynamic>.from(moves.map((x) => x.toJson())),
        'name': name,
        //'species': species.toJson(),
        'sprites': sprites.toJson(),
        'stats': List<dynamic>.from(stats.map((x) => x.toJson())),
      };

  static const details = DetailPokemon(
      id: 1,
      name: "",
      sprites: Sprites(
        backDefault: '',
        backFemale: '',
        backShiny: '',
        backShinyFemale: 'null',
        frontDefault: '',
        frontFemale: null,
        frontShiny: '',
        frontShinyFemale: 'null',
      ),
      stats: [Stat(baseStat: 1, effort: 1, stat: Species(name: '', url: ''))]);
}

class Ability {
  const Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json['ability'] as Map<String, dynamic>),
        isHidden: json['is_hidden'] as bool,
        slot: json['slot'] as int,
      );

  final Species ability;
  final bool isHidden;
  final int slot;

  Map<String, dynamic> toJson() => {
        'ability': ability.toJson(),
        'is_hidden': isHidden,
        'slot': slot,
      };
}

class Species {
  const Species({
    required this.name,
    required this.url,
  });
  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json['name'] as String,
        url: json['url'] as String,
      );

  final String name;
  final String url;

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class GameIndex {
  const GameIndex({
    required this.gameIndex,
    required this.version,
  });
  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json['game_index'] as int,
        version: Species.fromJson(json['version'] as Map<String, dynamic>),
      );

  final int gameIndex;
  final Species version;

  Map<String, dynamic> toJson() => {
        'game_index': gameIndex,
        'version': version.toJson(),
      };
}

class Move {
  const Move({
    required this.move,
    required this.versionGroupDetails,
  });
  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json['move'] as Map<String, dynamic>),
        versionGroupDetails: List<VersionGroupDetail>.from(
          // ignore: avoid_dynamic_calls
          json['version_group_details'].map(VersionGroupDetail.fromJson)
              as List,
        ),
      );

  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Map<String, dynamic> toJson() => {
        'move': move.toJson(),
        'version_group_details':
            List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  const VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });
  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json['level_learned_at'] as int,
        moveLearnMethod:
            Species.fromJson(json['move_learn_method'] as Map<String, dynamic>),
        versionGroup:
            Species.fromJson(json['version_group'] as Map<String, dynamic>),
      );

  final int levelLearnedAt;
  final Species moveLearnMethod;
  final Species versionGroup;

  Map<String, dynamic> toJson() => {
        'level_learned_at': levelLearnedAt,
        'move_learn_method': moveLearnMethod.toJson(),
        'version_group': versionGroup.toJson(),
      };
}

class GenerationV {
  const GenerationV({
    required this.blackWhite,
  });
  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite:
            Sprites.fromJson(json['black-white'] as Map<String, dynamic>),
      );

  final Sprites blackWhite;

  Map<String, dynamic> toJson() => {
        'black-white': blackWhite.toJson(),
      };
}

class GenerationIv {
  const GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });
  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl:
            Sprites.fromJson(json['diamond-pearl'] as Map<String, dynamic>),
        heartgoldSoulsilver: Sprites.fromJson(
          json['heartgold-soulsilver'] as Map<String, dynamic>,
        ),
        platinum: Sprites.fromJson(json['platinum'] as Map<String, dynamic>),
      );

  final Sprites diamondPearl;
  final Sprites heartgoldSoulsilver;
  final Sprites platinum;

  Map<String, dynamic> toJson() => {
        'diamond-pearl': diamondPearl.toJson(),
        'heartgold-soulsilver': heartgoldSoulsilver.toJson(),
        'platinum': platinum.toJson(),
      };
}

class Sprites {
  const Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.animated,
  });
  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json['back_default'] as String,
        backFemale: json['back_female'],
        backShiny: json['back_shiny'] as String,
        backShinyFemale: json['back_shiny_female'],
        frontDefault: json['front_default'] as String,
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'] as String,
        frontShinyFemale: json['front_shiny_female'],
        animated: json['animated'] == null
            ? null
            : Sprites.fromJson(json['animated'] as Map<String, dynamic>),
      );

  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final Sprites? animated;

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class Stat {
  const Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'] as int,
        effort: json['effort'] as int,
        stat: Species.fromJson(json['stat'] as Map<String, dynamic>),
      );

  final int baseStat;
  final int effort;
  final Species stat;

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat.toJson(),
      };
}

class Type {
  const Type({
    required this.slot,
    required this.type,
  });
  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'] as int,
        type: Species.fromJson(json['type'] as Map<String, dynamic>),
      );

  final int slot;
  final Species type;

  Map<String, dynamic> toJson() => {
        'slot': slot,
        'type': type.toJson(),
      };
}
