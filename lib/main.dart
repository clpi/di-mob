import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dimo/screens/home/home.dart';
import 'package:dimo/screens/records/records.dart';
import 'package:dimo/screens/user/user.dart';
import 'package:dimo/screens/prefs/prefs.dart';

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'div.is',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "Home": (BuildContext context) => MyHomePage(),
        "Records": (BuildContext context) => RecordPage(),
        "User": (BuildContext context) => UserPage(),
        "Prefs": (BuildContext context) => PrefsPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.nanumPenScriptTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.black87),
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
