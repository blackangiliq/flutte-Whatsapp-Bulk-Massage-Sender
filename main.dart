import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(What());
}

class What extends StatefulWidget {
  const What({Key? key}) : super(key: key);

  @override
  State<What> createState() => _WhatState();
}

class _WhatState extends State<What> {
  TextEditingController MsgController = TextEditingController();
  TextEditingController NumberListControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(controller: MsgController),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: NumberListControler,
              maxLines: 20,
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              List Numbers = NumberListControler.text.split('\n');

              await Future.forEach(Numbers, (element) async {
                await Future.delayed(const Duration(seconds: 2));
                var startWhatsup = await Process.start('cmd', ['']);

                startWhatsup.stdin.writeln(
                    'start whatsapp://send?phone=964$element^&text=${MsgController.text}');

                var snedenter = await Process.start(
                    'cscript.exe', ['C:/Users/<ur pc username >/Desktop/sendenter.vbs']);
              });
            },
            child: Icon(Icons.send),
          )
        ],
      )),
    );
  }
}

// var startWhatsup = await Process.start('cmd', ['']);
//
// startWhatsup.stdin.writeln('start whatsapp://send?phone=KEY OF UR COUNTRY -UR NUMBER ^&text=TEXT ');
//
// var snedenter = await Process.start('cscript.exe', ['C:/Users/plack/Desktop/1.vbs']);
//
