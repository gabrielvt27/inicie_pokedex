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
    nameApi: "",
    color: const Color(0xFFa9a79f),
  ),
  PokemonTypeModel(
    name: "Lutador",
    nameApi: "",
    color: const Color(0xFFdd3b4e),
  ),
  PokemonTypeModel(
    name: "Voador",
    nameApi: "",
    color: const Color(0xFFa4beec),
  ),
  PokemonTypeModel(
    name: "Veneno",
    nameApi: "",
    color: const Color(0xFFc063d2),
  ),
  PokemonTypeModel(
    name: "Terra",
    nameApi: "",
    color: const Color(0xFFd59363),
  ),
  PokemonTypeModel(
    name: "Pedra",
    nameApi: "",
    color: const Color(0xFFd3c891),
  ),
  PokemonTypeModel(
    name: "Inseto",
    nameApi: "",
    color: const Color(0xFF92c12b),
  ),
  PokemonTypeModel(
    name: "Fantasma",
    nameApi: "",
    color: const Color(0xFF7271cf),
  ),
  PokemonTypeModel(
    name: "Ferro",
    nameApi: "",
    color: const Color(0xFF4d9da5),
  ),
  PokemonTypeModel(
    name: "Fogo",
    nameApi: "",
    color: const Color(0xFFffae4c),
  ),
  PokemonTypeModel(
    name: "Água",
    nameApi: "",
    color: const Color(0xFF559bd9),
  ),
  PokemonTypeModel(
    name: "Grama",
    nameApi: "",
    color: const Color(0xFF5bc06f),
  ),
  PokemonTypeModel(
    name: "Elétrico",
    nameApi: "",
    color: const Color(0xFFf9df6d),
  ),
  PokemonTypeModel(
    name: "Psíquico",
    nameApi: "",
    color: const Color(0xFFfe9b94),
  ),
  PokemonTypeModel(
    name: "Gelo",
    nameApi: "",
    color: const Color(0xFF8ad9d2),
  ),
  PokemonTypeModel(
    name: "Dragão",
    nameApi: "",
    color: const Color(0xFF017dbd),
  ),
  PokemonTypeModel(
    name: "Sombrio",
    nameApi: "",
    color: const Color(0xFF6f7684),
  ),
  PokemonTypeModel(
    name: "Fada",
    nameApi: "",
    color: const Color(0xFFf4a7e5),
  ),
];
