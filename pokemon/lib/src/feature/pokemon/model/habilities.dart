class Hability {
  final String hability;
  final int hp;
  final int attack;
  final int defense;
  final int speed;

  const Hability(
      {required this.hability,
      required this.hp,
      required this.attack,
      required this.defense,
      required this.speed});
}

const intimidacion = Hability(
    hability: 'initimidaciòn', hp: -5, attack: 10, defense: 10, speed: 15);

const inmunidad = Hability(
    hability: 'inmunidad', hp: 10, attack: -20, defense: 20, speed: 10);
const potencia = Hability(
    hability: 'potencia', hp: -20, attack: 15, defense: -10, speed: 15);
const regneracin = Hability(
    hability: 'regneraciòn', hp: 10, attack: -20, defense: 5, speed: 5);
const impasible = Hability(
    hability: 'impasible', hp: -10, attack: -3, defense: -10, speed: 30);
const toxico =
    Hability(hability: 'toxico', hp: -15, attack: 0, defense: 20, speed: -3);
const lsita = [
  Hability(
      hability: 'initimidaciòn', hp: -5, attack: 10, defense: 10, speed: 15),
  Hability(hability: 'inmunidad', hp: 10, attack: -20, defense: 20, speed: 10),
  Hability(hability: 'potencia', hp: -20, attack: 15, defense: -10, speed: 15),
  Hability(hability: 'regneraciòn', hp: 10, attack: -20, defense: 5, speed: 5),
  Hability(hability: 'impasible', hp: -10, attack: -3, defense: -10, speed: 30),
  Hability(hability: 'toxico', hp: -15, attack: 0, defense: 20, speed: -3)
];
