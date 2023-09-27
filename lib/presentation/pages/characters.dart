import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/list_recicler.dart';
import 'package:rick_and_morty/utils/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // height: Dimensions.screeHeight,
            ListOfCharacters(),
          ],
        ),
      ),
    );
  }
}
