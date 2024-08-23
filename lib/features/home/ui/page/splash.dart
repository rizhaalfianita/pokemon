import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/features/home/ui/page/home.dart';
import 'package:pokemon/shared/const/constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pokemon.png",
              height: 38,
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text("Pokemon",
                style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                        color: white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)))
          ],
        ),
      ),
    );
  }
}
