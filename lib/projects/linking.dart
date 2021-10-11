import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Linking extends StatelessWidget {
  Linking({Key? key}) : super(key: key);

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
                  child: Text('Сегодня без интерфейсов', style: style),
                ),
              ),
            ),

            RepaintBoundary(
              key: keys[1],
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Просто берем код на Rust', style: style),
                      const SizedBox(height: 48),
                      Image.asset('assets/images/linking/code1.jpeg', width: 510),
                    ],
                  ),
                ),
              ),
            ),

            RepaintBoundary(
              key: keys[2],
              child: Container(
                color: Colors.white,
                width: size.width,
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('И через FFI линкуем его \nк iOS приложенияю', style: style),
                      const SizedBox(width: 80),
                      Image.asset('assets/images/linking/screen.jpeg', width: 200),
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
                      Text('Потом вызываем в Swift', style: style),
                      const SizedBox(height: 48),
                      Image.asset('assets/images/linking/code2.png', width: 500),
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
