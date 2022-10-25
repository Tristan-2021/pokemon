import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/src/feature/pokemon/service/data_service.dart';
import 'package:pokemon/src/feature/pokemon/view/cubit/pokemon_cubit.dart';
import 'package:pokemon/src/feature/pokemon/view/pokemon_details.dart';

class POkemonView extends StatelessWidget {
  const POkemonView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = DataSourcs();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokemon!',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: PageView.builder(
        controller: PageController(
          viewportFraction: 1.02,
        ),
        onPageChanged: (index) {
          context.read<PokemonCubit>().getPOkemon(3);
        },
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
            height: size.height - 40,
            decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ViewPokenItemDetails()),
      ),
    );
  }
}

// unawaited(
//                 Navigator.push(
//                   context,
//                   PageRouteBuilder(
//                     transitionDuration: const Duration(milliseconds: 600),
//                     pageBuilder: (context, ani, ani2) =>
//                         const ViewPokenItemDetails(
//                             // detailProduct: produc.list[index],
//                             ),
//                     transitionsBuilder: (
//                       context,
//                       animation,
//                       secondaryAnimation,
//                       child,
//                     ) {
//                       return FadeTransition(
//                         opacity: animation,
//                         child: child,
//                       );
//                     },
//                   ),
//                 ),
//               );