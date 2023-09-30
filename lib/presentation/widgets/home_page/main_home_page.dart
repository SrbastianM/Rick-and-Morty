import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/home_page/widgets/button_home_page.dart';
import 'package:rick_and_morty/presentation/widgets/home_page/widgets/image_home_page.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageHomePage(),
    );
  }
}
