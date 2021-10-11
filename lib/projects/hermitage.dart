import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hermitage extends StatelessWidget {
  Hermitage({Key? key}) : super(key: key);

  List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var style = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w100,
        height: 1.5, // the height between text, default is 1.0
        letterSpacing: 1.0,
      ),
    );

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            RepaintBoundary(
              key: keys[0],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Center(
                  child: Text('Никаких сложных проектов\nпо пятницам', style: style, textAlign: TextAlign.center),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[1],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Center(
                  child: Text('Только хорошая музыка\nна радио эрмитаж', style: style, textAlign: TextAlign.center),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[2],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Center(
                    child: Image.asset('assets/images/hermitage/hermitage.png', width: 410),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
