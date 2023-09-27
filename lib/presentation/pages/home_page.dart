
import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/list_recicler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [ListOfCharacters()],
      ),
    );
  }
}
