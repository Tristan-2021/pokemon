// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokemon/l10n/l10n.dart';
import 'package:pokemon/src/feature/pokemon/service/data_service.dart';
import 'package:pokemon/src/feature/pokemon/view/cubit/detail_pokemon_cubit.dart';
import 'package:pokemon/src/feature/pokemon/view/pokemon_view.dart';

import '../../../feature/pokemon/view/cubit/pokemon_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataSourcs(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PokemonCubit(context.read<DataSourcs>())..getPOkemon(3)),
          BlocProvider(
              create: (context) =>
                  DetailPokemonCubit(context.read<DataSourcs>()))
        ],
        child: (MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const POkemonView(),
        )),
      ),
    );
  }
}
