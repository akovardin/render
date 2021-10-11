import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:render/projects/hermitage.dart';

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
      builder: BotToastInit(),
      //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Render(),
    );
  }
}

class Render extends StatefulWidget {
  Render({Key? key}) : super(key: key);

  @override
  State<Render> createState() => _RenderState();
}

class _RenderState extends State<Render> {
  String dir = '';

  @override
  void initState() {
    super.initState();

    getApplicationDocumentsDirectory().then((value) {
      setState(() {
        dir = value.path;
        print(dir);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = Hermitage();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    for (final key in w.keys) {
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
                SizedBox(width: 24),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: '$dir'));
                    BotToast.showSimpleNotification(title: "Copied");
                  },
                  child: Container(
                    child: Text('$dir'),
                  ),
                ),
              ],
            ),
          ),
          w,
        ],
      ),
    );
  }
}
