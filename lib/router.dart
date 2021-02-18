import 'package:flutter/material.dart';

class DlRoutes {
  static final home = "/";
  static final records = "/records";
  static final preferences = "/preferences";
}

class DlRouter {
  static Future pushPage(BuildContext context, Widget page) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  static pushPageDialog(BuildContext context, Widget page) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
        fullscreenDialog: true,
      ),
    );
  }

  static pushPageReplacement(BuildContext context, Widget page) async {
    return await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}

// Route<dynamic> _onGenerateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case "/":
//       return MaterialPageRoute(builder: (BuildContext context) {
//         return PageSwitch();
//       });
//     case "/notifications":
//       return MaterialPageRoute(builder: (BuildContext context) {
//         return Notifications();
//       });
//     case "/search-results":
//       return MaterialPageRoute(builder: (BuildContext context) {
//         return Notifications();
//       });
//     case "/single-news":
//       return MaterialPageRoute(builder: (BuildContext context) {
//         return SingleNewsPage();
//       });
//     default:
//       return MaterialPageRoute(builder: (BuildContext context) {
//         return PageSwitch();
//       });
//   }
// }
