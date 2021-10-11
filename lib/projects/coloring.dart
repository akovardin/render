import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Coloring extends StatelessWidget {
  Coloring({Key? key}) : super(key: key);

  List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
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
                  child: Text('Совсем чуть красоты', style: style),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[1],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Center(
                  child: Text('В этом проекте получим\nпалитры из изображения', style: style, textAlign: TextAlign.center),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Берем штурмовика', style: style),
                      const SizedBox(height: 48),
                      Image.asset('assets/images/coloring/avatar.jpg', width: 410),
                    ],
                  ),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[3],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Достаем основные цвета и сортируем', style: style),
                      const SizedBox(height: 48),
                      Image.asset('assets/images/coloring/colors.png', width: 410),
                    ],
                  ),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[4],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Усредняем и получаем палитру', style: style),
                      const SizedBox(height: 48),
                      Image.asset('assets/images/coloring/palette.png', width: 410),
                    ],
                  ),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[5],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Center(
                  child: Text('#codober', style: style),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
