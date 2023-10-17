// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Gradient.linear(, to, colors),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Genshin Impact',
                style: GoogleFonts.indieFlower(
                    textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),
              ),
              Spacer(),
              Container(
                child: Image.asset('assets/paimon.png'),
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                icon: Icon(Icons.shopping_bag_outlined),
                label: Text(
                  'Buy Figurines',
                  style: GoogleFonts.caveat(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 244, 177, 126))),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
