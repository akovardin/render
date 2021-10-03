import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Render',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<GlobalKey> keys = [
    new GlobalKey(),
    new GlobalKey(),
    new GlobalKey(),
    new GlobalKey(),
    new GlobalKey(),
    new GlobalKey(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var style = GoogleFonts.roboto(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w100));

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
            child: OutlinedButton(
              onPressed: () async {
                for (final key in keys) {
                  final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
                  final image = await boundary?.toImage();
                  final data = await image?.toByteData(format: ui.ImageByteFormat.png);
                  final bytes = data?.buffer.asUint8List();

                  if (bytes != null) {
                    final dir = await getApplicationDocumentsDirectory();
                    final path = '${dir.path}/${key.hashCode.toString()}.png';
                    final file = await File(path).create();
                    await file.writeAsBytes(bytes);
                  }
                }
              },
              child: const Text('Render'),
            ),
          ),
          Expanded(
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
                            Image.asset('assets/images/flutter.png', width: 200),
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
                            Image.asset('assets/images/screenshot1.png', width: 600,),
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
                            Image.asset('assets/images/screenshot2.png', height: 340,),
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
          ),
        ],
      ),
    );
  }
}

