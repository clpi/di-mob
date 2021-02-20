import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DlPalette {
  static Color green = Color(0xffb0fe76);
  static Color black = Color(0xff0a080f);
  static Color darkestGray = Color(0xff1a181f);
  static Color darkGray = Color(0xff1f1a23); //ALSO BG
  static Color white = Color(0xffffffff);
  static Color white70 = white.withOpacity(0.7);

  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Color(0xff1f1f1f);
  static Color greenAccent = Color(0xffb0fe76);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Color(0xff262029);
}

class DlTextTheme {
  static TextTheme get dark {
    return GoogleFonts.sourceSansProTextTheme().apply(
      bodyColor: Colors.white30, 
      decorationColor: DlPalette.green,
      displayColor: DlPalette.green,
    );
  }
}

class DlCardTheme {

  static CardTheme get dark {
    return CardTheme(
      elevation: 3.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(9.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: Colors.white.withOpacity(0.11),
      shadowColor: Colors.black54,
    );
  }

  static CardTheme get light {
    return CardTheme(
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white.withOpacity(0.11),
      shadowColor: Colors.black54,
    );
  }
}

class DlBottomNavigationBarTheme {

  static final BottomNavigationBarThemeData dark = BottomNavigationBarThemeData(
    backgroundColor: Colors.white.withOpacity(0.09),
    elevation: 10.0,
    unselectedIconTheme: IconThemeData(color: DlPalette.white70, size: 25),
    selectedIconTheme: IconThemeData(color: DlPalette.white, size: 20),
    selectedLabelStyle: GoogleFonts.sourceSansPro().copyWith(fontWeight: FontWeight.bold),
    unselectedLabelStyle: GoogleFonts.sourceSansPro(),
    showUnselectedLabels: false,
    showSelectedLabels: true,
    selectedItemColor: DlPalette.white,
    unselectedItemColor: DlPalette.white70,
    type: BottomNavigationBarType.shifting,
  );

  static final BottomNavigationBarThemeData light = BottomNavigationBarThemeData(
    backgroundColor: Colors.white.withOpacity(0.09),
    elevation: 8.0,
    unselectedIconTheme: IconThemeData(color: DlPalette.white70, size: 25),
    selectedIconTheme: IconThemeData(color: DlPalette.white, size: 20),
    selectedLabelStyle: GoogleFonts.sourceSansPro().copyWith(fontWeight: FontWeight.bold),
    unselectedLabelStyle: GoogleFonts.sourceSansPro(),
    showUnselectedLabels: false,
    showSelectedLabels: true,
    selectedItemColor: DlPalette.white,
    unselectedItemColor: DlPalette.white70,
    type: BottomNavigationBarType.fixed,
  );

  static final BottomAppBarTheme darkAppBar = BottomAppBarTheme(
    color: Colors.white.withOpacity(0.12),
    elevation: 8.0,
    shape: CircularNotchedRectangle(),
  );
}

class DlSheetTheme {

  static BottomSheetThemeData get dark {
    return BottomSheetThemeData(
      backgroundColor: DlPalette.darkGray,
      modalBackgroundColor: DlPalette.darkGray,
      clipBehavior: Clip.antiAlias,
      elevation: 3.0,
      modalElevation: 5.0,
    );
  }
}

class DlButtonTheme {
  static ButtonThemeData get dark {
    return ButtonThemeData(
      buttonColor: DlPalette.green,
    );
  }
}

class DlAppBarTheme {
  static AppBarTheme get dark {
    return AppBarTheme(
      elevation: 3.0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: DlPalette.white,
        opacity: 100.0,          
      ),
      color: Colors.white.withOpacity(0.13),
      brightness: Brightness.light,
      textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(bodyColor: DlPalette.white),
    );
  }
}

class DlFabTheme {
  static FloatingActionButtonThemeData get dark {
    return FloatingActionButtonThemeData(
      backgroundColor: DlPalette.green,
      foregroundColor: DlPalette.darkestGray,
      elevation: 2.0,
    );
  }
}

class DlSnackBarTheme {
  static SnackBarThemeData get dark {
    return SnackBarThemeData(
      backgroundColor: Colors.white12,
      contentTextStyle: TextStyle(fontFamily: "IBM Plex Sans Mono", color: DlPalette.white),
      actionTextColor: Colors.white,
    );
  }
}

class DlPageTransitionsTheme {
  static PageTransitionsTheme get normal {
    return PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      }
    );
  }
}

class DlTheme {

  static ThemeData get dark {
    final themeData = ThemeData.dark();
    SystemChrome.setSystemUIOverlayStyle(
         SystemUiOverlayStyle.dark.copyWith(
           systemNavigationBarColor: Colors.black,
           statusBarIconBrightness: Brightness.dark,
           statusBarBrightness: Brightness.dark,
           systemNavigationBarDividerColor: Colors.white,
           systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return ThemeData(
      scaffoldBackgroundColor: DlPalette.darkGray,
      applyElevationOverlayColor: true,
      backgroundColor: Colors.black54,
      splashColor: DlPalette.greenAccent,
      canvasColor: Color.fromRGBO(40,40,40,1),
      primaryColorLight: DlPalette.green,
      primaryColorDark: DlPalette.green,
      selectedRowColor: DlPalette.green,
      bottomNavigationBarTheme: DlBottomNavigationBarTheme.dark,
      // bottomAppBarTheme: DlBottomNavigationBarTheme.darkAppBar,
      accentColorBrightness: Brightness.light,
      bottomSheetTheme: DlSheetTheme.dark,
      textTheme: DlTextTheme.dark,
      buttonTheme: DlButtonTheme.dark,
      appBarTheme: DlAppBarTheme.dark,
      iconTheme: IconThemeData(color: DlPalette.white, size: 25),
      cardTheme: DlCardTheme.dark,
      primaryIconTheme: IconThemeData(color: DlPalette.white),
      accentIconTheme: IconThemeData(color: DlPalette.white,),
      colorScheme: const ColorScheme.dark(),
      floatingActionButtonTheme: DlFabTheme.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionColor: DlPalette.greenAccent,
      toggleableActiveColor: DlPalette.greenAccent,
      accentColor: DlPalette.greenAccent,
      buttonBarTheme: ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.normal, ),
      snackBarTheme: DlSnackBarTheme.dark,
      pageTransitionsTheme: DlPageTransitionsTheme.normal,
    );
  }
}
