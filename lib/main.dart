import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'div.is',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: const ColorScheme.dark(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: MyHomePage(title: 'div.is'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _slowAnim = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(children: <Widget>[
            _TransitionListTile(
                title: "Container transf",
                sub: "Open container",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return ButtonBar();
                  }));
                }),
            _TransitionListTile(
                title: "Item 2",
                sub: "Open container",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return Material();
                  }));
                })
          ]))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _TransitionListTile extends StatelessWidget {
  const _TransitionListTile({
    this.onTap,
    this.title,
    this.sub,
  });

  final GestureTapCallback onTap;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Icon(Icons.play_arrow, size: 35),
      ),
      onTap: onTap,
      title: Text(title),
      subtitle: Text(sub),
    );
  }
}
