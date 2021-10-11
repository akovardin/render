import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Rendering extends StatelessWidget {
  Rendering({Key? key}) : super(key: key);

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
    var style = GoogleFonts.roboto(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w100));

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
                  child: Text('Все изображения в этой каруселе', style: style),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[1],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Center(
                  child: Text('Сгенерированы кодом', style: style),
                ),
              ),
            ),
            RepaintBoundary(
              key: keys[2],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('С помощью Flutter', style: style),
                      const SizedBox(height: 48),
                      Image.asset('assets/images/rendering/flutter.png', width: 200),
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
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Генерация изображений из виждетов:', style: style),
                      const SizedBox(height: 48),
                      Image.asset(
                        'assets/images/rendering/screenshot1.png',
                        width: 600,
                      ),
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
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Пример верстки кадра карусели:', style: style),
                      const SizedBox(height: 48),
                      Image.asset(
                        'assets/images/rendering/screenshot2.png',
                        height: 340,
                      ),
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
