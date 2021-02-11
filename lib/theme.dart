import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DlTheme {

  static ThemeData get theme {
    final themeData = ThemeData.dark();
    final textTheme = themeData.textTheme;
    final body1 = textTheme.bodyText1.copyWith(decorationColor: Colors.transparent);

    return ThemeData(
          // scaffoldBackgroundColor: Color.fromRGBO(40, 35, 40, 1),
          scaffoldBackgroundColor: Color.fromRGBO(245, 235, 245, 1),
          accentColor: Colors.deepOrangeAccent,
          primaryColor: Colors.deepPurpleAccent,
          applyElevationOverlayColor: true,
          backgroundColor: Colors.black54,
          splashColor: Colors.deepPurple,
          canvasColor: Color.fromRGBO(40,40,40,1),
          primaryColorLight: Colors.deepPurpleAccent,
          primaryColorDark: Colors.deepPurpleAccent,
          selectedRowColor: Colors.deepPurpleAccent,
          bottomAppBarColor: Color(0xff3ecf60),
          cardTheme: CardTheme(
            elevation: 4.0,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(3.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            // color: Color.fromRGBO(255, 255, 255, 0.9),
            color: Colors.deepPurpleAccent,
          ),
          textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(bodyColor: Colors.black26),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepPurpleAccent
          ),
          appBarTheme: AppBarTheme(
            elevation: 4.0,
            centerTitle: true,
            color: Color(0xff3ecf60),
            // color: Colors.lightGreen,
            textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(bodyColor: Colors.black26),
          ),
          fontFamily: "IBM Plex Sans",
          primarySwatch: Colors.deepPurple,
          colorScheme: const ColorScheme.dark(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textSelectionColor: Colors.deepPurple,
          toggleableActiveColor: Colors.deepPurpleAccent,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            // backgroundColor: Color(0xff54b378),
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.black26,
            elevation: 4.0,
          ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: themeData.dialogBackgroundColor,
            contentTextStyle: TextStyle(fontFamily: "IBM Plex Sans Mono", color: Colors.white),
            actionTextColor: Colors.white,
          ),
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        );
  }
}
