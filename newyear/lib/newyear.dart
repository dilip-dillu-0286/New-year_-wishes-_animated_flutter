import 'dart:math';

import 'package:flutter/material.dart';

import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';

class newyear extends StatefulWidget {
  @override
  State<newyear> createState() => _newyearState();
}

class _newyearState extends State<newyear> {
  late ConfettiController _confettiControllerLeft;
  late ConfettiController _confettiControllerRight;
  bool visible = false;

  @override
  void initistate() {
    _confettiControllerLeft = _confettiControllerRight;

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
        visible = true;
        _confettiControllerLeft.play();
        _confettiControllerRight.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 250),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AnimatedScale(
                scale: visible ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 250),
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.amberAccent),
                      children: [
                        TextSpan(
                          text: "HAPPY NEW YEAR\n ",
                          style: GoogleFonts.jua(
                            textStyle: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextSpan(
                          text: "2022",
                          style: GoogleFonts.jua(
                            textStyle: const TextStyle(
                                fontSize: 140, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: _confettiControllerLeft,
                  colors: [Colors.yellow, Colors.green, Colors.grey],
                  blastDirection: -pi / 5,
                  emissionFrequency: 0.01,
                  numberOfParticles: 40,
                  maximumSize: const Size(20, 10),
                  maxBlastForce: 40,
                  minBlastForce: 30,
                  gravity: 1,
                  shouldLoop: true,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _confettiControllerRight,
                  blastDirection: -3 * pi / 4,
                  emissionFrequency: 0.01,
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
        ],
      ),
    );
  }
}
