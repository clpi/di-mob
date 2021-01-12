import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

enum BottomBarKind {
  Labels,
  NoLabels,
}

class DlBottomBar extends StatefulWidget {
  const DlBottomBar ({
    Key key,
    @required this.restorationId,
    @required this.type,
  }) : super(key: key);

  final String restorationId;
  final BottomBarKind type;

  @override 
  _DlBottomBarState createState() => _DlBottomBarState();
}

class _DlBottomBarState extends State<DlBottomBar>
  with RestorationMixin {
  final RestorableInt _idx = RestorableInt(0);

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket old, bool initRestore) {
    registerForRestoration(_idx, 'bottom_navigation_tab_index');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var items = [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Records",
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_rounded),
            activeIcon: Icon(Icons.person_outline_rounded),
          ),
          BottomNavigationBarItem(
            label: "Prefs",
            icon: Icon(Icons.settings_rounded),
            activeIcon: Icon(Icons.settings_outlined),
          )
    ];

    return BottomNavigationBar(
      items: items,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: _idx.value,
      selectedFontSize: textTheme.caption.fontSize,
      unselectedFontSize: textTheme.caption.fontSize,
      iconSize: 20.0,
      backgroundColor: Colors.black38,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70.withOpacity(0.5),
      type: BottomNavigationBarType.fixed,
      elevation: 2.0,
      onTap: (index) {
        setState(() { _idx.value = index; });
      },
      // selectedItemColor: colorScheme.onPrimary,
      // unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
      // backgroundColor: Colors.black
    );
  }

  Widget alt() {
    return BottomAppBar(
        elevation: 2.0,
        color: Colors.black12,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      );
  }
}