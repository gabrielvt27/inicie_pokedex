import 'package:flutter/material.dart';

class PokemonTypeModel {
  String name;
  String nameApi;
  Color color;

  PokemonTypeModel({
    required this.name,
    required this.nameApi,
    required this.color,
  });
}

List<PokemonTypeModel> pokemonTypeList = [
  PokemonTypeModel(
    name: "Normal",
    nameApi: "normal",
    color: const Color(0xFFa9a79f),
  ),
  PokemonTypeModel(
    name: "Lutador",
    nameApi: "fighting",
    color: const Color(0xFFdd3b4e),
  ),
  PokemonTypeModel(
    name: "Voador",
    nameApi: "flying",
    color: const Color(0xFFa4beec),
  ),
  PokemonTypeModel(
    name: "Veneno",
    nameApi: "poison",
    color: const Color(0xFFc063d2),
  ),
  PokemonTypeModel(
    name: "Terra",
    nameApi: "ground",
    color: const Color(0xFFd59363),
  ),
  PokemonTypeModel(
    name: "Pedra",
    nameApi: "rock",
    color: const Color(0xFFd3c891),
  ),
  PokemonTypeModel(
    name: "Inseto",
    nameApi: "bug",
    color: const Color(0xFF92c12b),
  ),
  PokemonTypeModel(
    name: "Fantasma",
    nameApi: "ghost",
    color: const Color(0xFF7271cf),
  ),
  PokemonTypeModel(
    name: "Ferro",
    nameApi: "steel",
    color: const Color(0xFF4d9da5),
  ),
  PokemonTypeModel(
    name: "Fogo",
    nameApi: "fire",
    color: const Color(0xFFffae4c),
  ),
  PokemonTypeModel(
    name: "Água",
    nameApi: "water",
    color: const Color(0xFF559bd9),
  ),
  PokemonTypeModel(
    name: "Grama",
    nameApi: "grass",
    color: const Color(0xFF5bc06f),
  ),
  PokemonTypeModel(
    name: "Elétrico",
    nameApi: "electric",
    color: const Color(0xFFf9df6d),
  ),
  PokemonTypeModel(
    name: "Psíquico",
    nameApi: "psychic",
    color: const Color(0xFFfe9b94),
  ),
  PokemonTypeModel(
    name: "Gelo",
    nameApi: "ice",
    color: const Color(0xFF8ad9d2),
  ),
  PokemonTypeModel(
    name: "Dragão",
    nameApi: "dragon",
    color: const Color(0xFF017dbd),
  ),
  PokemonTypeModel(
    name: "Sombrio",
    nameApi: "dark",
    color: const Color(0xFF6f7684),
  ),
  PokemonTypeModel(
    name: "Fada",
    nameApi: "fairy",
    color: const Color(0xFFf4a7e5),
  ),
];
