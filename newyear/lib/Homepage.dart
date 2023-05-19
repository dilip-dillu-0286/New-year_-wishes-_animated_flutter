import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfettiController _confettiControllerLeft;
  late ConfettiController _confettiControllerRight;
  late ConfettiController _confettiControllertopcenter;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _confettiControllerLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiControllerRight =
        ConfettiController(duration: const Duration(seconds: 10));

    showBanner();
  }

  @override
  void dispose() {
    _confettiControllerLeft.dispose();
    _confettiControllerRight.dispose();
    super.dispose();
  }

  showBanner() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _visible = true;
        _confettiControllerLeft.play();
        _confettiControllerRight.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1530323588099-931c746ab7f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedScale(
            scale: _visible ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Container(
              padding: const EdgeInsets.only(bottom: 250),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(color: Colors.black87),
                  children: [
                    TextSpan(
                      text: "HAPPY NEW YEAR \n ",
                      style: GoogleFonts.jua(
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextSpan(
                      text: "2023\n",
                      style: GoogleFonts.jua(
                        textStyle: const TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextSpan(
                      text: "Chinnu",
                      style: GoogleFonts.jua(
                        textStyle: const TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 600,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: RawMaterialButton(
                      onPressed: () {
                        _confettiControllerLeft.stop();
                        _confettiControllertopcenter.stop();
                      },
                      fillColor: Colors.red,
                      child: Text(
                        "stop",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _confettiControllerLeft,
              colors: [
                Colors.yellow,
                Colors.green,
                Colors.grey,
                Colors.pink.shade200
              ],
              blastDirection: -pi / 6,
              emissionFrequency: 0.05,
              numberOfParticles: 15,
              maximumSize: const Size(20, 10),
              maxBlastForce: 40,
              minBlastForce: 30,
              gravity: 0.1,
              shouldLoop: true,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              colors: [Colors.blue, Colors.orange.shade300],
              confettiController: _confettiControllerRight,
              blastDirection: -3 * pi / 4,
              emissionFrequency: 0.5,
              numberOfParticles: 10,
              maximumSize: const Size(20, 10),
              maxBlastForce: 40,
              minBlastForce: 30,
              gravity: 0.1,
              shouldLoop: true,
            ),
          ),
        ],
      ),
    );
  }
}
