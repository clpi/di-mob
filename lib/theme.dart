import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DlTheme {

  static ThemeData get theme {
    final themeData = ThemeData.dark();
    final textTheme = themeData.textTheme;
    final body1 = textTheme.bodyText1.copyWith(decorationColor: Colors.transparent);

    return ThemeData(
          accentColor: Colors.lightBlueAccent,
          primaryColor: Colors.deepPurpleAccent,
          applyElevationOverlayColor: true,
          backgroundColor: Colors.black54,
          splashColor: Colors.purpleAccent,
          cardColor: Colors.white,
          cardTheme: CardTheme(
            elevation: 4.0,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(3.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            // color: Color.fromRGBO(255, 255, 255, 0.9),
            color: Colors.deepPurpleAccent,
          ),
          textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(bodyColor: Colors.white),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepPurpleAccent
          ),
          appBarTheme: AppBarTheme(
            elevation: 4.0,
            centerTitle: true,
            color: Colors.deepPurpleAccent,
            textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(bodyColor: Colors.white),
          ),
          fontFamily: "IBM Plex Sans",
          primarySwatch: Colors.deepPurple,
          colorScheme: const ColorScheme.dark(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textSelectionColor: Colors.deepPurple,
          toggleableActiveColor: Colors.deepPurpleAccent,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurpleAccent,
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