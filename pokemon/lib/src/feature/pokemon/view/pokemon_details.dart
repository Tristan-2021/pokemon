import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/src/feature/pokemon/view/barra.dart';
import 'package:pokemon/src/feature/pokemon/view/cubit/detail_pokemon_cubit.dart';

import '../model/habilities.dart';

class ViewPokenItemDetails extends StatefulWidget {
  const ViewPokenItemDetails({super.key});

  @override
  State<ViewPokenItemDetails> createState() => _ViewPokenItemDetailsState();
}

class _ViewPokenItemDetailsState extends State<ViewPokenItemDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Hability? hability;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            const Divider(),
            Barra(),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Habilidades',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 66,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: size.height / 23.1,
                    mainAxisSpacing: 0.33,
                  ),
                  itemCount: lsita.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      hability = lsita[index];
                      //  setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 5, top: 5, bottom: 5),
                      margin: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Text(
                        lsita[index].hability,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const BodyPOkemon()
          ],
        ),
      ),
    );
  }
}

class BodyPOkemon extends StatelessWidget {
  const BodyPOkemon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: BlocBuilder<DetailPokemonCubit, DetailPokemonState>(
        builder: (context, state) {
          switch (state.status) {
            case DetailPokemonStatus.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case DetailPokemonStatus.succes:
              final id = state.data.id;
              return Column(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.ac_unit),
                    label: const Text(
                      'informacion de las habilidades de Selecciòn',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Text(
                    ' "Datos de la Habilidad Seleccionada" ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: size.height / 4.5,
                    child: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: size.height / 4.2,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 3,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BarraLife(
                              size: size,
                              title: 'Vida',
                              putnaje: state.data.stats[0].baseStat),
                          BarraLife(
                            size: size,
                            title: 'Ataque',
                            putnaje: state.data.stats[1].baseStat,
                          ),
                          BarraLife(
                            size: size,
                            title: 'Defensa',
                            putnaje: state.data.stats[2].baseStat,
                          ),
                          BarraLife(
                            title: 'Velocidad',
                            putnaje: state.data.stats[3].baseStat,
                            size: size,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );

            default:
              return Center(child: Text(''));
          }
        },
      ),
    );
  }
}

class BarraLife extends StatelessWidget {
  const BarraLife({
    super.key,
    required this.size,
    required this.title,
    required this.putnaje,
  });

  final Size size;
  final int putnaje;

  final String title;

  @override
  Widget build(BuildContext context) {
    print('cargar el puntaje ${putnaje}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 65,
          child: Text(title),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: size.width / 1.6,
          child: LinearProgressIndicator(
            value: 10 / putnaje,
            minHeight: 18,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
