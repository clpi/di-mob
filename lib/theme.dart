import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DlTheme {

  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Color(0xff1f1f1f);
  static Color green = Color(0xffb0fe76);
  static Color greenAccent = Color(0xffb0fe76);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Color(0xff262029);


  static ThemeData lightTheme = ThemeData(

  );

  // dark theme
  static ThemeData get theme {
    final themeData = ThemeData.dark();
    final textTheme = themeData.textTheme;
    final body1 = textTheme.bodyText1.copyWith(decorationColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(
         SystemUiOverlayStyle.dark.copyWith(
          //  statusBarColor: Colors.white,
           systemNavigationBarColor: Colors.black,
           statusBarIconBrightness: Brightness.dark,
           statusBarBrightness: Brightness.dark,
           systemNavigationBarDividerColor: Colors.white,
           systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return ThemeData(
          scaffoldBackgroundColor: Color(0xff1f1a23),
          // scaffoldBackgroundColor: Color.fromRGBO(245, 235, 245, 1),
          // accentColor: Color(0xffffffff),
          applyElevationOverlayColor: true,
          backgroundColor: Colors.black54,
          splashColor: Color(0xFF8ade50),
          canvasColor: Color.fromRGBO(40,40,40,1),
          primaryColorLight: Color(0xffb0fe76),
          primaryColorDark: Color(0xffb0fe76),
          selectedRowColor: Color(0xffb0fe76),
          // bottomAppBarColor: Color(0xff3ecf60),
          // bottomAppBarColor: Colors.purple,
          // bottomAppBarColor: Color(0xff0a080f),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white.withOpacity(0.09),
            elevation: 8.0,
            unselectedIconTheme: IconThemeData(color: Colors.white70, opacity: 1.0, size: 25),
            selectedIconTheme: IconThemeData(color: Colors.white, opacity: 1.0, size: 20),
            selectedLabelStyle: GoogleFonts.sourceSansPro().copyWith(fontWeight: FontWeight.bold),
            unselectedLabelStyle: GoogleFonts.sourceSansPro(),
            showUnselectedLabels: false,
            showSelectedLabels: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.white.withOpacity(0.12),
            elevation: 8.0,
            shape: CircularNotchedRectangle(),
          ),
          cardTheme: CardTheme(
            elevation: 2.0,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.white.withOpacity(0.11),
            shadowColor: Colors.black54,

          ),
          accentColorBrightness: Brightness.light,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Color(0xff1a181f),
            modalBackgroundColor: Color(0xff0a080f),
            clipBehavior: Clip.antiAlias,
            elevation: 3.0,
            modalElevation: 5.0,
          ),
          // textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(bodyColor: Colors.black26),
          // textTheme: GoogleFonts.firaSansTextTheme(),
          textTheme: GoogleFonts.sourceSansProTextTheme().apply(
            bodyColor: Colors.white30, 
            decorationColor: Color(0xffb0fe76),
            displayColor: Color(0xffb0fe76)
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xffb0fe76),
          ),
          appBarTheme: AppBarTheme(
            elevation: 3.0,
            centerTitle: true,
            // color: Color(0xff3ecf60),
            actionsIconTheme: IconThemeData(
              color: Color(0xffffffff),
              opacity: 100.0,          
            ),
            // color: Color(0xff0a080f),
            color: Colors.white.withOpacity(0.13),
            brightness: Brightness.light,
            // color: Color(0xff3a383f),
            textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(bodyColor: Colors.white),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          primaryIconTheme: IconThemeData(
            color: Colors.white,
          ),
          accentIconTheme: IconThemeData(
            color: Colors.white,
          ),
          fontFamily: "IBM Plex Sans",
          colorScheme: const ColorScheme.dark(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textSelectionColor: Color(0xffb0fe76),
          toggleableActiveColor: Color(0xffb0fe76),
          accentColor: Color(0xffb0fe76),
          buttonBarTheme: ButtonBarThemeData(
            buttonTextTheme: ButtonTextTheme.normal,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          
            // backgroundColor: Color(0xff54b378),
            // backgroundColor: Colors.greenAccent,
            // backgroundColor: Colors.purpleAccent,
            backgroundColor:  Color(0xffB0FE76),
            foregroundColor: Color(0xff1a181f),
            elevation: 2.0,
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
